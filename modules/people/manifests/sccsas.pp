class people::sccsas {
  ##### Projects #####
  include cylent::dev_environment
  include projects::endpoint
  include projects::portal

  ##### Apps #####
  include dashlane
  include flux
  include gimp
  include iterm2::dev
  include sketch
  include spectacle
  include usbethdriver

  ###### Environment Settings ##########
  include osx::dock::autohide
  include osx::dock::dim_hidden_apps
  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::show_hidden_files

  include dnsmasq
  dnsmasq::address { 'angalia-web-portal-functional-tests':
    ipaddr => '172.16.132.128'
  }

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  class { 'osx::dock::hot_corners':
    top_right => 'Put Display to Sleep',
    bottom_right => 'Start Screen Saver',
    bottom_left => 'Dashboard'
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
}
