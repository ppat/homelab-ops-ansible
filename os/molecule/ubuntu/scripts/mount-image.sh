#!/bin/bash
set -eo pipefail

select_root_partition() {
  local device=$1
  parted $device unit B print --script --machine | grep ext4 | cut -d':' -f1
}

select_boot_partition() {
  local device=$1
  parted $device unit B print --script --machine | grep 'boot, esp;' | cut -d':' -f1
}

grow_partition() {
  local device=$1
  local partition=$2

  # print partition table before growing it
  parted --script $device unit MiB print
  echo

  # resize last partition of image file to fill all available space
  echo "Growing partition to fill available space..."
  growpart $device $partition
  echo "Fsck'ing the partition..."
  e2fsck -f ${device}p${partition}
  echo "Resizing file system..."
  resize2fs ${device}p${partition}
  echo

  # print partition table after growing it
  parted --script $device unit MiB print
  echo
}

grow_root_partition() {
  local device=$1
  local partition=$(select_root_partition $device)

  grow_partition $device $partition
}

mount_image_partitions() {
  local device=$1
  local root_mount=$2
  local boot_mount=$3

  local root_partition="$(select_root_partition $device)"
  local boot_partition="$(select_boot_partition $device)"

  echo "Mounting root partition..."
  mkdir -p $root_mount
  mount -t ext4 ${device}p${root_partition} $root_mount

  if [[ "$boot_mount" != "-" ]]; then
    echo "Mounting boot partition..."
    mkdir -p ${root_mount}${boot_mount}
    mount -t vfat ${device}p${boot_partition} $root_mount${boot_mount}
  else
    echo "Skipping mounting of boot partition..."
  fi
  echo
}

mount_system_partitions_for_chroot() {
  local root_mount=$1

  echo "Mounting system partitions needed for chroot..."
  set -x
  mount --bind /dev $root_mount/dev
  mount -t devpts devpts $root_mount/dev/pts
  mount -t proc proc $root_mount/proc
  mount -t binfmt_misc binfmt_misc $root_mount/proc/sys/fs/binfmt_misc
  mount -t sysfs sysfs $root_mount/sys
  set +x
  echo
}

display_mounted_partitions() {
  local device=$1
  local root_mount=$2

  echo "lsblk:"
  lsblk --fs -o NAME,LABEL,MOUNTPOINTS,FSTYPE,FSSIZE,FSUSE%,SIZE $device
  echo
  echo "findmnt:"
  findmnt --submounts $root_mount
  echo
}

main() {
  local image_file=$1
  local system_mount=$2
  local boot_mount=$3

  echo "Expanding size of image file by 2GiB..."
  dd if=/dev/zero bs=1M count=2048 >> $image_file
  echo "done."
  echo

  echo "Selecting next available loop device..."
  local device=$(sudo losetup -f)
  echo

  echo "Assigning loop device $device to $image_file..."
  losetup -P $device $image_file
  echo "assigned."

  grow_root_partition $device
  mount_image_partitions $device $system_mount $boot_mount
  mount_system_partitions_for_chroot $system_mount
  display_mounted_partitions $device $system_mount
}


if [[ $EUID -ne 0 ]]; then
  echo "Must be run as root."
  exit 1
fi

IMAGE_FILE=""
SYSTEM_ROOT=""
BOOT_ROOT="-"

while [ $# -gt 0 ]; do
  case "$1" in
    --image)
      IMAGE_FILE="$2"; shift
      ;;
    --system-root)
      SYSTEM_ROOT="$2"; shift
      ;;
    --boot-root)
      BOOT_ROOT="$2"; shift
      ;;
    *)
      echo "Invalid parameter: ${1}"; echo; exit 1
  esac
  shift
done

if [[ -z "$IMAGE_FILE" || -z "$SYSTEM_ROOT" ]]; then
  echo "All parameters required (--image, --system-root, --boot-root)"
  exit 1
fi

main $IMAGE_FILE $SYSTEM_ROOT $BOOT_ROOT
