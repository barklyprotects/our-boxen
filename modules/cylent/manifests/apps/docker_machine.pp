class cylent::apps::docker_machine (
  $machine_name = "osxdock",
  $docker_machine_driver = "vmwarefusion",
  $boot2docker_url = "https://github.com/boot2docker/boot2docker/releases/download/v1.9.1/boot2docker.iso"
) {
  include brewcask

  notify { 'class cylent::apps::docker_machine declared': }

  package { 'dockertoolbox':
    ensure => present,
    provider => 'brewcask'
  }
 
  exec { 'create machine':
    command => "/usr/local/bin/docker-machine --native-ssh create $machine_name --driver $docker_machine_driver --${docker_machine_driver}-boot2docker-url $boot2docker_url",
    unless => "/usr/local/bin/docker-machine inspect $machine_name",
    require => Package['dockertoolbox']
  }

  exec { 'start machine':
    command => "/usr/local/bin/docker-machine start $machine_name",
    unless => "test Running = `/usr/local/bin/docker-machine status $machine_name`",
    require => Exec['create machine']
  }

  file { "${home}/Library/LaunchAgents/com.barkly.docker-machine.plist":
    ensure => file,
    content => template('cylent/docker-machine.plist.erb'),
    mode => 0400
  }
  
  file { "${home}/Library/LaunchAgents/com.barkly.docker-machine-env.plist":
    ensure => file,
    content => template('cylent/docker-machine-env.plist.erb'),
    mode => 0400
  }
}
