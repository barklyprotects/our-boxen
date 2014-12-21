class cylent::apps::ansible {
  include python::virtualenvwrapper

  notify { 'class cylent::apps::ansible declared': }

  $ansible    = "${cylent_repo_dir}/ansible"
  $aws_vpc    = "${cylent_repo_dir}/cylent-ansible"

  ##This is an encrypted repo talk to ryan@cylentsystems
  ##if you feel you need access
  $aws_mgmt   = "${cylent_repo_dir}/aws-mgmt"

  ########## ANSIBLE BEGIN ##########

  repository {$ansible:
    source => 'ansible/ansible',
    require => File[$cylent_repo_dir]
  }

  python::mkvirtualenv {'ansible':
    ensure => present,
    systempkgs => true,
  }
  ->
  python::pip {'pyyaml':
    virtualenv => "${python::config::venv_home}/ansible"
  }
  ->
  python::pip {'jinja2':
    virtualenv => "${python::config::venv_home}/ansible"
  }
  ->
  python::pip {'paramiko':
    virtualenv => "${python::config::venv_home}/ansible"
  }
  ->
  python::pip {'httplib2':
    virtualenv => "${python::config::venv_home}/ansible"
  }
  ->
  python::pip {'boto':
    virtualenv => "${python::config::venv_home}/ansible"}
  ->
  python::pip {'keyring':
    virtualenv => "${python::config::venv_home}/ansible"}
  ->
  python::pip {'awscli':
    virtualenv => "${python::config::venv_home}/ansible",
    before => Notify['awscli']
  }
  ->
  exec {'aws-set-version':
    command => "${python::config::venv_home}/ansible/bin/aws configure set default.s3.signature_version s3v4"
  }

  repository { $aws_vpc:
    source => 'cylentsystems/ansible',
    require => File[$cylent_repo_dir]
  }

  repository { $aws_mgmt:
    source => 'cylentsystems/aws-mgmt',
    require => File[$cylent_repo_dir]
  }

  file {'ansible.zsh':
    path => "${cylent_env}/ansible.zsh",
    ensure => file,
    require => [Repository[$cylent_dotfiles],File[$cylent_env]],
    content => template("cylent/ansible_env.erb")
  }
}
