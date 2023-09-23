#!/bin/bash
pushd /vagrant
sudo cp kube-* /usr/local/bin/
sudo cp kubectl /usr/local/bin/
sudo cp kubelet /usr/local/bin/
sudo cp cfssl cfssljson /usr/local/bin/
cp etcd-*/etcd* /usr/local/bin
popd
