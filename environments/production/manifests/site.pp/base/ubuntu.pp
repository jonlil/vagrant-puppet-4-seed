class base::ubuntu inherits base::linux {
    exec { 'apt-update':
        command => '/usr/bin/apt-get update'
    }

    Exec['apt-update'] -> Package <| |>
}
