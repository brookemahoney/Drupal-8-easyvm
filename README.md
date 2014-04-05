Drupal-8-vm-fork
================

Virtual Machine for drupal 8 development (VirtualBox 4.3)

Based on Drupal vm project https://drupal.org/project/vm
Originally generated at https://puphpet.com/

Aiming to add my own variations, so far:

* Added .gitattributes to ensure shell file line endings remain LF
* Raised the VM memory from 512 to 1024MB


1.- Clone this repo
```bash
$ git clone https://github.com/chris-hall-hu/Drupal-8-vm-fork.git
$ cd drupal8.dev
$ vagrant up
```

2.- Add VM to hosts file
```bash
  192.168.9.10 drupal8.dev
```

3.- Clone Drupal 8 repo
```bash
$ vagrant ssh
$ cd /vagrant/www
$ git clone --branch 8.x http://git.drupal.org/project/drupal.git drupal8.dev
```

4.- Install Drupal 8
* Using drush
```bash
$ drush si standard --db-url=mysql://drupal:drupal@localhost/drupal --site-name=drupal8.dev --account-name=admin --account-pass=admin --account-mail=[user-email]
```

* Using the GUI accessing http://drupal8.dev

#### Tools on vm
* composer
* drush for drupal 8
* xdebug
* vim
