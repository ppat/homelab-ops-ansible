from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

DOCUMENTATION = r"""
  name: debian_architecture
  description:
      - Maps the given machine architecture to corresponding debian package architecture.
  options:
    _terms:
      description: machine architecture
      required: True
"""
from ansible.errors import AnsibleError, AnsibleParserError
from ansible.plugins.lookup import LookupBase
from ansible.utils.display import Display

_display = Display()
_arch_map = {
  "x86_64": "amd64",
  "ppc64le": "ppc64el",
  "s390x": "s390x",
  "armv7l": "armhf",
  "aarch64": "arm64"
}
debian_package_architecture: "{{ architecture_mapping[ansible_architecture] }}"


class LookupModule(LookupBase):
    def run(self, terms, variables=None, **kwargs):
      self.set_options(var_options=variables, direct=kwargs)

      ret = []
      for term in terms:
          _display.debug(f"Debian architecture lookup term: {term}")
          debian_pkg_arch = _arch_map[term] if term in _arch_map else None
          _display.debug(f"Debian architecture lookup value: {debian_pkg_arch}")
          try:
              if debian_pkg_arch:
                  ret.append(debian_pkg_arch)
              else:
                  # The Parser error indicates invalid options passed
                  raise AnsibleParserError()
          except AnsibleParserError:
              raise AnsibleError(f"Debian architecture lookup could not locate matching package architecture: {term}")

      return ret
