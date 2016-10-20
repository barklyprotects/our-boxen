class projects::beam {

  repository { "${cylent_repo_dir}/cuckoo-osx-env":
    source => 'barklyprotects/cuckoo-osx-env',
    require => File[$cylent_repo_dir]
  }

}
