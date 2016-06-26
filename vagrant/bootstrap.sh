#!/usr/bin/env bash

apt-add-repository -y ppa:aims/sagemath
apt-get update
apt-get install -y sagemath-upstream-binary-full

cp /vagrant/sage_daemon /etc/init.d/
cp -r /vagrant/.jupyter /home/vagrant/
ln -s /etc/init.d/sage_daemon /etc/rc2.d/S99sage
ln -s /vagrant/notebook /home/vagrant/notebook

sage -sh <<\EOF
pip install pandas
exit 0
EOF