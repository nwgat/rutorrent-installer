a project by
http://nwgat.ninja

WARNING: use a cleanly installed system, run this on a VPS you can destroy and re-create
~work in progress, help me improve it!~

# ruTorrent Installer
* Supervisor for easy control
* ruTorrent frontend 
* rTorrent torrent client
* Flexget for automatic tv shows
* Caddy web server
* https by default
* ufw firewall

**Defaults**
* Tested on Ubuntu 16.04 AMD64
* ufw enabled
* ufw opens 2015 (caddy) and 55950-56000 (rtorrent)
* php7.0-fpm supervisor git rtorrent curl wget ffmpeg mediainfo unrar nano unzip
* / (ruTorrent WebUI)
* /rtdl (Filemanger with Download & Upload)
* hourly tv show check (see /home/rtorrent/.flexget/config.yml)

**Supervisor**
* supervisorctl status
* supervisorctl stop rtorrent|caddy
* supervisorctl start rtorrent|caddy
* supervisorctl restart rtorrent|caddy

**TODO**
* fix curl not found
* [scgi support](https://github.com/mholt/caddy/issues/776) (waiting for caddy)

**Install (See Wiki)**
* [Install](https://github.com/nwgat/rutorrent-installer/wiki/Install)
* [Install in LXC Container](https://github.com/nwgat/rutorrent-installer/wiki/Install-in-a-LXC-Container)
* [Change pasword](https://github.com/nwgat/rutorrent-installer/wiki/Change-Password)
