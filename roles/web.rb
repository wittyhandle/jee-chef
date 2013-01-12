name "web"
description "Apache recipes"
run_list %w(mike_apache apache2::mod_proxy_ajp)

#override_attributes(
#  'apache' => {
#    'default_modules' => ['proxy_ajp']
#  }
#)