#!/bin/sh

# Create config file from template
envtpl < /pdns.conf.tpl > /etc/pdns/pdns.conf

if [ ! -d "/var/lib/powerdns" ];then
    echo "/var/lib/powerdns not found"
    mkdir -p /var/lib/powerdns
    if [ ! -f "/var/lib/powerdns/pdns.sqlite3" ];then
        echo "pdns.sqlite3 not found"
        cp -r /opt/powerdns/* /var/lib/powerdns
        sqlite3 /var/lib/powerdns/pdns.sqlite3 < /schema.sql
        chown -R pdns:pdns /var/lib/powerdns
    fi
fi

/usr/sbin/pdns_server