class people::alanyang3 {
  include cylent::dev_environment

  ###### Environment Settings ##########
  include osx::dock::autohide
  include osx::dock::dim_hidden_apps
  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::show_hidden_files


  class { 'osx::dock::hot_corners':
    top_right => 'Application Windows',
    top_left  => 'Desktop',
    bottom_right => 'Start Screen Saver',
    bottom_left => 'Dashboard'
  }

  include cylent::osx::dock::minimize_to_application

}
