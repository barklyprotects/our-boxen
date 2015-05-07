define maven::settings(
  $content,
  $ensure = present,
) {

  $ensure_real = $ensure ? {
    'default'        => present,
    /present|absent/ => $ensure,
    default          => fail("ensure must be one of default, present or absent: ${ensure}")
  }

  file { "${maven::user_dir}/${name}":
    ensure  => $ensure_real,
    content => $content,
    owner   => $::luser,
    group   => 'staff',
    mode    => '0600',
  }

  if $ensure == 'default' {
    file { "${maven::user_dir}/settings.xml":
      ensure => link,
      target => "${maven::user_dir}/${name}"
    }
  }
}
