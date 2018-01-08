# Open Budget Nginx Frontend

## Using docker-compose to start the environment

**WARNING** running the full environment is extremely resource intensive, start with caution.

You can comment out servers in `server-rules.conf`, `docker-compose.yml` and `startup.sh` to start partial environment

* Install Docker and Docker Compose
* Start the environment
```
docker-compose up -d
```
* replace any next.obudget.org url with localhost
  * http://localhost/
  * http://localhost/pipelines/
  * http://localhost/app/search
