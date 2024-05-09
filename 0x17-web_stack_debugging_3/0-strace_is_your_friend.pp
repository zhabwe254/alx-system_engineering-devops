exec { 'strace-apache':
    command => 'strace -f -p $(lsof -i :80 | grep apache | awk \'{print $2}\') 2>&1 | grep -i --line-buffered "accept4"',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    creates => '/tmp/strace-apache.log',
    refreshonly => true,
}

file { '/tmp/strace-apache.log':
    ensure  => present,
    content => $strace_output,
    notify  => Exec['parse-strace-log'],
}

exec { 'parse-strace-log':
    command => 'grep -i --line-buffered "accept4" /tmp/strace-apache.log | grep -i --line-buffered "EAGAIN" && systemctl restart apache2',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    refreshonly => true,
}
