#!/bin/bash
if [[ `hostname -a` -eq "controller-0" ]];
then
	/vagrant/scripts/downloadTools.sh
	/vagrant/scripts/copyTools.sh
	/vagrant/scripts/createCAcerts.sh
	/vagrant/scripts/kubeconfigCreate.sh
	/vagrant/scripts/createControlPlane.sh
	/vagrant/scripts/06_Encryption.sh
	touch /vagrant/downloadComplete
else
	until [ -f /vagrant/downloadComplete ]
	do
     		sleep 5
	done
	/vagrant/scripts/copyTools.sh
fi

/vagrant/scripts/etcdServer.sh
/vagrant/scripts/08_1_KubeApi.sh
/vagrant/scripts/08_2_KubeApi.sh
