#!/bin/bash
rm -fr *.json *.pem *.csr downloadComplete
vagrant destroy --force 
for i in controller-{0..2}; do  echo $i; vagrant up $i & sleep 60; done
