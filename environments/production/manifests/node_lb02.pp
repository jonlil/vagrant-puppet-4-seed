node 'lb02' {
    class { 'base::loadbalancer':
        keepalived_state => 'BACKUP',
        keepalived_priority => 101,
    }
}
