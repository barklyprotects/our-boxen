# Set the OSX Recovery Message to the office phone number.
class cylent::osx::recovery_message {
  include osx

  osx::recovery_message { 'Property of Cylent Systems. This is an encrypted system. If found, please call (857) 277-1976.': }
}
