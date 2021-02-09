# jamovi-auth

This Dockerfile adds apache2 to the [jamovi/jamovi](https://github.com/jamovi/jamovi) image and 
a configuration file to define a reverse proxy with authorization
the authfile included has been generated with
```
htpasswd -c authfile jamovi
```
password is jamovi
You can create your user and password

You can configure jamovi ports in docker-compose.yaml you need use three consecutive ports.
