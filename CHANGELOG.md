# Changelog



## [1.0.1](https://github.com/ppat/homelab-ops-ansible/compare/v1.0.0...v1.0.1) (2024-06-15)


### 🐛 Enhancements + Bug Fixes

* **os:** fix issue where initramfs generation and kernel uncompress steps did not run ([#67](https://github.com/ppat/homelab-ops-ansible/issues/67)) ([9c88a30](https://github.com/ppat/homelab-ops-ansible/commit/9c88a30))
* **deps:** update npm non-major dependencies ([#55](https://github.com/ppat/homelab-ops-ansible/issues/55)) ([4265893](https://github.com/ppat/homelab-ops-ansible/commit/4265893))
* **other:** pin requests package version to be < 2.32.0 as it breaks molecule ([#51](https://github.com/ppat/homelab-ops-ansible/issues/51)) ([178723c](https://github.com/ppat/homelab-ops-ansible/commit/178723c))


### ⚙️ Other

* **deps:** update nginx docker digest to 56b388b ([#63](https://github.com/ppat/homelab-ops-ansible/issues/63)) ([4e90961](https://github.com/ppat/homelab-ops-ansible/commit/4e90961))
* **other:** update renovate config ([#59](https://github.com/ppat/homelab-ops-ansible/issues/59)) ([87f9c34](https://github.com/ppat/homelab-ops-ansible/commit/87f9c34))
* **other:** update renovate config with better groupings ([#54](https://github.com/ppat/homelab-ops-ansible/issues/54)) ([aa8ce01](https://github.com/ppat/homelab-ops-ansible/commit/aa8ce01))
* **other:** update renovate configuration ([#62](https://github.com/ppat/homelab-ops-ansible/issues/62)) ([fdf4723](https://github.com/ppat/homelab-ops-ansible/commit/fdf4723))


### 📌 Dependencies

* **deps:** pin nginx docker tag to 0f04e4f ([#60](https://github.com/ppat/homelab-ops-ansible/issues/60)) ([3197ab5](https://github.com/ppat/homelab-ops-ansible/commit/3197ab5))
* **deps:** update all ansible-galaxy non-major dependencies ([#26](https://github.com/ppat/homelab-ops-ansible/issues/26)) ([5dad1b5](https://github.com/ppat/homelab-ops-ansible/commit/5dad1b5)
* **deps:** update all python non-major dependencies ([#56](https://github.com/ppat/homelab-ops-ansible/issues/56)) ([d7870a5](https://github.com/ppat/homelab-ops-ansible/commit/d7870a5))
* **deps:** update dependency ansible-core to v2.16.7 ([#64](https://github.com/ppat/homelab-ops-ansible/issues/64)) ([98714b9](https://github.com/ppat/homelab-ops-ansible/commit/98714b9))
* **deps:** update dependency community.general to v8.6.1 ([#49](https://github.com/ppat/homelab-ops-ansible/issues/49)) ([13dab94](https://github.com/ppat/homelab-ops-ansible/commit/13dab94))
* **deps:** update dependency fluxcd/flux2 to v2.3.0 ([#45](https://github.com/ppat/homelab-ops-ansible/issues/45)) ([328c070](https://github.com/ppat/homelab-ops-ansible/commit/328c0702))
* **deps:** update dependency k3s-io/k3s to v1.30.1+k3s1 ([#46](https://github.com/ppat/homelab-ops-ansible/issues/46)) ([ebe543f](https://github.com/ppat/homelab-ops-ansible/commit/ebe543f))
* **deps:** update dependency kubernetes to v29 ([#27](https://github.com/ppat/homelab-ops-ansible/issues/27)) ([53e2498](https://github.com/ppat/homelab-ops-ansible/commit/53e2498))
* **deps:** update dependency kubernetes to v30 ([#58](https://github.com/ppat/homelab-ops-ansible/issues/58)) ([595a6ee](https://github.com/ppat/homelab-ops-ansible/commit/595a6ee))
* **deps:** update dependency requests to v2.32.2 [security] ([#61](https://github.com/ppat/homelab-ops-ansible/issues/61)) ([c16434b](https://github.com/ppat/homelab-ops-ansible/commit/c16434b))
* **deps:** update dependency rhysd/actionlint to v1.6.27 ([#42](https://github.com/ppat/homelab-ops-ansible/issues/42)) ([a8855e7](https://github.com/ppat/homelab-ops-ansible/commit/a8855e7))
* **deps:** update dependency rhysd/actionlint to v1.7.1 ([#47](https://github.com/ppat/homelab-ops-ansible/issues/47)) ([557bbfc](https://github.com/ppat/homelab-ops-ansible/commit/557bbfc))
* **deps:** update github-action dependencies ([#28](https://github.com/ppat/homelab-ops-ansible/issues/28)) ([511c0d6](https://github.com/ppat/homelab-ops-ansible/commit/511c0d6))
* **deps:** update minimum required versions of ansible-core and collections ([#66](https://github.com/ppat/homelab-ops-ansible/issues/66)) ([7cd4246](https://github.com/ppat/homelab-ops-ansible/commit/7cd4246))


## 1.0.0 (2024-05-06)


### ✨ Features

* **archive:** introduce homelab_ops.archive collection ([#13](https://github.com/ppat/homelab-ops-ansible/issues/13)) ([7474b89](https://github.com/ppat/homelab-ops-ansible/commit/7474b896ee6b2b2b862b27061484edb5b5702dde))
* **block_device:** introduce homelab_ops.block_device collection ([#14](https://github.com/ppat/homelab-ops-ansible/issues/14)) ([d2f77a5](https://github.com/ppat/homelab-ops-ansible/commit/d2f77a57e37c9b1c890b7ad421345c44b120ed49))
* **configure:** introduce homelab_ops.configure collection ([#19](https://github.com/ppat/homelab-ops-ansible/issues/19)) ([d3dc563](https://github.com/ppat/homelab-ops-ansible/commit/d3dc563f64128fe430f6fe1803c162aa9067117c))
* **k3s:** introduce homelab_ops.k3s collection ([#22](https://github.com/ppat/homelab-ops-ansible/issues/22)) ([0e3c4be](https://github.com/ppat/homelab-ops-ansible/commit/0e3c4be36412bce5e7b2b6285bc713505565e87d))
* **os:** introduce homelab_ops.os collection ([#30](https://github.com/ppat/homelab-ops-ansible/issues/30)) ([d71ccfd](https://github.com/ppat/homelab-ops-ansible/commit/d71ccfdb4275ac4c2e0459c845b6122eee08ce9a))
* **packages:** introduce homelab_ops.packages collection ([3d4a4c7](https://github.com/ppat/homelab-ops-ansible/commit/3d4a4c7ca630636349a797f9efe479bc82b3ba6f))
* **raspberry_pi:** introduce homelab_ops.raspberry_pi collection ([#33](https://github.com/ppat/homelab-ops-ansible/issues/33)) ([12aec3a](https://github.com/ppat/homelab-ops-ansible/commit/12aec3a953922b82cbba00cd88926b25f70fcef7))


### 🐛 Enhancements + Bug Fixes

* **deps:** update all npm non-major dependencies ([#5](https://github.com/ppat/homelab-ops-ansible/issues/5)) ([4c7a63b](https://github.com/ppat/homelab-ops-ansible/commit/4c7a63bc9f7846ea3175b3c78bfb17bb3a4bf41d))


### ⚙️ Other

* **k3s:** fix k3s github action where branch was selected incorrectly when run on main branch ([#36](https://github.com/ppat/homelab-ops-ansible/issues/36)) ([e0148af](https://github.com/ppat/homelab-ops-ansible/commit/e0148af68ea5bd00eb7b0f7b9f3fa9bbe1b20318))
* **k3s:** fix k3s github action where branch was selected incorrectly when run on main branch ([#37](https://github.com/ppat/homelab-ops-ansible/issues/37)) ([07eda30](https://github.com/ppat/homelab-ops-ansible/commit/07eda309a1e2c14cf525ea004f885be356b612ce))
* **other:** add renovate config for updating versions in yaml files ([6307a62](https://github.com/ppat/homelab-ops-ansible/commit/6307a6296f431d1912b775a1ded09ea1a1f720ba))
* **other:** update renovate config for github actions update ([#40](https://github.com/ppat/homelab-ops-ansible/issues/40)) ([0f6fac4](https://github.com/ppat/homelab-ops-ansible/commit/0f6fac47f0d5cc7da709b3ac0d8db4b010aef423))
* **release:** update release github-action to publish to ansible-galaxy ([#43](https://github.com/ppat/homelab-ops-ansible/issues/43)) ([a37f6d1](https://github.com/ppat/homelab-ops-ansible/commit/a37f6d1e023b50355a0be62c0f1f4a29de1713c1))


### 📌 Dependencies

* **deps:** bump tar and npm ([#31](https://github.com/ppat/homelab-ops-ansible/issues/31)) ([3378cd9](https://github.com/ppat/homelab-ops-ansible/commit/3378cd9fa216fdaa286466182dd9f4c6ac8a9069))
* **deps:** update all python major dependencies (major) ([#7](https://github.com/ppat/homelab-ops-ansible/issues/7)) ([d818016](https://github.com/ppat/homelab-ops-ansible/commit/d8180166bbf8216e5739c2968c5540f7dca14dad))
* **deps:** update all python non-major dependencies ([#16](https://github.com/ppat/homelab-ops-ansible/issues/16)) ([f3a4ab9](https://github.com/ppat/homelab-ops-ansible/commit/f3a4ab99bb0701188cb6bef132b55735d3d03208))
* **deps:** update all python non-major dependencies ([#18](https://github.com/ppat/homelab-ops-ansible/issues/18)) ([617a0cc](https://github.com/ppat/homelab-ops-ansible/commit/617a0cc9658662765694ca60402eb9ff536d3d4f))
* **deps:** update all python non-major dependencies ([#4](https://github.com/ppat/homelab-ops-ansible/issues/4)) ([8331d9f](https://github.com/ppat/homelab-ops-ansible/commit/8331d9f6af410b2e0be59217c5fd59fe0581f6da))
* **deps:** update dependency ansible-core to v2.15.9 [security] ([#12](https://github.com/ppat/homelab-ops-ansible/issues/12)) ([a833378](https://github.com/ppat/homelab-ops-ansible/commit/a833378f1515f1c770d5b9cf12a1e26b832ac8a5))
* **deps:** update dependency ansible-core to v2.16.6 ([#25](https://github.com/ppat/homelab-ops-ansible/issues/25)) ([4db290e](https://github.com/ppat/homelab-ops-ansible/commit/4db290edd7a54f62d4eb3038b8deabab37a62f1d))
* **deps:** update dependency k3s-io/k3s to v1.29.4+k3s1 ([#24](https://github.com/ppat/homelab-ops-ansible/issues/24)) ([7469ff8](https://github.com/ppat/homelab-ops-ansible/commit/7469ff8d4c66dbe855e00901d6d51d8971792d12))
* **deps:** update dependency nestybox/sysbox to v0.6.4 ([#41](https://github.com/ppat/homelab-ops-ansible/issues/41)) ([1e1c6c4](https://github.com/ppat/homelab-ops-ansible/commit/1e1c6c47ad856746e1a12b04c3495fd08ac04954))
* **deps:** upgrade commitlint and semantic-release while fixing breaking changes with require in commitlint ([#32](https://github.com/ppat/homelab-ops-ansible/issues/32)) ([5df8c42](https://github.com/ppat/homelab-ops-ansible/commit/5df8c42f20864e338e083bac87ab45fb17fe1a5f))
* **deps:** remove unused dependency 'commitizen' and enable 'sysbox' to be upgraded by renovate ([#38](https://github.com/ppat/homelab-ops-ansible/issues/38)) ([84b5e4f](https://github.com/ppat/homelab-ops-ansible/commit/84b5e4ff4c4f048c529c5d0fd7c8827e68361d6e))
