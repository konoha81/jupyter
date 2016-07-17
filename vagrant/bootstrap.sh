#!/usr/bin/env bash

apt-add-repository -y ppa:aims/sagemath
apt-get update
apt-get install -y sagemath-upstream-binary-full
apt-get install -y libmagickwand-dev	# for Wand

cp /vagrant/sage_daemon /etc/init.d/
cp -r /vagrant/.jupyter /home/vagrant/
ln -s /etc/init.d/sage_daemon /etc/rc2.d/S99sage
ln -s /vagrant/notebook /home/vagrant/notebook

# SageMathで日本語を正しく処理できるようにsitecustomize.pyをコピー
cp /vagrant/sitecustomize.py /usr/lib/sagemath/local/lib/python2.7/site-packages/

sage -sh <<\EOF
pip install pandas
pip install ggplot
pip install Wand
pip install seaborn
exit 0
EOF

sage -R <<\EOF
options(repos='http://cran.us.r-project.org')
install.packages('ggplot2')
install.packages('jsonlite')
install.packages('glmmML')
EOF
