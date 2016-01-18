class cylent::apps::golang {
  notify { 'class cylent::apps::golang declared': }
  $gopath = "${cylent_repo_dir}/golang"
  $gosrc = "${cylent_repo_dir}/golang/src"
  $gopkg = "${cylent_repo_dir}/golang/pkg"
  $gobin = "${cylent_repo_dir}/golang/bin"

  package {
    [
      'go',
    ]:
  }

  file{ $gopath:
    ensure => directory
  }
  ->
  file{ $gosrc:
    ensure => directory
  }
  ->
  file{ $gopkg:
    ensure => directory
  }
  ->
  file{ $gobin:
    ensure => directory
  }

  file {'golang.zsh':
    path => "${cylent_env}/golang.zsh",
    ensure => file,
    require => [Repository[$cylent_dotfiles],File[$cylent_env]],
    content => template("cylent/gopath_env.erb")
  }

}
