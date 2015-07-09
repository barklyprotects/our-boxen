class cylent::apps::default_apps {
  notify { 'class cylent::apps::default_apps declared': }

  include chrome
  include wget
  include xquartz
  include atom
  include tunnelblick
  include java
  include googledrive
  include screenhero

  class { 'firefox':
     version => '39.0'
  }

  # Homebrew Packages
  package {
    [
      'findutils',
      'gnu-tar',
      'tree',
      'watch',
    ]:
  }

  include brewcask
  homebrew::tap { 'homebrew/dupes': }

  package {
            [
              'flash',
              'slack',
              'spotify',
              'vlc'
            ]: provider => 'brewcask'
  }

}
