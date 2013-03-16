name "roles"
description "Base recipes for provisioning a server"
run_list("recipe[yum]", "recipe[vim]", "recipe[rsync]", "recipe[ntp]", "recipe[mike_iptables]", "role[tomcat]", "role[web]", "role[database]", "role[jenkins]", "recipe[playground]")