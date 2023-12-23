# Uses the Ubuntu 22.04 parent image
FROM ubuntu:22.04

# Updates the package lists on the system
RUN apt update

# Updates the package lists on the system again and installs curl and ngrok
# Options: "-y" is used to pass the answer "yes" to all prompts during installation
RUN apt update && apt install curl -y
RUN  curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install ngrok -y

# Makes a directory called "ngrok" and sets it as the working directory of the image
RUN mkdir /ngrok
WORKDIR /ngrok

# Copies the shell script "ngrok.sh" from the host machine's build directory into the working directory of the image
COPY "ngrok.sh" .