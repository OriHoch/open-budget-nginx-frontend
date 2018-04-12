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

### deployment

To setup the continuous deployment via travis you should set some travis env variables, verify you have the required vars:

```
$ travis env list
# environment variables for OpenBudget/open-budget-nginx-frontend
DOCKER_USERNAME=[secure]
DOCKER_PASSWORD=[secure]
GITHUB_TOKEN=[secure]
```

* Docker username / password - used to push to docker hub which is where the container orchestrator gets the images from.
* GitHub token - used to push the new docker image tag to the ops repository configuration values.
  * Make sure the token has write permissions to the relevant ops repo

further configuration of the continuous deployment process can be done in .travis.yml:

* `env.matrix` - configures the target deployment environment for each branch.
* `env.global` -
  * `K8S_OPS_REPO_BRANCH` / `K8S_OPS_REPO_SLUG` - the ops repo configuration changes are pushed to
  * `DEPLOY_VALUES_CHART_NAME` / `DEPLOY_VALUES_IMAGE_PROP` - the chart name and image property to update for this deployment
  * `DEPLOY_COMMIT_MESSAGE` - the commit message which will be logged to ops repo
