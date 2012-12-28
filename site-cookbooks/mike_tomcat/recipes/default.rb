include_recipe "tomcat::default"

cookbook_file "#{node[:tomcat][:webapp_dir]}/sample.war" do
  source "sample.war"
  mode 0755
  owner node[:tomcat][:user]
  group node[:tomcat][:group]
end

directory node[:tomcat][:ssl][:keystore_directory] do
  owner node[:tomcat][:user]
  group node[:tomcat][:group]
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
  user node[:tomcat][:user]
  
  action node[:tomcat][:ssl][:enabled] ? :enable : :disable
end

template "/etc/tomcat6/server.xml" do
  source "server.xml.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => "tomcat")
end