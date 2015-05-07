# Install latest MenuMeters
class menumeters {
	package { 'Menumeters':
		provider    => 'appdmg',
		source      => 'http://www.ragingmenace.com/software/download/MenuMeters.dmg'
	}
}