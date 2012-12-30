template "/opt/connection.properties" do
  source "connection.properties.erb"
  owner "root"
  group "root"
  mode 00444
end