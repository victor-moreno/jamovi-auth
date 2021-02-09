
FROM jamovi/jamovi

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	apache2 apache2-utils \
 && a2enmod proxy proxy_http proxy_wstunnel rewrite headers

ADD jamovi.conf /etc/apache2/sites-enabled

## generate authfile with user (jamovi) and password with:
#    htpasswd -c authfile jamovi

ADD authfile /etc/apache2/authfile

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["service apache2 start && /usr/bin/python3 -m jamovi.server 41337 --if=*"]
