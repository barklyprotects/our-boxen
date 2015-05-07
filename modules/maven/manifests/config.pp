class maven::config {

  File {
    owner   => $::luser,
    group   => 'staff',
    mode    => '0600',
  }

  file {
    $maven::user_dir:
      ensure    => $maven::ensure ? {
        'present' => directory,
        default   => absent
      };

    "${maven::user_dir}/settings-security.xml":
      ensure  => $maven::ensure,
      content => template('maven/settings-security.xml.erb');
  }
}
