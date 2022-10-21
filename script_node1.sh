#!/bin/bash
echo "Configurando y aprovisionando el equipo"
sudo apt-get update
sudo apt-get install -y unzip curl jq dnsutils
sudo wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
sudo echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install consul
echo "Installing dependencies"
sudo apt-get install -y nodejs
sudo apt-get install -y npm
mkdir proyec1
mkdir haproxy
sudo cp -R /vagrant/pagina/* proyec1
cd proyec1
export VM_HOST=192.168.100.2
npm install consul
npm install express
# Load balancer ++++++++++++++++
cd ~
echo "Installing HAProxy ..."
sudo apt install haproxy -y
cd ~
sudo systemctl enable haproxy
sudo cp -R /vagrant/haproxy/* haproxy
sudo mv ~/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg
sudo systemctl restart haproxy
echo "Running Consul Agent"
#sudo consul agent -ui -dev -bind=192.168.100.2 -bootstrap-expect=1 -node=agent-one -client=0.0.0.0 -data-dir=.
echo "Configurations artillery"
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
sudo nvm install [version.number]
sudo npm install -g artillery
