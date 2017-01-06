class projects::endpoint {

  repository { "${cylent_repo_dir}/kimya":
    source => 'barklyprotects/kimya',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/RapidVisor":
    source => 'barklyprotects/RapidVisor',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/RV-Loaders":
    source => 'barklyprotects/RV-Loaders',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/RV-Shared":
    source => 'barklyprotects/RV-Shared',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/RV-Tools":
    source => 'barklyprotects/RV-Tools',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/bandit":
    source => 'barklyprotects/bandit',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/easyloggingpp":
    source => 'barklyprotects/easyloggingpp',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/OSR_base":
    source => 'barklyprotects/OSR_base',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/watchtower":
      source => 'barklyprotects/watchtower',
      require => File[$cylent_repo_dir]
    }

  repository { "${cylent_repo_dir}/upgrader":
    source => 'barklyprotects/upgrader',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/winsw":
    source => 'barklyprotects/winsw',
    require => File[$cylent_repo_dir]
  }
  
  repository { "${cylent_repo_dir}/athena":
    source => 'barklyprotects/athena',
    require => File[$cylent_repo_dir]
  }

repository { "${cylent_repo_dir}/RV-OSMonitor":
    source => 'barklyprotects/RV-OSMonitor',
    require => File[$cylent_repo_dir]
  }

  npm_module {'coffee-script':
    module => 'coffee-script',
    node_version => '5.3.0',
    version => '~> 1.10.0'
  }

  npm_module {'grunt-cli':
    module => 'grunt-cli',
    node_version => '5.3.0',
    version => '0.1.13'
  }

}
