Notes:

To pull env vars from wp-config, use:

#WP_CONFIG=$DIR/wp-config.php

#NOW=$(date +"%Y-%m-%d-%H-%M-%S")

#if [ ! -f "$WP_CONFIG" ]; then
#        echo Unable to locate file $WP_CONFIG
#        exit 1
#fi
#
#DB_HOST=$(php -r "require_once('$WP_CONFIG'); echo DB_HOST;");
#DB_USER=$(php -r "require_once('$WP_CONFIG'); echo DB_USER;");
#DB_PASSWORD=$(php -r "require_once('$WP_CONFIG'); echo DB_PASSWORD;");
#DB_NAME=$(php -r "require_once('$WP_CONFIG'); echo DB_NAME;");
