class projects::upgrader {

  repository { "${cylent_repo_dir}/upgrader":
    source => 'barklyprotects/upgrader',
    require => File[$cylent_repo_dir]
  }

}
