name "database"
description "mysql recipes"
run_list %w(mysql::client mysql::server)

override_attributes(
  'mysql' => {
    'allow_remote_root' => true,
    'server_root_password' => "en0ch",
    'server_debian_password' => "en0ch",
    'server_repl_password' => "en0ch",
    'bind_address' => "0.0.0.0"
  }
)