include_recipe "tomcat7::default"

cookbook_file "#{node[:tomcat7][:home]}/sample.war" do
  source "sample.war"
  mode 0755
  owner node[:tomcat7][:user]
  group node[:tomcat7][:group]
end

directory node[:tomcat][:ssl][:keystore_directory] do
  owner node[:tomcat7][:user]
  group node[:tomcat7][:group]
  mode 00700
  action :create
  only_if { node[:tomcat][:ssl][:enabled] }
end

mike_tomcat_ssl node[:tomcat][:ssl][:alias] do
  store_name node[:tomcat][:ssl][:keystore_name]
  store_directory node[:tomcat][:ssl][:keystore_directory]
  secret node[:tomcat][:ssl][:store_secret]
  cn node[:tomcat][:ssl][:cn]
  ou node[:tomcat][:ssl][:ou]
  o node[:tomcat][:ssl][:o]
  c node[:tomcat][:ssl][:c]
  validity node[:tomcat][:ssl][:validity]
  user node[:tomcat7][:user]
  
  action node[:tomcat][:ssl][:enabled] ? :enable : :disable
end

template "#{node[:tomcat7][:target]}/tomcat/conf/server.xml" do
  source "server.xml.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => "tomcat7")
end