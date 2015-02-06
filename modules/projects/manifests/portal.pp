class projects::portal {
  include virtualbox
  include docker
  include redis
  include homebrew
  include stdlib
  include sysctl
  include postgresql

  repository { "${cylent_repo_dir}/angalia-web":
    source => 'cylentsystems/angalia-web',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/angalia-api":
    source => 'cylentsystems/angalia-api',
    require => File[$cylent_repo_dir]
  }
}
