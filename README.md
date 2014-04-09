Drupal-8-easyvm
================

Virtual Machine for drupal 8 development (VirtualBox 4.3). This is **NOT** a secure configuration and should **NOT** be used for a production machine.

After ```vagrant up``` and waiting (there is lot to download and install) you should have a fresh Drupal 8 virtual machine with Drupal 8 installed and ready to go.

Based on Drupal vm project https://drupal.org/project/vm
Originally generated at https://puphpet.com/

Aiming to add my own variations, so far:

* Added .gitattributes to ensure shell file line endings remain LF
* Raised the VM memory from 512 to 1024MB
* Fixed the Puppet version updated to 3.4.3 otherwise the Puphpet base install fails with later versions
* Added a shell script to exec-once to perform the clone and install of Drupal 8
* Added install of php-apc to the exec-once script until I can discover why the puphpet.com setup fails to install APC via PECL on ubuntu correctly

**Note:** The current configuration does not use an NFS mount for the shared www directory. this probably makes it a little slow on Linux and OSX but still works for Windows (although even slower again). I am investigating a universal solution but guess that I may have to direct people to two different branches.


1.- Clone this repo
```bash
$ git clone https://github.com/chris-hall-hu/Drupal-8-easyvm.git drupal8.dev
$ cd drupal8.dev
$ vagrant up
```

2.- Add VM to hosts file on your computer
```bash
  192.168.9.10 drupal8.dev
```
3.- Enjoy Drupal 8

The admin account is set up with

**name**: admin  
**pass**: admin

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
* Vagrant 1.5.x
