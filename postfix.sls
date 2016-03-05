# the following state file installs postfix, sync's with the master's main.cf and
# aliases file to duplicate the mail server and update user accounts.

install_postfix:
 pkg.installed:
   - name: postfix

make sure postfix is running:
 service.running:
   - name: postfix
   - enable: True
   - watch:
     - pkg: install_postfix
     - file: sync main.cf

sync main.cf:
 file.managed:
   - name: /etc/postfix/main.cf
   - source: salt://postfix/main.cf
   - user: root
   - group: root
   - mode: 644
   - require:
     - pkg: install_postfix

sync aliases:
 file.managed:
   - name: /etc/aliases
   - source: salt://postfix/aliases
   - user: root
   - group: root
   - mode: 644
   - require:
     - pkg: install_postfix

run-newaliases:
  cmd.wait:
   - name: newaliases
   - cwd: /
   - watch:
     - file: /etc/aliases
