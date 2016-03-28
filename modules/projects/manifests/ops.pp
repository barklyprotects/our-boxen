class projects::ops {

  package { ['docker-compose',
             'kubernetes-cli']:
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

  repository { "${cylent_repo_dir}/barkly-environments":
    source => 'barklyprotects/barkly-environments',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/barkly-kubernetes":
    source => 'barklyprotects/barkly-kubernetes',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/site-ops":
    source => 'barklyprotects/site-ops',
    require => File[$cylent_repo_dir]
  }

}
