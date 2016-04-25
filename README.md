~work in progress, help me improve it!~
waiting for caddy to implement [scgi support](https://github.com/mholt/caddy/issues/776)


# ruTorrent Installer
* Supervisor for easy control
* ruTorrent frontend 
* rTorrent torrent client
* caddy web server
* ufw firewall

**Defaults**
* ufw enabled
* ufw opens 80, 443 and 6922
* php7.0-fpm supervisor git rtorrent curl wget ffmpeg mediainfo unrar nano unzip
* /home/rtorrent/ruTorrent (webui)
* /home/rtorrent/rtdl (data)

**Install**
* `apt-get install git -y`
* `git clone https://github.com/nwgat/rutorrent-installer.git && cd rutorrent-installer`
* `chmod +x ./rutorrent-installer.sh && ./rutorrent-installer.sh`

**Install in a LXC Container**
* `apt-get install lxc -y`
* `lxc-create -n loki -t ubuntu && lxc-start -n loki &&  lxc-attach -n loki`
* `apt-get install git -y`
* `git clone https://github.com/nwgat/rutorrent-installer.git && cd rutorrent-installer`
* `chmod +x ./rutorrent-installer.sh && ./rutorrent-installer.sh`
