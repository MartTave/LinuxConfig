Setup wireguard :
- Install it...
- Need to generate key pair

~~~
sudo apt install wireguard -y;
sudo chmod +x /etc/wireguard;
wg genkey | sudo tee /etc/wireguard/private.key;
sudo cat /etc/wireguard/private.key | wg pubkey | sudo tee /etc wireguard/public.key;
~~~

Then you can copy `wg0.conf` and change needed value
Don't forget to add you pubkey to the raspberrypi config file -> pi.conf


