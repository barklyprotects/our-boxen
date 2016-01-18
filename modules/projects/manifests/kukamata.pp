class projects::kukamata {
  notify { 'class cylent::projects::kukamata declared': }

  repository { "${cylent_repo_dir}/golang/src/github.com/barklyprotects/kukamata":
    source => 'barklyprotects/kukamata',
    require => File[$cylent_golang_path]
  }
}
