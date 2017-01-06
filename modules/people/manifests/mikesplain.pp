class people::mikesplain {
  class { 'cylent::dev_environment':
    docker_machine_driver => "virtualbox"
  }


  include cylent::dev_environment
  include python::virtualenvwrapper
  include cylent::apps::ansible

  include projects::endpoint
  include projects::portal
  include projects::ops
  include dropbox
  include sourcetree
  include tmux
  include caffeine
  include flux
  include spf13vim3
  include heroku
  include googledrive

  include brewcask
  homebrew::tap { 'homebrew/dupes': }

  package {
            [
              '1password',
              'alfred',
              'cakebrew',
              'camtwist',
              'charles',
              'cyberduck',
              'deepvacuum',
              'disk-inventory-x',
              'docker-machine',
              'evernote',
              'firefox',
              'gimp',
              'go',
              'gpgtools',
              'helm',
              'inkscape',
              'intellij-idea-ce',
              'java',
              'joinme',
              'kaleidoscope',
              'launchrocket',
              'libreoffice',
              'menumeters',
              'minikube',
              'openoffice',
              'private-internet-access',
              'psequel',
              'pycharm-ce',
              'real-vnc',
              'sequel-pro',
              'skype',
              'slack',
              'spectacle',
              'spotify',
              'steam',
              'textual',
              'the-unarchiver',
              'thunderbird',
              'tigervnc-viewer',
              'torbrowser',
              'transmission',
              'transmit',
              'unetbootin',
              'vagrant-manager',
              'vagrant',
              'virtualbox',
              'viscosity',
              'vlc',
              'wireshark',
              'yujitach-menumeters'
              #'ccmenu',
              #'kaleidoscope',
            ]: provider => 'brewcask'
          }
  package {
    [
      'rainbarf',
      'homebrew/dupes/grep',
      'reattach-to-user-namespace',
      'mercurial',
      'ncdu',
      'slackcat',
      'ack',
      'atlassian-plugin-sdk',
      'autoconf',
      'automake',
      'awscli',
      'boost',
      'boot2docker',
      'cloog018',
      'cmake',
      'cscope',
      'curl',
      'dirmngr',
      'dnsmasq',
      'docker',
      'docker-compose',
      'docker-machine',
      'ec2-api-tools',
      'findutils',
      'gcc48',
      'gdbm',
      'gettext',
      'git',
      'git-crypt',
      'gmp',
      'gmp4',
      'gnu-tar',
      'gnupg',
      'gnupg2',
      'go',
      'govendor',
      'gpg-agent',
      'graphviz',
      'grep',
      'highlight',
      'htop',
      'httperf',
      'hub',
      'iftop',
      'ipcalc',
      'isl011',
      'isl014',
      'jq',
      'kubernetes-cli',
      'libassuan',
      'libevent',
      'libgcrypt',
      'libgpg-error',
      'libksba',
      'libmpc',
      'libmpc08',
      'libpng',
      'libssh',
      'libtool',
      'libusb',
      'libusb-compat',
      'libyaml',
      'lua',
      'macvim',
      'makedepend',
      'maven',
      'md5sha1sum',
      'mercurial',
      'mpfr',
      'mpfr2',
      'msgpack',
      'ncdu',
      'nginx',
      'nmap',
      'oniguruma',
      'openssl',
      'openssl@1.1',
      'ossp-uuid',
      'packer',
      'pcre',
      'pinentry',
      'pkg-config',
      'postgresql',
      'pth',
      'python',
      'rainbarf',
      'readline',
      'reattach-to-user-namespace',
      'redis',
      'ruby',
      's3cmd',
      'slackcat',
      'socat',
      'sqlite',
      'terraform',
      'thefuck',
      'tmate',
      'tmux',
      'tree',
      'utf8proc',
      'vegeta',
      'wakeonlan',
      'watch',
      'wget',
      'xz',
      'zlib',
      'zsh'
    ]:
  }

  #Needed for ansible
  $crypto_keys = "${home}/keys"

  file {$crypto_keys:
    ensure => directory
  }

  notify {'awscli':}


  class { 'osx::dock::icon_size':
    size => 25
  }

  include osx::global::enable_keyboard_control_access
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::finder::empty_trash_securely
  include osx::finder::show_hidden_files
  include osx::finder::show_all_filename_extensions
  include osx::safari::enable_developer_mode
  include osx::no_network_dsstores

  include osx::dock::autohide
  include cylent::osx::dock::autohide-time-modifier


  class { 'osx::global::key_repeat_delay':
    delay => 15
  }
  class { 'osx::global::key_repeat_rate':
    rate => 2
  }

  ###### Environment Settings ##########
  include osx::dock::dim_hidden_apps
  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::show_hidden_files

  class { 'osx::global::natural_mouse_scrolling':
    enabled => true
  }

  class { 'osx::dock::hot_corners':
    top_right => 'Mission Control',
    top_left  => 'Application Windows',
    bottom_right => 'Desktop',
    bottom_left => 'Start Screen Saver'
  }

  include cylent::osx::dock::minimize_to_application

  ###### Set up oh-my-zsh environment ######
  repository {"${cylent_repo_dir}/oh-my-zsh":
    source => 'robbyrussell/oh-my-zsh',
    require => File[$cylent_repo_dir]
  }

  file {"${home}/.zshrc":
    ensure  => link,
    target => "${cylent_dotfiles}/zshrc",
    require => Repository["${cylent_repo_dir}/oh-my-zsh"]
  }

  file {"${cylent_env}/zsh":
    ensure => link,
    target => "${cylent_dotfiles}/zsh",
    require => [Repository[$cylent_dotfiles],File[$cylent_env]]
  }
  ->
  exec { "chsh -s /opt/boxen/homebrew/bin/zsh":
    user => root,
    path => ["/usr/bin","/bin"],
    onlyif => "bash -c test `dscl . -read /Users/${USER} UserShell | cut -d: -f2 | tr -d ' '` = /opt/boxen/homebrew/bin/zsh"
  }

  ######## Personal Additions

  file {"${home}/Library/Preferences/com.divisiblebyzero.Spectacle.plist":
    ensure => link,
    target => "${home}/Dropbox/Mackup/Library/Preferences/com.divisiblebyzero.Spectacle.plist"
  }

  file {"${home}/.env/zzz_splain.zsh":
    ensure => link,
    target => "${home}/Google Drive/dotfiles/zzz_splain.zsh"
  }

  repository {"${home}/.tmux":
    source => 'mikesplain/tmux'
  }

  ->
  exec { "git submodule init && git submodule update":
    cwd => "${home}/.tmux"
  }

  file {"${home}/Library/Fonts/Monaco-Powerline.otf":
    ensure => link,
    target => "${home}/.tmux/Monaco-Powerline.otf"
  }

  file {"${home}/.tmux.conf":
    ensure => link,
    target => "${home}/.tmux/.tmux.conf"
  }


}
