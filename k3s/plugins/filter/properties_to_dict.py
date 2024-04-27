
class FilterModule(object):
  def _properties_to_dict(self, content: str):
    lines = content.split('\n')
    return {
      k: v for k, v in [
        line.split('=') for line in lines if line and not line.startswith("#")
      ]
    }

  def filters(self):
    return {'from_properties': self._properties_to_dict}
