# This is a placeholder class.
define s3bucket (
  $aws_access_key = 'AKIAJP5OKOA6EDDAL2CA',
  $aws_secret_key = 'WtTHI5qlF3hotH1TAxbQLaqzRyRzfrEOuWfQTlsp',
  $aws_command_path = '/opt/boxen/data/virturalenvs/ansible/bin',
  $download_path = "/Users/${::boxen_user}/.msdn",
  $aws_bucket_item  = 's3://cylent-msdn',
  $aws_s3_cmd = 'cp',
  $aws_s3_options = ''
) {



  file { "${download_path}":
    ensure => directory
  }

  exec { 'aws':
    environment => ["AWS_ACCESS_KEY_ID=${aws_access_key}","AWS_SECRET_ACCESS_KEY=${aws_secret_key}"],
    path => "${aws_command_path}",
    command => "aws s3 ${aws_s3_cmd} ${aws_bucket_item} ${download_path}/ ${aws_s3_options}"
  }

}
