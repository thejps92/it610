# Builds a Docker image with the tag "minecraft" from the Dockerfile located in the current directory
# Options: "-t" is used to tag the image with a user-defined name
docker build -t minecraft .

# Creates and runs a Docker container with an interactive shell based on the "minecraft" image where port 25565 in the container is published to port 25565 on the host and port 4040 in the container is published to port 4040 on the host
# Options: "-it" is used to enable an interactive shell within the container and "-p" is used to publish a container's port(s) to the host
docker run -it -p 25565:25565 -p 4040:4040 minecraft