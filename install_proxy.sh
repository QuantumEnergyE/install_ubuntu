cd
# shadowsocks
sudo apt-get -y install shadowsocks
ss_server_address=your_ss_server_address
ss_server_port=your_ss_server_port
ss_local_port=1080
ss_password="your_ss_password"
ss_encrypt_method="aes-256-cfb"
nohup sslocal -s "$ss_server_address" -p "$ss_server_port" -l "$ss_local_port" -k "$ss_password" -t 600 -m $ss_encrypt_method &
# privoxy
sudo apt-get -y install privoxy
echo "forward-socks5t / 127.0.0.1:$ss_local_port ." | sudo tee -a /etc/privoxy/config
sudo service privoxy restart
echo 'alias proxyon="export http_proxy=http://127.0.0.1:8118; export https_proxy=$http_proxy"' >> ~/.bashrc
echo 'alias proxyoff="unset http_proxy; unset https_proxy"' >> ~/.bashrc
source ~/.bashrc
