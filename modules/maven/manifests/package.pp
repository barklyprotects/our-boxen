class maven::package {

  package { 'maven':
    ensure => $maven::ensure,
  }
}
