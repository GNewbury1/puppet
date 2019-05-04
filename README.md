# Puppet Repository

This Puppet repository is purely for experimental and hobbyist purposes.

## Structure:

The structure of this repository is as follows:

```
.
├── data
│   ├── common.yaml
│   ├── nodes
│   │   ├── puppet-agent-ubuntu.lan.yaml
│   │   └── windows-agent.lan.yaml
│   └── README.md
├── environment.conf
├── hiera.yaml
├── manifests
│   └── site.pp
├── modules
│   ├── accounts
│   │   ├── examples
│   │   │   └── init.pp
│   │   ├── files
│   │   ├── manifests
│   │   └── templates
│   ├── profile
│   │   └── manifests
│   │       ├── accounts
│   │       │   └── groups.pp
│   │       ├── accounts.pp
│   │       ├── base.pp
│   │       └── puppet_agent.pp
│   └── role
│       └── manifests
└── Puppetfile
```

### Directories

#### data

This directory contains general values (`common.yaml`), or values for a specific node (`nodes/$(hostname).yaml`). These value files are used when a node uses a class with parameters. Read more [data/README.md](here).

#### manifests

This directory contains `site.pp`, a file which defines each node being managed by puppet, as well as a catch-all for nodes which may not have a specific configuration

#### modules

This directory contains two subdirectories, `profile`, and `role`. The `profile` directory contains several different `profiles` which could make up a `role`. For example, a `role` might be an email server, which would contain `accounts` and `puppet_agent` profiles.

### Files

#### environment.conf

Still not sure of the exact use of this file

#### hiera.yaml

The hierachy values being parsed in to Puppet classes. In this case, `data/node/$(hostname).yaml` is checked for first, followed by `data/common.yaml`.

#### Puppetfile

A file containing all modules from the Puppetforge.