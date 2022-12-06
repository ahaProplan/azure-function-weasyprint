# credit
This is a fork from `plankje/azure-function-weasyprint`. I've made change to the function name and updated to newer version of weasyprint and azure function. This project is being hosted as a azure docker container app.

# WeasyPrint template for Azure Function
The function is set up with the help of the [Azure Function quickstart guide](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-first-azure-function-azure-cli).
See also the [Azure custom Docker image tutorial](https://docs.microsoft.com/en-us/azure/app-service/containers/tutorial-custom-docker-image).
There is no need to init a new function with `func init <name>`, because the scaffold is already included in this document.

## Prerequisites
* Azure console
* Docker

## Setup project 
* Do not name your project or function `weasyprint`, because this may cause naming conflicts with the Python module WeasyPrint that is used in this template.

## Setup local Docker
Follow this procedure in case you want to deploy your own Dockerfile.
Use `plankje/azure-function-weasyprint` from Docker Hub if you just want to deploy the WeasyPrint function.

Be aware that the image name of your container must match the pattern `<hub-user>/<repo-name>:<tag>` in order to be able to push to Docker Hub.
The tag name is not required, and the value `latest` will be used if left empty.
It's therefore recommended to first create a repository at Docker Hub, before building the container.
The variable `<image_name>` in these instructions refer to the image name, for example `plankje/azure-function-weasyprint`.

### Local setup

* The local Docker is not capable of doing any form of authentication, therefore set `authLevel` in `http-trigger/function.json` to `anonymous` for locally testing the container.
* Build the Docker image locally with `docker build --no-cache -t <image_name> .`  (do not omit the trailing dot).
* Make sure that port 8080 is not yet claimed by any other process.
Run the Docker image locally with `docker run -p 8080:80 -it <image_name>`.
* Verify that the project is running properly on http://localhost:8080.
You should see a default Azure page with the message "_Your Functions 2.0 app is up and running_".
Later in this tutorial will be explained how to call the HTTP trigger.

With every change you make, the container needs to be restarted and rebuild, because it directly copies the project sources to the container.

* Make sure that the Docker image is not yet running with `docker ps`. 
Kill any active containers if necessary with `docker stop <CONTAINER ID>`.
* Rebuild the Docker image locally with `docker build -t <image_name> .`.
* Run the Docker image locally with `docker run -p 8080:80 -it <image_name>`.

### Deploy container to Docker hub
If you changed anything to the Dockerfile, you should push the container to Docker hub (or any other Docker repository) in order to use it in Azure.
See the [Docker hub documentation](https://docs.docker.com/docker-hub/repos/) for more detailed instructions.

* Log in to docker with `docker login`.
* Push the container with `docker push <image-name>`.
