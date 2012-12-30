default[:tomcat][:ssl][:enabled] = true

default[:tomcat][:ssl][:keystore_directory] = "/opt/ssl"
default[:tomcat][:ssl][:keystore_name] = "keystore"
default[:tomcat][:ssl][:alias] = "tomcat"
default[:tomcat][:ssl][:store_secret] = "secret"

default[:tomcat][:ssl][:cn] = "Mike Ottinger"
default[:tomcat][:ssl][:ou] = "lab"
default[:tomcat][:ssl][:o] = "Lafayette"
default[:tomcat][:ssl][:c] = "California"

default[:tomcat][:ssl][:validity] = 3650