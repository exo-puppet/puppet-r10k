class r10k($configfile, $ensure = 'present') {

  package { 'r10k':
    ensure   => $ensure,
    provider => gem,
  }

  # this file was deprecated with r10k version 1.5+
  file { '/etc/r10k.yaml':
    ensure => absent,
  }
  file { '/etc/r10k.yaml':
    ensure => present,
    path => '/etc/puppetlabs/r10k/r10k.yaml',
    owner  => root,
    group  => 0,
    source => $configfile,
  }
}
