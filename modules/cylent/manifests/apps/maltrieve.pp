class cylent::apps::maltrieve {
  include python::virtualenvwrapper

  notify { 'class cylent::apps::maltrieve declared': }

  $maltrieve_repo = "${cylent_repo_dir}/maltrieve"
  $virtualenv = "${python::config::venv_home}/maltrieve"

  repository {$maltrieve_repo:
    source => 'cylentsystems/maltrieve',
    require => File[$cylent_repo_dir]
  }

  python::mkvirtualenv {'maltrieve':
    ensure => present,
    systempkgs => true,
  }
  ->
  python::pip {'feedparser':
    virtualenv => "${virtualenv}"
  }
  ->
  python::pip {'requests':
    virtualenv => "${virtualenv}"
  }
  ->
  python::pip {'python-magic':
    virtualenv => "${virtualenv}"
  }
  ->
  python::pip {"${virtualenv}/boto":
    package => 'boto',
    virtualenv => "${virtualenv}"
    }
  ->
  python::pip {"${virtualenv}/httplib2":
    package => 'httplib2',
    virtualenv => "${virtualenv}"
  }
  ->
  python::pip {'gevent':
    virtualenv => "${virtualenv}"
  }
  ->
  python::pip {'greenlet':
    virtualenv => "${virtualenv}"
  }
  ->
  python::pip {'grequests':
    virtualenv => "${virtualenv}"
  }
  ->
  python::pip {'wsgiref':
    virtualenv => "${virtualenv}"
  }
  ->
  python::pip {'beautifulsoup4':
    virtualenv => "${virtualenv}"
  }
}
