# Installs the package for openjdk-8-jdk
# @example
#   include openjdk8::install
class openjdk8::install {

  # Parameterize package name based on the operating system.
  $java_package_name  = $facts['os']['name'] ? {
    /(Ubuntu|Debian)/ => 'openjdk-8-jdk',
    /(RedHat|CentOS)/ => 'java-1.8.0-openjdk-devel',
  }

  $java_package_state = 'latest'

  package { 'java':
    name   => $java_package_name,
    ensure => $java_package_state,
  }
}
