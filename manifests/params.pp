class r10k::params {

  # Debian specific. Fix meeeeeeeee
  case $lsbdistcodename {
    'squeeze': {
      $r10k_bin = '/var/lib/gems/1.8/bin/r10k'
    }
    'precise', 'wheezy', 'trusty': {
      $r10k_bin = '/usr/local/bin/r10k'
    }
    'lucid': {
      $r10k_bin = '/var/lib/gems/1.8/bin/r10k'
    }
    default: {
      fail("The ${module_name} module is not supported on ${::operatingsystem} distribution ${::lsbdistcodename}")
    }
  }
}
