include_recipe "apache2"

directory "/var/www/cdgd" do
  mode 00755
  owner "root"
  group node['apache']['root_group']
  :create
end

web_app "cdgd" do
  template "web_app_ajp.conf.erb"
  ajp_host 'localhost'
  ajp_port 8009
  server_name "cdgd.com"
  server_aliases [node['fqdn'], "cdgd.com"]
  docroot "/var/www/cdgd"
end