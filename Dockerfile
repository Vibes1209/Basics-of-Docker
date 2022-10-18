# Base Image
FROM python:3.9

# Set Working Directory
WORKDIR /hello_world_fastapi

# Copy requirements file to docker image
COPY ./requirements.txt /hello_world_fastapi/requirements.txt

# Install dependencies as per requirements file
RUN pip install --no-cache-dir --upgrade -r /hello_world_fastapi/requirements.txt

# Copy the hello world fastapi application
COPY ./my_fastapi_app /hello_world_fastapi/my_fastapi_app

# Run the hello world app
CMD ["uvicorn", "my_fastapi_app.main:app", "--host", "0.0.0.0", "--port", "8000"]
