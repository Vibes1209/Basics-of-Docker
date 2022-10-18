# Basics-of-Docker
This repository contains info regarding basic docker commands and how to containerize a FastAPI app

## Tasks Covered in this repository
1. [Task 1 - Basic Docker Commands](#task-1---basic-docker-commands)
2. [Task 2 - Run Docker Container Locally](#task-2---run-docker-container-locally)
3. [Task 3 - Dockerize a FastAPI App](#task-3---dockerize-a-fastapi-app)
4. [Task 4 - Automate Dockerization using Github Actions](#task-4---automate-dockerization-using-github-actions)

### Task 1 - Basic Docker Commands

| Command | Description | Screenshot |
| --- | --- | --- |
| docker pull <image-name[:tag]> | Pulls the specified image from dockerhub (or other container registries) | [View](/images/docker-pull.png) |
| docker build -t <tag-name> . | Used to build a docker image from the Dockerfile from the current directory | [View](/images/docker-build.png) |
| docker images | Lists the images available locally | [View](/images/docker-images.png) |
| docker run <image-name> | Runs the image as a container | [View](/images/docker-run.png) |
| docker ps | Lists all the running containers | [View](/images/docker-ps.png) |
| docker start <container-id> | Used to start a container | [View](/images/docker-start.png) |
| docker stop <container-id> | Used to stop a container | [View](/images/docker-stop.png) |
| docker rmi <image-name> | Used to delete a docker image | [View](/images/docker-rmi.png) |
| docker kill <container-id> | Used to forcefully shutdown a container | [View](/images/docker-kill.png) |
| docker tag <image-name[:tag]> <new-image-name[:new-tag]> | Used to rename/retag a docker image | [View](/images/docker-tag.png) |
| docker logs <container-id> | Used to display the logs inside the running container | [View](/images/docker-logs.png) |
| docker login | Used to get access for pushing an image into the dockerhub | [View](/images/docker-login.png) |
| docker push <image-name[:tag]> | Used to push an image into dockerhub | [View](/images/fastapi_docker_push.png) |
| docker network ls | Lists the docker networks available. We can use networks to connect our containers | [View](/images/docker-network-ls.png) |
| docker exec -it <container-id> bash | Gain access to a bash shell of a running container | [View](/images/docker-exec.png.png) |


### Task 2 - Run Docker Container Locally
* Pull a docker image (hello-world) from docker hub using ``` docker pull hello-world ```
* Run the pulled docker image with ``` docker run hello-world ```

![Running Docker Container Locally](/images/hello-world-screenshot.png)<br><br>

### Task 3 - Dockerize a FastAPI App
* Create a simple Hello World app using FastAPI (check out app.py) and add a requirements.txt
* Test the app by running ```uvicorn app:app --host 0.0.0.0 --port 8000``` . Once we confirm that the app is running in stand-alone mode, we can now dockerize the app
* Create a Dockerfile (checkout Dockerfile in the repo)
    - First mention the base image on which the app is going to be built
    - Add a COPY command to copy the relevant files
    - Include installation commands
    - Include the starting command to start the API server
* Build the docker file with ```docker build <image name>```
* Test the container by running ```docker run <image name>```
* Once testing is successful, push the image to dockerhub registry using ```docker push <image name>```

![Running Docker Image](/images/fastapi_docker_run.png) <br><br>
![Pushing Docker Image](/images/fastapi_docker_push.png)<br><br>
![Docker Hub Link](https://hub.docker.com/layers/vibes1209/my_fastapi_app/v1/images/sha256-4ce441a4998eae1ec2d45e0e9be9717e3529de4bebe5cc3fe133389ea3e6a503?context=repo)<br><br>

### Task 4 - Automate Dockerization using Github Actions
* Created a custom github workflow. It has two jobs running sequentially.
* The first job builds and tests the FastAPI application.
    1. Checkout the code and setup a python environment
    2. Install Dependencies
    3. Run pytest to test the app
* On succesful completion of the first job, the second job starts.
    1. First, we will login to docker hub (Add docker secrets in the repo sectrets)
    2. Build the docker image from Dockerfile
    3. Add tag to the image
    4. Push the image to docker hub

[!Github Action Workflow](https://github.com/Vibes1209/Basics-of-Docker/actions/runs/3272191860) <br>
[!Docker Hub Link](https://hub.docker.com/layers/vibes1209/my_fastapi_app/main/images/sha256-47e3d94b684d7cd195ee742438d209b7aacc8c621ac5064c1b56555db018eefe?context=repo)
