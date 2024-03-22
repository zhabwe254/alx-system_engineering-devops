# Puppet manifest to install flask from pip3
class { 'python':
  version => '3.8',
}

package { 'python3-pip':
  ensure => 'installed',
}

exec { 'upgrade_pip':
  command => '/usr/bin/python3 -m pip install --upgrade pip',
  path    => ['/bin', '/usr/bin'],
  unless  => '/usr/bin/python3 -m pip --version | grep -qF "20.3"',
}

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Exec['upgrade_pip'],
}
