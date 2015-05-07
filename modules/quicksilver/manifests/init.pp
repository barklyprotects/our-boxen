# Public: Install Quicksilver to /Applications
#
# Examples
#
#  include quicksilver
class quicksilver($version='1.1.3') {

  package { "Quicksilver-${version}":
    provider => 'appdmg',
    source   => "https://dl.dropboxusercontent.com/s/1k73bxr6n6364en/Quicksilver-${version}.dmg",
  }

}
