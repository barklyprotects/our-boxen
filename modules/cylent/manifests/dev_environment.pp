
class cylent::dev_environment (
  $docker_machine_driver = "vmwarefusion"
) 
{
  include python::virtualenvwrapper
 
  notify { 'class cylent::dev_envronment declared': }
  notify { 'Repository Defaults Set': }

  include cylent::apps::default_apps
  class { 'cylent::apps::docker_machine':
    docker_machine_driver => $docker_machine_driver
  }
  include cylent::vagrant::vagrant_vmware

  file { $cylent_repo_dir:
    ensure => directory,
    require  => File["${boxen::config::bindir}/boxen-git-credential"]
  }

  file {$cylent_env:
    ensure => directory
  }

  git::config::global { 'core.autocrlf':
    value => 'input'
  }

  git::config::global { 'push.default':
    value => 'simple'
  }
  
  python::mkvirtualenv {'dev-tools':
    ensure => present,
    systempkgs => true,
  } 
  ->
  repository { "${cylent_repo_dir}/vagrantfiles":
    source => 'barklyprotects/vagrantfiles',
    require => File[$cylent_repo_dir]
  }
  ->
  repository { "${cylent_repo_dir}/licenses":
    source => 'barklyprotects/licenses',
    require => File[$cylent_repo_dir],
    ensure   => 'origin/HEAD'
  }
  ->
  repository { "${cylent_repo_dir}/dev-tools":
    source => 'barklyprotects/dev-tools',
    require => File[$cylent_repo_dir],
    ensure   => 'origin/HEAD'
  }
  ->
  python::pip {'PrettyTable':
    name => 'PrettyTable',
    virtualenv => "${python::config::venv_home}/dev-tools",
  }
  ->
  python::pip {'requests':
    name => 'requests',
    virtualenv => "${python::config::venv_home}/dev-tools",	
  }
  ->
  repository { $cylent_dotfiles:
    source => 'barklyprotects/dotfiles',
    require => File[$cylent_repo_dir],
    ensure   => 'origin/HEAD'
  }

  homebrew::tap { 'atlassian/tap': }

  package { "atlassian/tap/atlassian-plugin-sdk":
    ensure => present,
    require => Homebrew::Tap['atlassian/tap'],
  }
}
