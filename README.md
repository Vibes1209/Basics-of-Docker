# Basics-of-Docker
This repository contains info regarding basic docker commands and how to containerize a FastAPI app

## Tasks Covered in this repository
1. [Task 1 - Basic Docker Commands](#task-1---basic-docker-commands)
2. [Task 2 - Run Docker Container Locally](#task-2---run-docker-container-locally)
3. [Task 3 - Dockerize a FastAPI App](#task-3---dockerize-a-fastapi-app)
4. [Task 4 - Automate Dockerization using Github Actions](#task-4---automate-dockerization-using-github-actions)

### Task 1 - Basic Docker Commands


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

### Task 4 - Automate Dockerization using Github Actions
