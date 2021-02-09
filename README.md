# jamovi-auth

This Dockerfile adds apache2 to the [jamovi/jamovi](https://github.com/jamovi/jamovi) image and a configuration file to define a reverse proxy with authorization.

### authfile:  user & password
The authfile included (password is jamovi) has been generated with
```
htpasswd -c authfile jamovi
```

### ports
You can configure ports in docker-compose.yaml. Use three consecutive numbers.

Alternatively, you can use just one port if you define a domain name (i.e. jamovi) and two subdomains (a.jamovi and r.jamovi). This can be achieved adding a line like

127.0.0.1   jamovi a.jamovi r.jamovi

to /etc/hosts   in your local machine (linux / mac)


In that case, change all the port numbers to 80 in jamovi.conf to <VirtualHost *:80>  or the port number you want to use, and map this port in docker-compose.yaml.

