#!/bin/bash
if [[ `hostname -a` -eq "controller-0" ]];
then
	/vagrant/scripts/downloadTools.sh
	/vagrant/scripts/copyTools.sh
	/vagrant/scripts/createCAcerts.sh
	touch /vagrant/downloadComplete
else
	until [ -f /vagrant/downloadComplete ]
	do
     		sleep 5
	done
	/vagrant/scripts/copyTools.sh
fi

/vagrant/scripts/etcdServer.sh
