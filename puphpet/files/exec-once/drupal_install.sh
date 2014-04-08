#!/bin/bash

apt-get -y install php-apc

cd /var/www
git clone --branch 8.x http://git.drupal.org/project/drupal.git drupal8.dev

cd drupal8.dev

drush -y si standard --db-url=mysql://drupal:drupal@localhost/drupal --site-name=drupal8.dev --account-name=admin --account-pass=admin --account-mail=admin@drupal8.dev
service apache2 restart

