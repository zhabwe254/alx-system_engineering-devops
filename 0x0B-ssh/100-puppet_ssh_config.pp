# This Puppet manifest configures the SSH client to use the private key ~/.ssh/school
# and refuse to authenticate using a password.

file_line { 'Turn off passwd auth':
  path    => '/etc/ssh/ssh_config',
  line    => 'PasswordAuthentication no',
  ensure  => present,
}

file_line { 'Declare identity file':
  path    => '/etc/ssh/ssh_config',
  line    => 'IdentityFile ~/.ssh/school',
  ensure  => present,
}
