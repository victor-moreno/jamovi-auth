## singularity jamovi

### create singularity image from docker image jamovi-auth

```
sudo singularity build jamovi.simg docker-daemon://jamovi/jamovi-auth:latest
```

### sites-enabled/jamovi.conf
apache config file to listen ports 41337-9 and reverse proxy to jamovi listening to ports 1337-9

### init 
script that starts apache and then jamovi (on default port 1337) 

### envvars
added bottom lines to redefine apache user as $USER
This avoids problems writing to /var logs and run

```
export APACHE_RUN_USER=$USER
export APACHE_RUN_GROUP=$USER
```
 
### ports.conf
modified to add a comment to line Listen 80 to avoid conflicts with other httpd server running in system

**envars** and **ports.conf** could be modified in the jamovi image at creation time

### submit.sh
sample start script to submit jamovi as a job in a sge cluster
modify according to your setting. If job runs in compute-0-15.local

```
open http://compute-0-15.local:41337
```

## limitations and recommendations
Someone that knows in which host:port jamovi is running can access it, bypassing the user/password request.
singularity networking requires running the image as root.

To ofuscate a little, you can use a random jamovi port in files **init** and **jamovi.conf**

Perhaps better copy file /usr/lib/jamovi/server/jamovi/server/\_\_main\_\_.py, change the default port there and bind it. This way jamovi port is not shown py ps

This could be automated in **submit.sh**
