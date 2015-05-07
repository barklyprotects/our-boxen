# Install GPGTools.
class gpgtools ($version = '2014.12-b4'){
  package { 'GPGTools':
    name     => 'GPGTools.pkg',
    provider => 'pkgdmg',
    source   => "https://releases.gpgtools.org/GPG%20Suite%20-%20${version}.dmg",
  }
}
