class base::linux {
    file { '/etc/passwd':
        owner => 'root',
        group => 'root',
        mode  => '0644',
    }
}
