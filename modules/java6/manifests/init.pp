# Public: Install Java SE 6
#
# Examples
#
#  include java6
class java6 {
  package { 'Java6':
    provider => 'pkgdmg',
    source   => 'http://support.apple.com/downloads/DL1572/en_US/JavaForOSX2014-001.dmg',
  }
}
