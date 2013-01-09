include_recipe "apache2"

directory "/var/www/cdgd" do
  mode 00755
  owner "root"
  group node['apache']['root_group']
  :create
end

web_app "cdgd" do
  server_name "cdgd.com"
  server_aliases [node['fqdn'], "cdgd.com"]
  cookbook "apache2"
  docroot "/var/www/cdgd"
end