name "web"
description "Apache recipes"
run_list %w(mike_apache)

#override_attributes(
#  'apache' => {
#    'default_modules' => ['proxy_ajp']
#  }
#)