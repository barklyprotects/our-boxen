class projects::ops {

  package { 'docker-compose':
    ensure =>present
  }

  repository { "${cylent_repo_dir}/aws-prod":
    source => 'barklyprotects/aws-prod',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/barkly-certs":
    source => 'barklyprotects/barkly-certs',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/barkly-code-signing-cert":
    source => 'barklyprotects/barkly-code-signing-cert',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/cybot":
    source => 'barklyprotects/cybot',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/ops-docker":
    source => 'barklyprotects/ops-docker',
    require => File[$cylent_repo_dir]
  }

}
