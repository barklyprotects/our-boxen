class maven::params {

  $user_dir = $osfamily ? {
    'Darwin' => "/Users/${::luser}/.m2",
    default  => "/home/${::luser}/.m2",
  }
}
