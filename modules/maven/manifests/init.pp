class maven(
  $ensure          = present,
  $master_password = undef,
  $user_dir        = $maven::params::user_dir
) inherits maven::params {

  include maven::package
  include maven::config

  anchor { 'maven::begin': } ->
  Class['maven::package'] ->
  Class['maven::config'] ->
  Maven::Settings <| |> ->
  anchor { 'maven::end': }

}
