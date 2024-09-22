# Alertrix
Der Messenger für Einsatzkräfte


## Running the service
### Starting for the first time
Before starting for the first time, run
```commandline
sudo docker-compose build
```


## Configuration options

`PORT`  The port you want the docker container to publish

`DATA_PATH`  relative or absolute path for where to store the persistent data

`DJANGO_SECRET_KEY`  a random secret key for django

`DJANGO_DEBUG`  optional: set to 'true', 'True' or '1' to use the debug mode

`DJANGO_ALLOWED_HOSTS`  a comma separated list of allowed host names. Should include at least your domain

`DJANGO_CSRF_TRUSTED_ORIGINS`  a list of hostnames that can generate csrf tokens, defaults to DJANGO_ALLOWED_HOSTS

`CSP_IMG_SRC`  a comma separated list of domains that can provide images to this service. Should include any cdn (and - for now - as many homeserver domains as you can provide).

`DATABASE_TYPE`  take a look at [src/alertrix_deployment/settings.py](./src/alertrix_deployment/settings.py) where DATABASES is defined

`DATABASE_HOST`  the databases host name

`DATABASE_USER`  the username used to access the database

`DATABASE_PASSWORD`  the databases password

`DATABASE_NAME` the databases table name
