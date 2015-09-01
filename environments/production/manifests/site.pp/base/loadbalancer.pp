class base::loadbalancer (Boolean $is_master = true) inherits base::ubuntu {
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
}
