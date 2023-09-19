Setup wireguard :
- Install it...
- Need to generate key pair

config on pc : /etc/wireguard/wg0
[Interface]
PrivateKey=[Insert private key]
// Adress to take when connected to vpn
Address=192.168.50.4
// Dns to use
DNS=8.8.8.8,8.8.4.4

[Peer]
// Public key of raspi
PublicKey=[Insert pi public key]
// = All ip should pass through vpn
AllowedIPs=0.0.0.0/0
// Public raspi ip
EndPoint=178.237.86.224:51820


Config on raspi :
[Peer]
PublicKey=[Insert client public key]
// The ip the client should take.
AllowedIPs = 192.168.50.4/32

