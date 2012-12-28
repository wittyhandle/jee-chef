action :enable do
  
  store = "#{new_resource.store_directory}/#{new_resource.store_name}"
  secret = new_resource.secret
  ssl_alias = new_resource.alias
  
  if has_cert(store, secret, ssl_alias, new_resource.user)
    
    Chef::Log.info "Found tomcat, not re-importing"

  else
    
    Chef::Log.info "No tomcat, import the certificate"
    
    cn = new_resource.cn
    ou = new_resource.ou
    o = new_resource.o
    c = new_resource.c
    validity = new_resource.validity
    
    cert_import_cmd = "#{ENV['JAVA_HOME']}/bin/keytool -genkeypair -dname \"cn=#{cn}, ou=#{ou}, o=#{o}, c=#{c}\" -alias #{ssl_alias} -keypass #{secret} -keystore #{store} -storepass #{secret} -validity #{validity}"
    Chef::Log.info "The certificate import command: #{cert_import_cmd}"
    
    cert_import = Mixlib::ShellOut.new(cert_import_cmd, :user => new_resource.user)
    cert_import.run_command
    import_result = cert_import.stdout
    
    Chef::Log.info "The certificate import command result: #{import_result}"
    
  end
  
end

action :disable do
  
  store = "#{new_resource.store_directory}/#{new_resource.store_name}"
  secret = new_resource.secret
  ssl_alias = new_resource.alias
  
  Chef::Log.info "Remove the #{ssl_alias} certificate"
  
  if has_cert(store, secret, ssl_alias, new_resource.user)
    
    cert_delete_cmd = "#{ENV['JAVA_HOME']}/bin/keytool -delete -alias #{ssl_alias} -keystore #{store} -storepass #{secret}"
    Chef::Log.info "The certificate delete command: #{cert_delete_cmd}"
    
    cert_delete = Mixlib::ShellOut.new(cert_delete_cmd, :user => new_resource.user)
    cert_delete.run_command
    delete_result = cert_delete.stdout
    
    Chef::Log.info "The certificate delete command result: #{delete_result}"
    
  end
  
end

def has_cert(store, secret, ssl_alias, user)
  
  Chef::Log.info "Check for a certificate for store #{store}, with secret #{secret} and alias #{ssl_alias}"
  
  cert_search_cmd = "#{ENV['JAVA_HOME']}/bin/keytool -list -keystore #{store} -storepass #{secret} | grep -o ^#{ssl_alias}"

  Chef::Log.info "The certificate search command: #{cert_search_cmd}"

  cert_search = Mixlib::ShellOut.new(cert_search_cmd, :user => user)
  cert_search.run_command
  search_result = cert_search.stdout.gsub("\n", "")

  Chef::Log.info "The search result: #{search_result}"

  return search_result == ssl_alias
  
end    