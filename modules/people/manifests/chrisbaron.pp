class people::chrisbaron {
  class { 'cylent::dev_environment':
    docker_machine_driver => "virtualbox"   
 }

  package {
            [
              'adium',
              'textmate'
            ]: provider => 'brewcask'
          }

  notify {'awscli':}


  ###### Environment Settings ##########
  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::show_hidden_files

  include cylent::osx::dock::minimize_to_application
  include cylent::apps::ansible

  include projects::portal
  include projects::endpoint
  include projects::ops

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
