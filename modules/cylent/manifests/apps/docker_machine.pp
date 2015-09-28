class cylent::apps::docker_machine {
  include brewcask

  notify { 'class cylent::apps::docker_machine declared': }

  package { 'docker-machine':
    ensure => present,
    provider => 'brewcask'
  }
 
  exec { 'create machine':
    command => '/usr/local/bin/docker-machine create osxdock --driver virtualbox',
    unless => '/usr/local/bin/docker-machine inspect osxdock',
    require => Package['docker-machine']
  }

  exec { 'start machine':
    command =>  '/usr/local/bin/docker-machine start osxdock',
    unless => 'test Running = `/usr/local/bin/docker-machine status osxdock`',
    require => Exec['create machine']
  }

}
