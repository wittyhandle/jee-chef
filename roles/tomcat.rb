name "tomcat"
description "Tomcat and java recipes"
run_list %w(java mike_tomcat)

override_attributes(
  'tomcat' => {
    'java_options' => "${JAVA_OPTS} -Xmx128M -Djava.awt.headless=true"
  }
)
