include_recipe "simple_iptables::default"

simple_iptables_rule "tomcat" do
  rule "--proto tcp --dport 8080"
  jump "ACCEPT"
end

simple_iptables_rule "tomcat_ssl" do
  rule "--proto tcp --dport 8443"
  jump "ACCEPT"
end

simple_iptables_rule "mysql" do
  rule "--proto tcp --dport 3306"
  jump "ACCEPT"
end