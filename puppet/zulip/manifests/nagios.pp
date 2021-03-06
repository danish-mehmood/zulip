# This manifest installs Zulip's Nagios plugins intended to be on
# localhost on a Nagios server.
#
# Depends on zulip::base to have installed `nagios-plugins-basic`.
class zulip::nagios {
  $nagios_plugins = $::osfamily ? {
    'debian' => 'nagios-plugins-basic',
    'redhat' => 'nagios-plugins',
  }
  file { '/usr/lib/nagios/plugins/zulip_nagios_server':
    require => Package[$nagios_plugins],
    recurse => true,
    purge   => true,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/zulip/nagios_plugins/zulip_nagios_server',
  }
}
