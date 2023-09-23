#!/bin/bash
apt-get update
apt-get install curl vim -y
k8s_version="v1.28.1"
etcd_version="v3.4.27"
pushd /vagrant
curl -SL \
  -O "https://dl.k8s.io/${k8s_version}/bin/linux/amd64/kube-apiserver" \
  -O "https://dl.k8s.io/${k8s_version}/bin/linux/amd64/kube-controller-manager" \
  -O "https://dl.k8s.io/${k8s_version}/bin/linux/amd64/kube-scheduler" \
  -O "https://dl.k8s.io/${k8s_version}/bin/linux/amd64/kube-proxy" \
  -O "https://dl.k8s.io/${k8s_version}/bin/linux/amd64/kubelet" \
  -O "https://dl.k8s.io/${k8s_version}/bin/linux/amd64/kubectl" \
  -O "https://github.com/etcd-io/etcd/releases/download/v3.4.27/etcd-v3.4.27-linux-amd64.tar.gz" \
  -O "https://github.com/cloudflare/cfssl/releases/download/v1.6.4/cfssl_1.6.4_linux_amd64" \
  -O "https://github.com/cloudflare/cfssl/releases/download/v1.6.4/cfssljson_1.6.4_linux_amd64"

#  -O "https://github.com/cri-o/cri-o/releases/download/${k8s_version}/cri-o.amd64.${k8s_version}.tar.gz" \
#  -O "https://github.com/traefik/traefik/releases/download/v2.10.4/traefik_v2.10.4_linux_amd64.tar.gz"

mv cfssl_* cfssl
mv cfssljson_* cfssljson
chmod +x cfssl cfssljson
sudo chmod +x kube*
tar -xvf etcd-*.tar.gz
#tar -xvf cri-o*.tar.gz
popd


