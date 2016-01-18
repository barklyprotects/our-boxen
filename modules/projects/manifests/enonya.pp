class projects::enonya {
  include python::virtualenvwrapper

  notify { 'class cylent::projects::enonya declared': }

  package {
    [
      'libffi',
      'mysql'
    ]:
  }

  repository { "${cylent_repo_dir}/enonya":
    source => 'barklyprotects/enonya',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/airflow":
    source => 'barklyprotects/airflow',
    require => File[$cylent_repo_dir]
  }

  python::mkvirtualenv {'enonya':
    ensure => present,
    systempkgs => true,
  }
  ->
  python::pip {'enonya-airflow[s3]':
    package => 'airflow[s3]',
    virtualenv => "${python::config::venv_home}/enonya"
  }
  ->
  python::pip {'enonya-psycopg2':
    package => 'psycopg2',
    virtualenv => "${python::config::venv_home}/enonya"
  }
  ->
  python::pip {'enonya-awscli':
    package => 'awscli',
    virtualenv => "${python::config::venv_home}/enonya"
  }
  ->
  python::pip {'enonya-cryptography':
    package => 'cryptography',
    virtualenv => "${python::config::venv_home}/enonya"
  }
  ->
  python::pip {'enonya-gevent':
    package => 'gevent',
    virtualenv => "${python::config::venv_home}/enonya"
  }
  ->
  python::pip {'enonya-feedparser':
    package => 'feedparser',
    virtualenv => "${python::config::venv_home}/enonya"
  }
  ->
  python::pip {'enonya-BeautifulSoup':
    package => 'BeautifulSoup',
    virtualenv => "${python::config::venv_home}/enonya"
  }
  ->
  python::pip {'enonya-python-magic':
    package => 'python-magic',
    virtualenv => "${python::config::venv_home}/enonya"
  }
}
