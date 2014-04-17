#!/bin/bash

VAGRANT_CORE_FOLDER=$(cat "/.puphpet-stuff/vagrant-core-folder.txt")

OS='ubuntu'
RELEASE='12.04'
CODENAME='precise'

if [[ ! -f /.puphpet-stuff/update-puppet ]]; then
    echo "Downloading http://apt.puppetlabs.com/puppetlabs-release-${CODENAME}.deb"
    wget --quiet --tries=5 --connect-timeout=10 -O "/.puphpet-stuff/puppetlabs-release-${CODENAME}.deb" "http://apt.puppetlabs.com/puppetlabs-release-${CODENAME}.deb"
    echo "Finished downloading http://apt.puppetlabs.com/puppetlabs-release-${CODENAME}.deb"

    dpkg -i "/.puphpet-stuff/puppetlabs-release-${CODENAME}.deb" >/dev/null

    echo "Running update-puppet apt-get update"
    apt-get update >/dev/null
    echo "Finished running update-puppet apt-get update"
	
    echo "Updating Puppet to version 3.4.3"
    apt-get install -y puppet=3.4.3-1puppetlabs1 puppet-common=3.4.3-1puppetlabs1 >/dev/null
    echo "Finished updating puppet to version: 3.4.3"
	
    touch /.puphpet-stuff/update-puppet
    echo "Created empty file /.puphpet-stuff/update-puppet"
fi
