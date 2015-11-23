class base::loadbalancer (
    String $keepalived_state = "MASTER",
    Integer $keepalived_priority = 100,
    String $keepalived_floating_ip = "10.10.1.252"
) inherits base::ubuntu {

    include keepalived

    package { 'ssh':
        ensure => present,
        before => Service['ssh'],
    }

    file { '/etc/ssh/sshd_config':
        ensure => file,
        mode   => '0600',
        source => 'puppet:///modules/sshd/sshd_config',
        before => Service['ssh'],
    }

    service { 'ssh':
        ensure  => running,
        require => [
            Package['ssh'],
            File['/etc/ssh/sshd_config'],
        ],
    }

    # Notify sshd on config changes
    File['/etc/ssh/sshd_config'] ~> Service['ssh']

    keepalived::vrrp::instance { 'VI_50':
        interface         => 'eth1',
        state             => $keepalived_state,
        virtual_router_id => 50,
        priority          => $keepalived_priority,
        auth_type         => 'PASS',
        auth_pass         => 'secret',
        virtual_ipaddress => [ $keepalived_floating_ip ],
    }
}
