# php-edge-nginx
Docker file for edge servers running Nginx with modpagespeed and php fpm
Original idea came from [David Windell] (https://github.com/davidwindell) 

## Configuration Options
Most configuration can be done with environment variables. Here are the available options;

| Environment       | Default | Description |
| -------------     | ------- | --- |
| ENABLE_CRON       | Off     | Enables crond, add your cron jobs to /etc/crontab |
| PHP_OPCACHE       | Off     | Enables PHP OPcache extension |
| NGINX_SSL         | Off     | *On* - Enables HTTPS in Nginx with SPDY |
|                   |         | *Reduced* - Enables HTTPS with support for older (i.e. Java7) clients |
|                   |         | *High* - Enables HTTPS without TLS v1.0 (for PCI DSS 3.1 Compliance) |
| NGINX_HSTS        | Off     | Enable [HSTS] (http://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security) |
| NGINX_PAGESPEED   | Off     | Enable ngx_pagespeed extension |
| SMTP_HOST         | -       | Set SMTP hostname (uses MSMTP for sendmail) |
| SMTP_PORT         | -       | Set SMTP port |
| SMTP_USER         | -       | Set SMTP username |
| SMTP_FROM         | -       | Set SMTP envelope-from header |
| SMTP_PASS         | -       | Set SMTP password |
| SMTP_CHECK_CERTS  | On      | Specifying *Off* will disable SMTP TLS certificate checks |

