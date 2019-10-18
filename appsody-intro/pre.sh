"Please wait whilst the environment is set up for you"
npm install express
touch .env
echo "PORT=8626" >> ./env.env
mkdir appsody-install
wget -P /root/appsody-install/ "https://github.com/appsody/appsody/releases/download/0.4.6/appsody_0.4.6_amd64.deb"
apt install -f /root/appsody-install/appsody_0.4.6_amd64.deb
"Start the guide!"