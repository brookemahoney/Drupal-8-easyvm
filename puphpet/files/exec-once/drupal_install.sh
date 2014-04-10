#!/bin/bash

apt-get -y install php-apc

cd /var/www
git clone --branch 8.x http://git.drupal.org/project/drupal.git drupal8.dev

# Make everything owned by vagrant (which the webserver runs as) this is not a production environment.
chown -R vagrant:vagrant drupal8.dev

cd drupal8.dev

drush -y si standard --db-url=mysql://drupal:drupal@localhost/drupal --site-name=drupal8.dev --account-name=admin --account-pass=admin --account-mail=admin@drupal8.dev

# Ensure that the site has access to the files directory (and anything currently in it).
chown -R vagrant:vagrant /var/www/drupal8.dev/sites/default/files

service apache2 restart

