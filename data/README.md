# Data

This directory structure is where all data is stored.

For example, take this class:

```ruby
class profile::puppet_agent (
  String $puppetmaster,
) {
  class { '::puppet':
    pluginsync   => true,
    runmode      => 'service',
    agent        => true,
    puppetmaster => $puppetmaster,
    ca_server    => $puppetmaster,
  }
}
```

The value `$puppetmaster` will be taken from `data/node/$FQDN.yaml`. If that file doesn't exist, it will be taken from `data/common.yaml`.

So, if the former doesn't exist, given the contents of `data/common.yaml` look like this:

```
profile::puppet_agent::puppetmaster: 'foo.example.bar'
```

then the default value passed into the profile is `'foo.example.bar'`
