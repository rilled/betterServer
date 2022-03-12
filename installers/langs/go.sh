#!/bin/bash
cd ${HOME}
curl -OL https://go.dev/dl/go1.17.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.17.7.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ${HOME}/.profile
source ~/.profile
go version
