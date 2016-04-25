echo "## nwgat.ninja rutorrent installer ##"
echo ""
ip=`hostname -I`
echo "rutorrent Username"
read -e user
echo "rutorrent Password"
read -e pass

# Install packages
apt-get update
apt-get install php7.0-fpm supervisor git rtorrent curl wget ffmpeg mediainfo unrar nano unzip -y

# supervisor configs
mkdir -p /etc/supervisor/conf.d/
mkdir -p /var/log/supervisor/

cp conf/supervisord.conf /etc/supervisor/supervisord.conf 
cp conf/caddy.conf /etc/supervisor/conf.d/
cp conf/rtorrent.conf /etc/supervisor/conf.d/

# Install caddy
wget https://github.com/mholt/caddy/releases/download/v0.8.2/caddy_linux_amd64.tar.gz
tar xvf caddy_linux_amd64.tar.gz caddy >> /dev/null
install caddy /usr/bin

# setup rtorrent
useradd -m -p --disabled-password -s /bin/bash rtorrent
su -c 'mkdir $HOME/.session/ $HOME/rtdl $HOME/.caddy' rtorrent

cp conf/Caddyfile /home/rtorrent/.caddy/Caddyfile
sed -e "s/"user"/"$user"/g" /home/rtorrent/.caddy/Caddyfile -i.bkp
sed -e "s/"pass"/"$pass"/g" /home/rtorrent/.caddy/Caddyfile -i.bkp
cp conf/rtorrent.rc /home/rtorrent/.rtorrent.rc
chown -R rtorrent:rtorrent /home/rtorrent/.caddy/Caddyfile
chown -R rtorrent:rtorrent /home/rtorrent/.rtorrent.rc

# ruTorrent & php
git clone https://github.com/Novik/ruTorrent /home/rtorrent/ruTorrent
chown -R rtorrent:rtorrent /home/rtorrent/ruTorrent
usermod -G www-data rtorrent
service php7.0-fpm restart

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
echo "Username: $user"
echo "Password: $pass"
echo "ip: http://$ip"
