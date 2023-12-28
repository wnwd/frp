#!/bin/sh

if [ "$CONF_TYPE" = "" ]
    then CONF_TYPE="yml"
fi

if ! [ -s /etc/frp/frps.$CONF_TYPE ]
    then cp /app/conf/*.$CONF_TYPE /etc/frp/
fi

/usr/bin/frps -c /etc/frp/frps.$CONF_TYPE || echo "[Warnning] The default config file was not work, please modify it and restart the instance."