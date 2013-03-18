name "jenkins"
description "Jenkins recipes"
run_list %w(maven git jenkins::server)