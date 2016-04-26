~work in progress, help me improve it!~

# ruTorrent Installer
* Supervisor for easy control
* ruTorrent frontend 
* rTorrent torrent client
* Caddy web server
* ufw firewall

**Defaults**
* ufw enabled
* ufw opens 80, 443 and 6922
* php7.0-fpm supervisor git rtorrent curl wget ffmpeg mediainfo unrar nano unzip
* /home/rtorrent/www/ruTorrent (webui)
* /home/rtorrent/www/rtdl (data, deny access by default, comment out line 8 in .caddy/Caddyfile to allow access to /rtdl)

**Supervisor**
* supervisorctl status
* supervisorctl stop rtorrent|caddy
* supervisorctl start rtorrent|caddy
* supervisorctl restart rtorrent|caddy

**TODO**
* fix curl not found
* [enable https](https://github.com/mholt/caddy/issues/327) by default (waiting for caddy)
* [scgi support](https://github.com/mholt/caddy/issues/776) (waiting for caddy)

**Install (See Wiki)**
* [Install](https://github.com/nwgat/rutorrent-installer/wiki/Install)
* [Install in LXC Container](https://github.com/nwgat/rutorrent-installer/wiki/Install-in-a-LXC-Container)
* [Change pasword](https://github.com/nwgat/rutorrent-installer/wiki/Change-Password)
