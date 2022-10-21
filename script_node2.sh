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
sudo cp -R /vagrant/pagina/* proyec1

cd proyec1

export VM_HOST=192.168.100.3
npm install consul
npm install express

echo "Runing consul agent"
#sudo consul agent -ui -dev -bind=192.168.100.3 -bootstrap-expect=1 -node=agent-two -enable-script-checks=true -data-dir=.
#sudo consul join 192.168.100.2

echo "Runing page"
#sudo node index.js 3000
#sudo node index.js 3001
#sudo node index.js 3002