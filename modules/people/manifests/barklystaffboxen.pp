class people::default {
  include cylent::base

  ###### Environment Settings ##########
  include osx::finder::empty_trash_securely
  include cylent::osx::dock::minimize_to_application

}
