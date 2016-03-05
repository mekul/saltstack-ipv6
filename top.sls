base:
  'os_family:debian':
    - match: grain

webserver:
  '*minion':
    - apache
    - interfaces
    - postfix

file_roots
  webserver:
    - /srv/apache
    - /srv/interfaces
    - /srv/postfix
