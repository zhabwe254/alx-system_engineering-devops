# Puppet manifest to configure Nginx with custom X-Served-By HTTP response header

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define Nginx server configuration
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => '
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }

    # Custom HTTP header
    add_header X-Served-By $host;

}
',
  notify => Service['nginx'],
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}
