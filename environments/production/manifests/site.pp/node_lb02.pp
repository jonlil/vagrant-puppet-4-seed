node 'lb02' {
    class { 'base::loadbalancer':
        is_master => false
    }
}
