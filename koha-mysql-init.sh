#!/bin/bash
for k in  $(koha-list)  ; do koha-mysql $k < /etc/koha/koha-mysql-init.sql; done
