name "roles"
description "Base recipes for provisioning a server"
run_list( "recipe[yum]", "recipe[vim]", "recipe[ntp]", "recipe[mike_iptables]", "role[tomcat]")