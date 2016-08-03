class r10k($configfile, $ensure = 'present') {

  ensure_packages ( 'r10k' , {
    'ensure'   => $ensure,
    'provider' => 'gem',
    'require' => [Class['apt::update'],Package['rubygems','ruby1.9.3']]
  } )

  # this file was deprecated with r10k version 1.5+
  file { '/etc/r10k.yaml-old-file':
    ensure => absent,
    path => '/etc/r10k.yaml',
  }

  file { '/etc/puppetlabs/':
    ensure => directory,
    owner  => root,
    group  => root,
    mode    => '0744',
  } ->
  file { '/etc/puppetlabs/r10k':
    ensure => directory,
    owner  => root,
    group  => root,
    mode    => '0744',
  } ->
  file { 'r10k.yaml':
    ensure => present,
    path => '/etc/puppetlabs/r10k/r10k.yaml',
    owner  => root,
    group  => 0,
    source => $configfile,
  }
}
