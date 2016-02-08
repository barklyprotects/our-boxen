class cylent::apps::default_apps {
  notify { 'class cylent::apps::default_apps declared': }

  include chrome
  include wget
  include xquartz
  include atom
  include macvim
  include vmware_fusion
  include cmake
  include iterm2::dev
  include tunnelblick
  include googledrive
  include screenhero
  include cylent::apps::barkly_java
  include brewcask

  class { 'firefox':
     version => '36.0'
  }

  class {'intellij':
    edition => 'ultimate',
    version => '15.0.3'
  }

  # Homebrew Packages

  package { 'vagrant':
    ensure => present,
    provider => 'brewcask'
  }

  package { 'vagrant-manager':
    ensure => present,
    provider => 'brewcask'
  }

  package { 'github-desktop':
    provider => 'brewcask'
  }

  package {
    [
      'findutils',
      'gnu-tar',
      'ack',
      'tree',
      'watch',
      'git-crypt',
      'go',
    ]:
  }
  ->
  file {'/usr/local/bin/git-crypt':
    ensure => link,
    target => "/opt/boxen/homebrew/bin/git-crypt"
  }
}
