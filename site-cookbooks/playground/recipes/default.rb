include_recipe "database::mysql"

mysql_connection_info = {:host => "localhost", :username => 'root', :password => node[:playground][:password]}

template "/opt/connection.properties" do
  source "connection.properties.erb"
  owner "root"
  group "root"
  mode 00444
end

mysql_database 'cdgd' do
  connection mysql_connection_info
  action :create
end