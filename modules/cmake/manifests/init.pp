# Public: Installs CMake via homebrew
#
# Examples
#
#   include cmake
class cmake {
  include homebrew

  package { 'cmake': }
}
