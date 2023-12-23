#!/bin/bash

# Prompts the user from the terminal to enter their Minecraft version
echo "Enter your Minecraft version:"

# Reads the user input from the terminal and stores the Minecraft version in the variable "$mc_user_version"
read mc_user_version

# Uses curl to extract the JSON data from the URL "https://launchermeta.mojang.com/mc/game/version_manifest.json" and then uses jq to filter out the URL containing the JSON data for the user's version of Minecraft and then uses tr to delete double quotes from the output and stores the result in the variable "$mc_user_version_json_url"
# Options: "-s" is used to have curl to operate silently without showing progress, "--arg" sets the variable "$version" to the value of "$mc_user_version", and "-d" specifies to delete double quotes from the output
mc_user_version_json_url=$(curl -s "https://launchermeta.mojang.com/mc/game/version_manifest.json" | jq --arg version "$mc_user_version" '.versions[] | select(.id == $version).url' | tr -d '"')

# Uses curl to extract the JSON data from the URL stored in the variable "$mc_user_version_json_url" and then uses jq to filter out the URL containing the "server.jar" file and stores the result in the variable "$mc_user_version_serverjar_url"
# Options: "-s" is uesd to have curl operate silently wihout showing progress and "-r" is used to remove quotes from the jq filter's result if the result is a string
mc_user_version_serverjar_url=$(curl -s "$mc_user_version_json_url" | jq -r '.downloads.server.url')

# Uses wget to download the "server.jar" file from the URL stored in the variable "$mc_user_version_serverjar_url"
wget "$mc_user_version_serverjar_url"

# Uses the Java runtime executable from openjdk-17-jdk to run the "server.jar" file without a GUI in order to create the necessary files needed to start the Minecraft server (This will return an error and exit)
# Options: "-Xms2048M" is used to set the initial heap memory size for the Java process to 2048 MB, "-Xms3472M" is used to set the maximum heap memory size for the Java process to 3472 MB, and "-jar" is used to tell the Java runtime executable that it is going to be executing a jar file
java -Xms2048M -Xmx3472M -jar server.jar nogui

# Uses sed to look for the string "eula=false" in the "eula.txt" file and replaces all occurrences of it with the string "eula=true" thus accepting the end user license agreement which is neccessary to start the Minecraft server
# Options: "-i.orig" is used to tell sed to make changes directly to the file specified and to create a backup of the original file with the extension ".orig" before making changes
sed -i.orig 's/eula=false/eula=true/g' eula.txt

# Uses the Java runtime executable from openjdk-17-jdk to run the "server.jar" file without a GUI again to start the Minecraft server
# Options: "-Xms2048M" is used to set the initial heap memory size for the Java process to 2048 MB, "-Xms3472M" is used to set the maximum heap memory size for the Java process to 3472 MB, and "-jar" is used to tell the Java runtime executable that it is going to be executing a jar file
java -Xms2048M -Xmx3472M -jar server.jar nogui