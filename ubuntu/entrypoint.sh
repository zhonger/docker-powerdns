#!/bin/sh

# Create config file from template
envtpl < /pdns.conf.tpl > /etc/powerdns/pdns.conf

if [ ! -f "/var/lib/powerdns/pdns.sqlite3" ];then
    echo "pdns.sqlite3 not found"
    cp -r /opt/powerdns/* /var/lib/powerdns
    sqlite3 /var/lib/powerdns/pdns.sqlite3 < /usr/share/doc/pdns-backend-sqlite3/schema.sqlite3.sql
    chown -R pdns:pdns /var/lib/powerdns
fi

/usr/sbin/pdns_server