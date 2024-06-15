# Changelog



## [1.0.1](https://github.com/ppat/homelab-ops-ansible/compare/v1.0.0...v1.0.1) (2024-06-15)


### 🐛 Enhancements + Bug Fixes

* **deps:** update npm non-major dependencies ([#55](https://github.com/ppat/homelab-ops-ansible/issues/55)) ([d6b468c](https://github.com/ppat/homelab-ops-ansible/commit/d6b468c143fca5f192412b7b0107a48f358cecb1))
* **os:** fix issue where initramfs generation and kernel uncompress steps did not run ([#67](https://github.com/ppat/homelab-ops-ansible/issues/67)) ([3d96be3](https://github.com/ppat/homelab-ops-ansible/commit/3d96be3f9f6a66cc811a445e6ac19f274a6f98e9))
* **other:** pin requests package version to be < 2.32.0 as it breaks molecule ([#51](https://github.com/ppat/homelab-ops-ansible/issues/51)) ([ce40589](https://github.com/ppat/homelab-ops-ansible/commit/ce40589e8225c4a0770e6856cf4f089fa1b0c06b))


### ⚙️ Other

* **deps:** pin nginx docker tag to 0f04e4f ([#60](https://github.com/ppat/homelab-ops-ansible/issues/60)) ([d96a38c](https://github.com/ppat/homelab-ops-ansible/commit/d96a38c72f6e619e61bc28dadd154ac12efd5480))
* **deps:** update all ansible-galaxy non-major dependencies ([#26](https://github.com/ppat/homelab-ops-ansible/issues/26)) ([864679c](https://github.com/ppat/homelab-ops-ansible/commit/864679c6cdc09312baa9baf1cdbf4fe0ad192b4e))
* **deps:** update all python non-major dependencies ([#56](https://github.com/ppat/homelab-ops-ansible/issues/56)) ([0d48c5e](https://github.com/ppat/homelab-ops-ansible/commit/0d48c5e44fd46d2b29843f88f22d1787f2b67db2))
* **deps:** update dependency ansible-core to v2.16.7 ([#64](https://github.com/ppat/homelab-ops-ansible/issues/64)) ([92a46e8](https://github.com/ppat/homelab-ops-ansible/commit/92a46e8ea1b49acac7c6e5cb97f6918608f3fa98))
* **deps:** update dependency community.general to v8.6.1 ([#49](https://github.com/ppat/homelab-ops-ansible/issues/49)) ([a7d0efe](https://github.com/ppat/homelab-ops-ansible/commit/a7d0efe8f70608015249a800cbfd0bd30fe6273f))
* **deps:** update dependency fluxcd/flux2 to v2.3.0 ([#45](https://github.com/ppat/homelab-ops-ansible/issues/45)) ([af2cf5f](https://github.com/ppat/homelab-ops-ansible/commit/af2cf5fa3a120b09c43c8df5e0cabd01c3f55962))
* **deps:** update dependency k3s-io/k3s to v1.30.1+k3s1 ([#46](https://github.com/ppat/homelab-ops-ansible/issues/46)) ([b91cd25](https://github.com/ppat/homelab-ops-ansible/commit/b91cd250da9289f1c1317f8ff581a7c2db6450dd))
* **deps:** update dependency kubernetes to v29 ([#27](https://github.com/ppat/homelab-ops-ansible/issues/27)) ([5657b9b](https://github.com/ppat/homelab-ops-ansible/commit/5657b9b46c7680cccb62fcc56df64ed3ba2262e9))
* **deps:** update dependency kubernetes to v30 ([#58](https://github.com/ppat/homelab-ops-ansible/issues/58)) ([2ada4fb](https://github.com/ppat/homelab-ops-ansible/commit/2ada4fbd5a6a5813ef801278652ee6c5e3573c82))
* **deps:** update dependency requests to v2.32.2 [security] ([#61](https://github.com/ppat/homelab-ops-ansible/issues/61)) ([c767cca](https://github.com/ppat/homelab-ops-ansible/commit/c767cca5d84898333594bf5ffb0ff7f4d4d190f7))
* **deps:** update dependency rhysd/actionlint to v1.6.27 ([#42](https://github.com/ppat/homelab-ops-ansible/issues/42)) ([0b86f8d](https://github.com/ppat/homelab-ops-ansible/commit/0b86f8daf101bb8f7cd31db684e78971eb4df2d6))
* **deps:** update dependency rhysd/actionlint to v1.7.1 ([#47](https://github.com/ppat/homelab-ops-ansible/issues/47)) ([ea348ae](https://github.com/ppat/homelab-ops-ansible/commit/ea348ae205804a6c81ef6b8d376bb8889a4a9f8c))
* **deps:** update github-action dependencies ([#28](https://github.com/ppat/homelab-ops-ansible/issues/28)) ([5241b56](https://github.com/ppat/homelab-ops-ansible/commit/5241b561bd87daef969e2e64ef3d5ba7284c34a9))
* **deps:** update minimum required versions of ansible-core and collections ([#66](https://github.com/ppat/homelab-ops-ansible/issues/66)) ([fb0535d](https://github.com/ppat/homelab-ops-ansible/commit/fb0535d90f73163b0cbf1627302dce6e302b7b3a))
* **deps:** update nginx docker digest to 56b388b ([#63](https://github.com/ppat/homelab-ops-ansible/issues/63)) ([b969050](https://github.com/ppat/homelab-ops-ansible/commit/b9690508e3661eaadf17335ba6cb56c3c0a1ff5c))
* **other:** update renovate config ([#59](https://github.com/ppat/homelab-ops-ansible/issues/59)) ([5fb12f1](https://github.com/ppat/homelab-ops-ansible/commit/5fb12f1b6ee47490c9e15a00d4585736ee112da7))
* **other:** update renovate config with better groupings ([#54](https://github.com/ppat/homelab-ops-ansible/issues/54)) ([dd401b1](https://github.com/ppat/homelab-ops-ansible/commit/dd401b18e98d43745c3fb9788640e3bac9aa558b))
* **other:** update renovate configuration ([#62](https://github.com/ppat/homelab-ops-ansible/issues/62)) ([62a6937](https://github.com/ppat/homelab-ops-ansible/commit/62a69376a491cecaef6c593d696d0af656efec94))

## 1.0.0 (2024-05-06)


### ⚙️ Other

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
* **k3s:** fix k3s github action where branch was selected incorrectly when run on main branch ([#36](https://github.com/ppat/homelab-ops-ansible/issues/36)) ([e0148af](https://github.com/ppat/homelab-ops-ansible/commit/e0148af68ea5bd00eb7b0f7b9f3fa9bbe1b20318))
* **k3s:** fix k3s github action where branch was selected incorrectly when run on main branch ([#37](https://github.com/ppat/homelab-ops-ansible/issues/37)) ([07eda30](https://github.com/ppat/homelab-ops-ansible/commit/07eda309a1e2c14cf525ea004f885be356b612ce))
* **other:** add renovate config for updating versions in yaml files ([6307a62](https://github.com/ppat/homelab-ops-ansible/commit/6307a6296f431d1912b775a1ded09ea1a1f720ba))
* **other:** update renovate config for github actions update ([#40](https://github.com/ppat/homelab-ops-ansible/issues/40)) ([0f6fac4](https://github.com/ppat/homelab-ops-ansible/commit/0f6fac47f0d5cc7da709b3ac0d8db4b010aef423))
* **release:** update release github-action to publish to ansible-galaxy ([#43](https://github.com/ppat/homelab-ops-ansible/issues/43)) ([a37f6d1](https://github.com/ppat/homelab-ops-ansible/commit/a37f6d1e023b50355a0be62c0f1f4a29de1713c1))


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
