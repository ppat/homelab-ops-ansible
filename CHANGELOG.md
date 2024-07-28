# Changelog



## [1.7.1](https://github.com/ppat/homelab-ops-ansible/compare/v1.7.0...v1.7.1) (2024-07-28)

### 🐛 Enhancements + Bug Fixes

* **k3s:** fix bug where k3s installation couldn't select node by hostname ([#140](https://github.com/ppat/homelab-ops-ansible/issues/140)) ([dd38475](https://github.com/ppat/homelab-ops-ansible/commit/dd384751ef42f69aa211a0ee58e247313599d4cd))
* **k3s:** homelab_ops.k3s.fetch_kubeconfig should output formatted yaml for kubeconfig ([#142](https://github.com/ppat/homelab-ops-ansible/issues/142)) ([2cac765](https://github.com/ppat/homelab-ops-ansible/commit/2cac76561143f58fe8433ad38c1c530b2696d382))
* **k3s:** misc updates to homelab_ops.k3s.install playbook ([#141](https://github.com/ppat/homelab-ops-ansible/issues/141)) ([f8537b2](https://github.com/ppat/homelab-ops-ansible/commit/f8537b2312cd16bd91aabbc44b807c2efb6e9b24))

## [1.7.0](https://github.com/ppat/homelab-ops-ansible/compare/v1.6.2...v1.7.0) (2024-07-28)

### ✨ Features

* **k3s:** add role homelab_ops.k3s.fetch_kubeconfig ([#134](https://github.com/ppat/homelab-ops-ansible/issues/134)) ([ef7613c](https://github.com/ppat/homelab-ops-ansible/commit/ef7613c2897295289033fda84c7efb17ed49d665))
* **k3s:** enable users to supply custom kublet configuration file ([#137](https://github.com/ppat/homelab-ops-ansible/issues/137)) ([906599b](https://github.com/ppat/homelab-ops-ansible/commit/906599b5601e6a1d4fae1a2f1f131b9fd67f0117))

### 🐛 Enhancements + Bug Fixes

* **deps:** update dependency ansible-core to v2.16.9 ([#130](https://github.com/ppat/homelab-ops-ansible/issues/130)) ([95a3ed2](https://github.com/ppat/homelab-ops-ansible/commit/95a3ed29da8210f5c626d1e4651ba57b26482c69))
* **k3s:** drop role homelab_ops.k3s.bootstrap_flux ([#135](https://github.com/ppat/homelab-ops-ansible/issues/135)) ([44263d7](https://github.com/ppat/homelab-ops-ansible/commit/44263d79d961d9c0cda9836699911f943bcde7b4))
* **k3s:** fix issue where kube-proxy metrics were not exposed on agent nodes ([#138](https://github.com/ppat/homelab-ops-ansible/issues/138)) ([de21ec9](https://github.com/ppat/homelab-ops-ansible/commit/de21ec9b1671aa26c472de8eadd236d5a2167ebc))
* **k3s:** remove inclusion envsubst binary in k3s test ([#139](https://github.com/ppat/homelab-ops-ansible/issues/139)) ([e9063d3](https://github.com/ppat/homelab-ops-ansible/commit/e9063d38d7728a4fca6202bb6bf4c603ce3bb43a))
* **k3s:** remove the need for pypi packages to be installed on inventory hosts ([#133](https://github.com/ppat/homelab-ops-ansible/issues/133)) ([5392d05](https://github.com/ppat/homelab-ops-ansible/commit/5392d05d97604e8efd3fcbca5cc142a6cee967be))

### 📌 Dependencies

* **deps:** update dependency ansible-core to v2.16.9 ([#129](https://github.com/ppat/homelab-ops-ansible/issues/129)) ([d7b3529](https://github.com/ppat/homelab-ops-ansible/commit/d7b3529312e01989d04be1854c1e0b79efdd39dc))

## [1.6.2](https://github.com/ppat/homelab-ops-ansible/compare/v1.6.1...v1.6.2) (2024-07-22)

### 🐛 Enhancements + Bug Fixes

* **k3s:** fix typo in homelab_ops.k3s.install playbook ([#128](https://github.com/ppat/homelab-ops-ansible/issues/128)) ([3f4244f](https://github.com/ppat/homelab-ops-ansible/commit/3f4244f64b7e49278fa5800d9a0748c24e77edd6))

## [1.6.1](https://github.com/ppat/homelab-ops-ansible/compare/v1.6.0...v1.6.1) (2024-07-21)

### 🐛 Enhancements + Bug Fixes

* **k3s:** update playbook homelab_ops.k3s.install to automatically install pypi dependencies ([#127](https://github.com/ppat/homelab-ops-ansible/issues/127)) ([50ca1d3](https://github.com/ppat/homelab-ops-ansible/commit/50ca1d35a3a3e70a6e3e1396f36f6fe17c2a0152))

## [1.6.0](https://github.com/ppat/homelab-ops-ansible/compare/v1.5.0...v1.6.0) (2024-07-21)

### ✨ Features

* **configure:** add support for cloudinit write_files directive to homelab_ops.configure.cloud_init role ([#125](https://github.com/ppat/homelab-ops-ansible/issues/125)) ([fd0559f](https://github.com/ppat/homelab-ops-ansible/commit/fd0559f20ce98b4438a883db6cabf08b33be7c3b))

### 🐛 Enhancements + Bug Fixes

* **raspberry_pi:** remove ansible setup from homelab_ops.raspberry_pi.provision role ([#126](https://github.com/ppat/homelab-ops-ansible/issues/126)) ([0888e02](https://github.com/ppat/homelab-ops-ansible/commit/0888e02424868040c13798a51930b5e2e24f6b6f))

### 📌 Dependencies

* **deps:** update github-action dependencies ([#118](https://github.com/ppat/homelab-ops-ansible/issues/118)) ([454f4dd](https://github.com/ppat/homelab-ops-ansible/commit/454f4dd902af141497ec1286094225ea8ee0ef1b))

## [1.5.0](https://github.com/ppat/homelab-ops-ansible/compare/v1.4.0...v1.5.0) (2024-07-21)

### ✨ Features

* **k3s:** add playbook for installing k3s + flux using homelab_ops.k3s.* roles ([#124](https://github.com/ppat/homelab-ops-ansible/issues/124)) ([20cabb3](https://github.com/ppat/homelab-ops-ansible/commit/20cabb3e8d7ef1d9166b282f47753652963acf21))
* **k3s:** provide server/agent tokens to k3s installer script via environment variables instead of files ([#121](https://github.com/ppat/homelab-ops-ansible/issues/121)) ([04fcbf1](https://github.com/ppat/homelab-ops-ansible/commit/04fcbf1fdaf1dff9381f7313ec2bfb5525879c17))

### 🛠 Improvements

* **k3s:** fix missed metrics exposure for server nodes after the first one ([#122](https://github.com/ppat/homelab-ops-ansible/issues/122)) ([6df61ee](https://github.com/ppat/homelab-ops-ansible/commit/6df61ee8987a9f91ac9f7124dc368637e5030434))

### 📌 Dependencies

* **deps:** update pre-commit hook ansible/ansible-lint to v24.6.1 ([#123](https://github.com/ppat/homelab-ops-ansible/issues/123)) ([245f106](https://github.com/ppat/homelab-ops-ansible/commit/245f106f2bd80931d662e948bb7ec68088430dbf))

## [1.4.0](https://github.com/ppat/homelab-ops-ansible/compare/v1.3.0...v1.4.0) (2024-07-21)

### ✨ Features

* **k3s:** expose k3s metrics externally (i.e. on 0.0.0.0) when k3s.expose_metrics is set to true ([#119](https://github.com/ppat/homelab-ops-ansible/issues/119)) ([83b9ab0](https://github.com/ppat/homelab-ops-ansible/commit/83b9ab01ac998bba0a792e3dbffa21540b3cda65))

### 📌 Dependencies

* **deps:** update dependency community.general to v9.2.0 ([#117](https://github.com/ppat/homelab-ops-ansible/issues/117)) ([bde4df7](https://github.com/ppat/homelab-ops-ansible/commit/bde4df7c417e9c0f2ea7c552c7b8c836fcb11dbc))
* **deps:** update dependency homelab_ops.k3s to v1.3.0 ([#116](https://github.com/ppat/homelab-ops-ansible/issues/116)) ([5464ae6](https://github.com/ppat/homelab-ops-ansible/commit/5464ae6f88719248b380ca6ac37352420cf1a6ab))

## [1.3.0](https://github.com/ppat/homelab-ops-ansible/compare/v1.2.0...v1.3.0) (2024-07-13)

### ✨ Features

* **os:** support for ubuntu release - noble ([#113](https://github.com/ppat/homelab-ops-ansible/issues/113)) ([1af593a](https://github.com/ppat/homelab-ops-ansible/commit/1af593a54ffc1ec1a15045db022c2f88974b04da))

### 📌 Dependencies

* **deps:** move docker pypi package from dependencies to dev-dependencies as only molecule-plugins depend on it ([#115](https://github.com/ppat/homelab-ops-ansible/issues/115)) ([17fa43f](https://github.com/ppat/homelab-ops-ansible/commit/17fa43f715bc90cfbf091a829e3ababf242f0dc8))
* **deps:** update dependency homelab_ops.k3s to v1.2.0 ([#112](https://github.com/ppat/homelab-ops-ansible/issues/112)) ([b02d839](https://github.com/ppat/homelab-ops-ansible/commit/b02d839d9cd3eb8e8f9d8578f2beea0c17ea8dbb))

## [1.2.0](https://github.com/ppat/homelab-ops-ansible/compare/v1.1.0...v1.2.0) (2024-07-12)

### ✨ Features

* switch homelab_ops.configure.cloud_init role to enable running specified runcmd commands ([#103](https://github.com/ppat/homelab-ops-ansible/issues/103)) ([d051811](https://github.com/ppat/homelab-ops-ansible/commit/d0518117bdd543862ec1410e80603c7c9e050d8a))

### 🐛 Enhancements + Bug Fixes

* **deps:** separate dependencies into dependencies and dev-dependencies ([#104](https://github.com/ppat/homelab-ops-ansible/issues/104)) ([75b845b](https://github.com/ppat/homelab-ops-ansible/commit/75b845b4baf858e60c9df06666df14a4bbe48a22))

### 📌 Dependencies

* **deps:** lock file maintenance ([#110](https://github.com/ppat/homelab-ops-ansible/issues/110)) ([8b8744c](https://github.com/ppat/homelab-ops-ansible/commit/8b8744c90668f050258000567d57f43561889308))
* **deps:** update dependency homelab_ops.k3s to v1.1.0 ([#101](https://github.com/ppat/homelab-ops-ansible/issues/101)) ([ec56e3b](https://github.com/ppat/homelab-ops-ansible/commit/ec56e3bbe08b112ac6a3a59e88ee368cde8dfaaf))
* **deps:** update dependency node to v20.15.1 ([#100](https://github.com/ppat/homelab-ops-ansible/issues/100)) ([ac3b90b](https://github.com/ppat/homelab-ops-ansible/commit/ac3b90b8f5919a848446095a125d5f30fb2d3188))
* **deps:** update nginx docker digest to 67682bd ([#109](https://github.com/ppat/homelab-ops-ansible/issues/109)) ([daa543c](https://github.com/ppat/homelab-ops-ansible/commit/daa543c09ee949fafdf068e5d70c9867eb52b3f6))

## [1.1.0](https://github.com/ppat/homelab-ops-ansible/compare/v1.0.2...v1.1.0) (2024-07-08)

### ✨ Features

* add support for hardening k3s according CIS Hardening standard ([#98](https://github.com/ppat/homelab-ops-ansible/issues/98)) ([f53029f](https://github.com/ppat/homelab-ops-ansible/commit/f53029ff7ed7e1e21e39fd6fd68339d326cf9c54))

### 🐛 Enhancements + Bug Fixes

* **k3s:** refactor to simply how k3s can be configured ([#99](https://github.com/ppat/homelab-ops-ansible/issues/99)) ([c8f46cc](https://github.com/ppat/homelab-ops-ansible/commit/c8f46cc25ebd59bc0355ddc1307bf6750ea338e3))

### 📌 Dependencies

* **deps:** pin dependencies ([#89](https://github.com/ppat/homelab-ops-ansible/issues/89)) ([1923b96](https://github.com/ppat/homelab-ops-ansible/commit/1923b966120a0be26a2f9a0e8b719e20c7f2a01a))
* **deps:** update dependency ansible-core to v2.16.8 ([#88](https://github.com/ppat/homelab-ops-ansible/issues/88)) ([c1b66ff](https://github.com/ppat/homelab-ops-ansible/commit/c1b66ff19766313967d86a0928f1bdb8aa0912d4))
* **deps:** update dependency k3s-io/k3s to v1.30.2+k3s1 ([#92](https://github.com/ppat/homelab-ops-ansible/issues/92)) ([aa76221](https://github.com/ppat/homelab-ops-ansible/commit/aa762211cdcfe17973652ee62f1ca68bcca58124))
* **deps:** update dependency molecule to v24.6.1 ([#96](https://github.com/ppat/homelab-ops-ansible/issues/96)) ([ffee61b](https://github.com/ppat/homelab-ops-ansible/commit/ffee61b0281e141c8eddd834d1be482876057cb9))
* **deps:** update pre-commit hook ansible/ansible-lint to v24.5.0 ([#65](https://github.com/ppat/homelab-ops-ansible/issues/65)) ([ec6a8fa](https://github.com/ppat/homelab-ops-ansible/commit/ec6a8fa207666111967a0b74395acbb845396ae6))
* **deps:** update pre-commit hook ansible/ansible-lint to v24.6.0 ([#95](https://github.com/ppat/homelab-ops-ansible/issues/95)) ([9d6a130](https://github.com/ppat/homelab-ops-ansible/commit/9d6a1308e6775c5d7caf98d732e31f674fa4ab77))
* **deps:** update python major dependencies to v24 (major) ([#91](https://github.com/ppat/homelab-ops-ansible/issues/91)) ([4b93090](https://github.com/ppat/homelab-ops-ansible/commit/4b930902e9a99111d8ccc3670e2c382849ed9bc7))
* **deps:** update python non-major dependencies ([#93](https://github.com/ppat/homelab-ops-ansible/issues/93)) ([35efc54](https://github.com/ppat/homelab-ops-ansible/commit/35efc54c2674d37e7a4ecb0068e25b3302c15994))

## [1.0.2](https://github.com/ppat/homelab-ops-ansible/compare/v1.0.1...v1.0.2) (2024-06-24)

### 📌 Dependencies

* **deps:** update dependency community.general to v8.6.2 ([#73](https://github.com/ppat/homelab-ops-ansible/issues/73)) ([39a22f6](https://github.com/ppat/homelab-ops-ansible/commit/39a22f6e22f0719d0947c66c3bcb7ff97a5b064f))
* **deps:** update dependency conventional-changelog-conventionalcommits to v8 ([#39](https://github.com/ppat/homelab-ops-ansible/issues/39)) ([1973bbc](https://github.com/ppat/homelab-ops-ansible/commit/1973bbc0a092dcc38631b69741e435cda0a4b9c6))
* **deps:** update dependency requests to v2.32.3 ([#82](https://github.com/ppat/homelab-ops-ansible/issues/82)) ([a4b5abc](https://github.com/ppat/homelab-ops-ansible/commit/a4b5abc4b704321c3121c3d6f66af62cb9ff32b6))
* **deps:** update galaxy-collection major dependencies (major) ([#74](https://github.com/ppat/homelab-ops-ansible/issues/74)) ([b511442](https://github.com/ppat/homelab-ops-ansible/commit/b51144266bfa1bd31d84809645d6ab0c51320297))
* **deps:** update nginx docker digest to 9c36718 ([#78](https://github.com/ppat/homelab-ops-ansible/issues/78)) ([fb1e42f](https://github.com/ppat/homelab-ops-ansible/commit/fb1e42fd1d7c3f6d0446073a0f58a9d2d653cddc))
* **deps:** update npm major dependencies (major) ([#83](https://github.com/ppat/homelab-ops-ansible/issues/83)) ([17fa940](https://github.com/ppat/homelab-ops-ansible/commit/17fa9408c33040ed62691ba2e6ff1ad7ccb0c68b))

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
