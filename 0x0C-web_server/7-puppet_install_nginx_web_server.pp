# Puppet manifest to install and configure Nginx web server

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Configure Nginx site
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => template('nginx/default.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Create a custom default template for Nginx configuration
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => template('nginx/default.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Nginx redirect resource
nginx::resource::vhost { 'redirect':
  www_root    => '/var/www/html',
  listen_port => '80',
  proxy       => 'http://www.youtube.com/watch?v=QH2-TGUlwu4',
  redirect    => true,
}

# Template for Nginx default configuration
file { '/etc/nginx/sites-available/default.erb':
  ensure  => present,
  content => template('nginx/default.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}
