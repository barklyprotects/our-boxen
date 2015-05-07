# This is a placeholder class.
class office {

  $file = 'en_office_for_mac_home_and_business_2011_mac_4108337.dmg'
  $bucket = 's3://cylent-msdn'
  $local_path = "/Users/${::boxen_user}/.msdn"

  exec {"check_item":
    command => "test ! -e ${local_path}/${file}"
  }

  s3bucket { 's3bucket':
    aws_bucket_item => "${bucket}/${file}",
    download_path => "${local_path}",
    require => Exec["check_item"]
  }
  ->
  package { 'Office for Mac':
    provider => 'appdmg',
    source => "${local_path}/${file}"
  }
}
