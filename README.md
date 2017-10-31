# Execute 'auto_increment' fix for all Koha instances on MySQL start

here is a small solution for the problem described in the url below...
 https://wiki.koha-community.org/wiki/DBMS_auto_increment_fix

# install notes tested on debian.9

## clone repo
```
$ git clone https://github.com/KohaAloha/koha-mysql-init
```

## copy files
```
$ sudo  cp -a ./koha-mysql-init/koha-mysql-init.sh /etc/koha/
$ sudo  cp -a ./koha-mysql-init/koha-mysql-init.sql /etc/koha/
$ sudo  cp -a ./koha-mysql-init/koha-mysql-init.service  /etc/systemd/system/
```

## enable systemd unit file
```
$ sudo systemctl enable  koha-mysql-init 
$ sudo systemctl daemon-reload
$ sudo systemctl list-unit-files | grep koha
koha-mysql-init.service                enabled

```

## execute init script, via mysql 
```
$ sudo service mysql stop
$ sudo service mysql start

```

## confirm unit was run ok
```
$ sudo tail -f /var/log/syslog  | grep -i koha
Oct 31 14:54:53 server11 systemd[1]: Starting Koha SQL init...
Oct 31 14:55:03 server11 systemd[1]: Started Koha SQL init.
```



