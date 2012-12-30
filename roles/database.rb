name "database"
description "mysql recipes"
run_list %w(mysql::client mysql::server)

override_attributes(
  'mysql' => {
    'server_root_password' => "en0ch",
    'server_debian_password' => "en0ch",
    'server_repl_password' => "en0ch"
  }
)