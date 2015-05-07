# Install Screenhero into /Applications
#
# Usage:
#
#     include sublime_text_2
class screenhero {
  package { 'Screenhero':
    provider => 'appdmg',
    source   => 'http://dl.screenhero.com/update/screenhero/Screenhero.dmg';
  }
}