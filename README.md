# vagrant-puppet-4-seed
small example of vagrant with puppet provisioner


### Requirements
* vagrant 1.8.0-dev (optional)
* [librarian-puppet](https://github.com/rodjek/librarian-puppet) - to handle puppet modules from puppetforge


### Getting started
Install vagrant ^1.8.0 
Install librarian-puppet 

```bash
cd /path/to/vagrant-puppet-4-seed/environments/production
librarian-puppet install
cd ../../
vagrant up lb01
```

