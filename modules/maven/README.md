# Maven Puppet Module for Boxen

## Usage

```puppet
class { 'maven':
  # you can get encrypted password by runnnint `mvn --encrypt-master-password <password>`
  master_password => 'master-pass',
}
```

```puppet
maven::settings { 'settings-default.xml':
  ensure  => default,
  content => template("people/${::luser}/settings-default.xml.erb");
}
```
## Required Puppet Modules

* `boxen`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
