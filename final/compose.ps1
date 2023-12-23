# Starts Docker services defined in the compose.yaml file in detached mode
# Options: "-d" is used to run the containers in detached mode
docker-compose up -d

# Starts a new PowerShell process and then runs the command "docker-compose exec minecraft /bin/bash -c '/minecraft/minecraft.sh" which executes the "minecraft.sh" script inside the "minecraft" container
# Options: "-ArgumentList" is used to allow arguments to be passed to PowerShell, -NoExit" is used to ensure that the PowerShell window remains open after executing the command, and "-Command" is used to specify that the following argument is a command to be executed within PowerShell
Start-Process powershell -ArgumentList "-NoExit", "-Command", "docker-compose exec minecraft /bin/bash -c '/minecraft/minecraft.sh'"

# Starts a new PowerShell process and then runs the command "docker-compose exec ngrok /bin/bash -c '/ngrok/ngrok.sh" which executes the "ngrok.sh" script inside the "ngrok" container
# Options: "-ArgumentList" is used to allow arguments to be passed to PowerShell, -NoExit" is used to ensure that the PowerShell window remains open after executing the command, and "-Command" is used to specify that the following argument is a command to be executed within PowerShell
Start-Process powershell -ArgumentList "-NoExit", "-Command", "docker-compose exec ngrok /bin/bash -c '/ngrok/ngrok.sh'"