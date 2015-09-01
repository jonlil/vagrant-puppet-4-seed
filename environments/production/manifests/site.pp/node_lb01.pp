node 'lb01' {
    class { 'base::loadbalancer':
        is_master => true
    }
}
