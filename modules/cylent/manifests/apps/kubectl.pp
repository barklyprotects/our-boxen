class cylent::apps::kubectl {
  include homebrew::config
  exec{'retrieve kubectl':
    command => "${homebrew::config::installdir}/bin/wget -q https://storage.googleapis.com/kubernetes-release/release/v1.1.3/bin/darwin/amd64/kubectl -O ${homebrew::config::installdir}/bin/kubectl",
    creates => "${homebrew::config::installdir}/bin/kubectl",
    require => Class['wget']
  }
  ->
  file{"${homebrew::config::installdir}/bin/kubectl":
    mode => 'a+x',
  }
}
