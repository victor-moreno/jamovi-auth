#! /bin/bash
#$ -S /bin/bash
#$ -N jamovi
#$ -cwd
#$ -j y
#$ -o jamovi.log

module load apps/singularity-3.5.3

cd ~/singularity/jamovi/

# clean & setup run + logs
rm -rf jamovi/logs
rm -rf jamovi/run
mkdir -p jamovi/logs
mkdir -p jamovi/run/lock

singularity exec \
-B jamovi/run:/run \
-B jamovi/logs:/var/log/apache2 \
-B jamovi/envvars:/etc/apache2/envvars \
-B jamovi/ports.conf:/etc/apache2/ports.conf \
-B jamovi/sites-enabled:/etc/apache2/sites-enabled \
-B jamovi/init:/init \
jamovi.simg /init


