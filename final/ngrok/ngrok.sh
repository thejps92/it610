#!/bin/bash

# Prompts the user from the terminal to enter their ngrok authtoken
echo "Enter your ngrok authtoken:"

# Reads the user input from the terminal and stores the ngrok authtoken in the variable "$authtoken"
read authtoken

# Saves the ngrok authtoken stored in the variable "$authtoken" to the "ngrok.yml" configuration file
ngrok config add-authtoken $authtoken

# Appends the line "web_addr: 0.0.0.0:4040" to the end of the "ngrok.yml" configuration file
echo "web_addr: 0.0.0.0:4040" >> /root/.config/ngrok/ngrok.yml

# Creates a secure tunnel to the TCP service running on port 25565 of the host machine
ngrok tcp localhost:25565