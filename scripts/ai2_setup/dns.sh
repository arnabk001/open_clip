pip install img2dataset

# Knot resolver
wget https://secure.nic.cz/files/knot-resolver/knot-resolver-release.deb
sudo dpkg -i knot-resolver-release.deb
sudo apt update
sudo apt install -y knot-resolver
sudo sh -c 'echo `hostname -I` `hostname` >> /etc/hosts'
sudo sh -c 'echo nameserver 127.0.0.1 > /etc/resolv.conf'
sudo systemctl stop systemd-resolved

# then start 4 instances with
sudo systemctl start kresd@1.service
sudo systemctl start kresd@2.service
sudo systemctl start kresd@3.service
sudo systemctl start kresd@4.service

#Setting up a bind9 resolver
sudo apt install bind9