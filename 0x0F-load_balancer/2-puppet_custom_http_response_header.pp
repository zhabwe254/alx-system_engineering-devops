# Installs a Nginx server with custom HTTP header

exec { 'update':
  command => '/usr/bin/apt-get update -y',
  path    => ['/usr/bin', '/bin'],
}

exec { 'install Nginx':
  command => '/usr/bin/apt-get install -y nginx',
  path    => ['/usr/bin', '/bin'],
  require => Exec['update'],
}

exec { 'add_header':
  command     => 'sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOST\";/" /etc/nginx/nginx.conf',
  path        => ['/usr/bin', '/bin'],
  environment => ["HOST=${hostname}"],
  require     => Exec['install Nginx'],
  notify      => Exec['restart Nginx'],
}

exec { 'restart Nginx':
  command => 'service nginx restart',
  path    => ['/usr/bin', '/bin'],
  require => Exec['add_header'],
}
