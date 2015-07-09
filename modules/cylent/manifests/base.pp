class cylent::base {
  notify { 'class cylent::base declared': }
  notify { 'Repository Defaults Set': }

  include cylent::apps::default_apps

  file { $cylent_repo_dir:
    ensure => directory,
    require  => File["${boxen::config::bindir}/boxen-git-credential"]
  }

  git::config::global { 'core.autocrlf':
    value => 'input'
  }

  git::config::global { 'push.default':
    value => 'simple'
  }

}
