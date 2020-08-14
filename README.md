andrewrothstein.osm
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-osm.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-osm)

Installs the Open Service Mesh [osm](https://github.com/openservicemesh/osm) cli.

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.osm
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
