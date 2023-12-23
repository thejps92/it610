# Uses the Ubuntu 22.04 parent image
FROM ubuntu:22.04

# Updates the package lists on the system
RUN apt update

# Updates the package lists on the system again and installs curl, jq, wget, and openjdk-17-jdk
# Options: "-y" is used to pass the answer "yes" to all prompts during installation
RUN apt update && apt install curl -y
RUN apt update && apt install jq -y
RUN apt update && apt install wget -y
RUN apt update && apt install openjdk-17-jdk -y

# Makes a directory called "minecraft" and sets it as the working directory of the image
RUN mkdir /minecraft
WORKDIR /minecraft

# Copies the shell script "minecraft.sh" from the host machine's build directory into the working directory of the image
COPY "minecraft.sh" .