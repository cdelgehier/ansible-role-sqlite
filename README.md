[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-sqlite.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-sqlite)
# Ansible role `sqlite`

An Ansible role for SQLite. Specifically, the responsibilities of this role are to:

- Install a SQLite
- Configure a SQLite

## Requirements

- Ansible 2.4+

## Role Variables


| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `openio_sqlite_databases` | `[]` | File name in `openio_sqlite_directory``s name will be suffixed by ".db" |
| `openio_sqlite_directory` | `/var/lib/sqlite` | Databases directory  |
| `openio_sqlite_group` | `root` | Name of the group that should own the database |
| `openio_sqlite_user` | `root` | Name of the user that should own the database |

## Dependencies

No dependencies.

## Example Playbook

```yaml
- hosts: all
  gather_facts: true
  become: true
  roles:
    - role: sqlite
      openio_sqlite_directory: /var/lib/keystone
      openio_sqlite_user: keystone
      openio_sqlite_group: keystone
      openio_sqlite_databases:
        - keystone

```


```ini
[all]
node1 ansible_host=192.168.1.173
```

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section.

Pull requests are also very welcome.
The best way to submit a PR is by first creating a fork of this Github project, then creating a topic branch for the suggested change and pushing that branch to your own fork.
Github can then easily create a PR based on that branch.

## License

Apache License, Version 2.0

## Contributors

- [Cedric DELGEHIER](https://github.com/cdelgehier) (maintainer)
