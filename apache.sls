# This state file installs apache, and duplicates the file needed to pass the enthusiast part of the cert.

install_apache:
  pkg.installed:
    - name: apache2

sync xfq8pmpu.txt:
  file.managed:
    - name: /var/www/html/xfq8pmpu.txt
    - source: salt://apache/xfq8pmpu.txt
    - user: root
    - group: root
    - mode: 644
