echo "nwgat.ninja rutorrent installer"
ip=`hostname -I`

# Install packages
apt-get update
apt-get install php7.0-fpm python-pip python3-pip git rtorrent curl wget -y
pip install supervisor

# supervisor configs
mkdir -p /etc/supervisor/conf.d/
mkdir -p /var/log/supervisor/

cp conf/supervisord.conf /etc/supervisor/supervisord.conf 
cp conf/caddy.conf /etc/supervisor/conf.d/
cp conf/rtorrent.conf /etc/supervisor/conf.d/

# Install caddy
wget https://github.com/mholt/caddy/releases/download/v0.8.2/caddy_linux_amd64.tar.gz >> /dev/null
tar xvf caddy_linux_amd64.tar.gz caddy >> /dev/null
install caddy /usr/bin

# setup rtorrent
useradd -m -p --disabled-password -s /bin/bash rtorrent
su -c 'mkdir $HOME/.session/ $HOME/rtdl $HOME/.caddy' rtorrent

cp conf/Caddyfile /home/rtorrent/.caddy/Caddyfile
cp conf/rtorrent.rc /home/rtorrent/.rtorrent.rc
chown -R rtorrent:rtorrent /home/rtorrent/.caddy/Caddyfile
chown -R rtorrent:rtorrent /home/rtorrent/.rtorrent.rc

# ruTorrent
git clone https://github.com/Novik/ruTorrent /home/rtorrent/ruTorrent
chown -R rtorrent:rtorrent /home/rtorrent/ruTorrent

# small fixes like starting supvisor on startup and caddy on port 80/443
sed '/exit 0/i setcap cap_net_bind_service=+ep /usr/bin/caddy' /etc/rc.local -i.bkp
sed '/exit 0/i supervisord -c /etc/supervisor/supervisord.conf' /etc/rc.local -i.bkp

# allow caddy for port 80 and start supervisord
setcap cap_net_bind_service=+ep /usr/bin/caddy
supervisord -c /etc/supervisor/supervisord.conf

# Details
echo "Login Details"
echo ""

supervisorctl status
echo ""
echo "Username: admin"
echo "Password: admin"
echo "ip: http://$ip"
