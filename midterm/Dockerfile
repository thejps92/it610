# Uses the Ubuntu 22.04 parent image
FROM ubuntu:22.04

# Updates the package lists on the system
RUN apt update

# Updates the package lists on the system again and installs curl, jq, wget, openjdk-17-jdk, ngrok, and tmux
# Options: "-y" is used to pass the answer "yes" to all prompts during installation
RUN apt update && apt install curl -y
RUN apt update && apt install jq -y
RUN apt update && apt install wget -y
RUN apt update && apt install openjdk-17-jdk -y
RUN  curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install ngrok -y
RUN apt update && apt install tmux -y

# Makes a directory called "minecraft" and sets it as the working directory of the image
RUN mkdir /minecraft
WORKDIR /minecraft

# Defines a volume for Minecraft data
VOLUME /minecraft/mc_data

# Copies the shell scripts "minecraft.sh", "ngrok.sh", and "tmux.sh" from the host machine's build directory into the working directory of the image
COPY "minecraft.sh" .
COPY "ngrok.sh" .
COPY "tmux.sh" .

# Specifies "./tmux.sh" to be the default command that is executed when a container is started
ENTRYPOINT [ "./tmux.sh" ]