#!/bin/bash

#TODO confirm this is used no-where else and then remove it.
VAGRANT_CORE_FOLDER="/vagrant/puphpet"

OS='ubuntu'
CODENAME='precise'

if [[ ! -d /.puphpet-stuff ]]; then
    mkdir /.puphpet-stuff

    echo "/vagrant/puphpet" > "/.puphpet-stuff/vagrant-core-folder.txt"

    cat "/vagrant/puphpet/shell/self-promotion.txt"
    echo "Created directory /.puphpet-stuff"
fi

if [[ ! -f /.puphpet-stuff/initial-setup-repo-update ]]; then
   echo "Running initial-setup apt-get update"
   apt-get update >/dev/null
   touch /.puphpet-stuff/initial-setup-repo-update
   echo "Finished running initial-setup apt-get update"
fi

if [! -f /.puphpet-stuff/ubuntu-required-libraries]; then
    echo 'Installing basic curl packages (Ubuntu only)'
    apt-get install -y libcurl3 libcurl4-gnutls-dev >/dev/null
    echo 'Finished installing basic curl packages (Ubuntu only)'

    touch /.puphpet-stuff/ubuntu-required-libraries
fi
