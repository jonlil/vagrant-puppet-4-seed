node 'lb01' {
    class { 'base::loadbalancer':
        keepalived_state => 'MASTER',
    }
}
