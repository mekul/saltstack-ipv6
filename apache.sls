# This state file installs apache, and duplicates the file needed to pass the enthusiast part of the cert.

install_apache:
  pkg.installed:
    - name: apache2

sync xfq8pmpu.txt
  file.managed:
    - name: /var/www/html/xf8pmpu.txt
    - source: salt://xfq8pmpu.txt
    - user: root
    - group: root
    - mode: 644
