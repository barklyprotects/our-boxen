# Public: Install Tunnelblick.app to /Applications.
#
# Examples
#
#   include tunnelblick
class tunnelblick(
  $version = '3.4.2',
  $build = '4055.4161'
) {
  package { 'Tunnelblick':
    provider => 'appdmg',
    source   => "http://downloads.sourceforge.net/project/tunnelblick/All%20files/Tunnelblick_${version}_build_${build}.dmg",
  }
}
