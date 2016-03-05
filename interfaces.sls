# Because Ubuntu 14.04 stores all of it's network configuration files as "/etc/network/interfaces.d/*cfg" 
# none of the really cool commands commented out below to custom write a /etc/network/interfaces file will work, 
# and instead everything has to be done with file.managed.

sync eth0.cfg:
   file.managed:
     - name: /etc/network/interfaces.d/eth0.cfg
     - source: salt://interfaces/eth0.cfg
     - user: root
     - group: root
     - mode: 644

sync he-ipv6:
   file.managed:
     - name: /etc/network/interfaces.d/he-ipv6.cfg
     - source: salt://interfaces/he-ipv6.cfg
     - user: root
     - group: root 
     - mode: 644

sync checkipeth0:
   file.managed:
     - name: /usr/local/bin/checkipeth0
     - source: salt://interfaces/checkipeth0
     - user: root
     - group: root
     - mode: 755

# I read this cronjob was needed to keep the tunnel up, it's still running on the master, but just in case
sync cronjob:
   file.managed:
     - name: /etc/cron.d/he-ipv6
     - source: salt://interfaces/cron_he-ipv6
     - user: root
     - group: root
     - mode: 644

#system:
#  network.system:
#    - enabled: true
#    - proto: dhcp
#    - gatewaydev: eth0
#    - nozeroconf: true
#    - require_reboot: true
#
#eth0:
#  network.managed:
#    - enabled: true
#    - type: eth
#    - proto: dhcp
#    - enable_ipv6: true
#    - ipv6proto: static
#    - ipv6addr: 2001:470:1f05:fd::1
#    - ipv6netmask: 64
#    - ipv6gateway: 2001:470:1f04:fd::1
#
#sync checkipeth0:
#  file.managed:
#    - name: /usr/local/bin/checkipeth0
#    - source: salt://checkipeth0
#    - user: root
#    - group: root
#    - mode: 755
#
#he-ipv6:
#  network.managed:
#    - enabled: true
#    - type: eth
#    - enable_ipv6: true
#    - ipv6proto: v4tunnel
#    - ipv6addr: 2001:470:1f04:fd::2
#    - ipv6netmask: 64
#    - ipv6endpoint: 72.52.104.74
#    - ipv6local: `/usr/local/bin/checkipeth0`
#    - ipv6gateway: 2001:470:1f04:fd::1
