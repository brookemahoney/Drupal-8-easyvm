Drupal-8-vm-fork
================

Virtual Machine for drupal 8 development (VirtualBox 4.3)

Based on Drupal vm project https://drupal.org/project/vm added .gitattributes and aiming to develop further.
Originally generated at https://puphpet.com/ 

1.- Clone this repo
```bash
$ git clone https://github.com/hechoendrupal/drupal8.dev.git
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

#### Database Credentials
* Name: drupal
* User: drupal
* Pass: drupal

#### Minimum requirements
* Git
* VirtualBox 4.3.x
* Vagrant 1.4.x
=======

