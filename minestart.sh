#!/bin/bash

# Mine-Start - MineCraft personal Servant
# Z3bbster - 5-2-2011 

# MineCraft Downloadable Client
MC_CLIENT_URL="http://www.minecraft.net/download/minecraft.jar"

# MineCraft Downloadable Vanilla Server
MC_SERVER_URL="http://www.minecraft.net/download/minecraft_server.jar"

# Mine-Start Home
MS_HOME="./minestart"



function CheckCreateHomeDir {
	# bash check if directory exists
	if [ -d $MS_HOME ]; then
		echo "Mine-Start Directory exists"
	else 
		echo "Mine-Start Directory does not exists.";
		mkdir $MS_HOME;
		cd $MS_HOME;
		mkdir "client";
		mkdir "server";
		
	fi 
}

function GetClient {
		#Get Client
		cd ./minestart/client		
		wget -N $MC_CLIENT_URL
		chmod +x minecraft.jar
		cd ~
		echo "Download MineCraft Client!"
}

function GetServer {
		#Get Server
		cd ./minestart/server
		wget -N $MC_SERVER_URL
		chmod +x minecraft_server.jar
		cd ~
		echo "Download MineCraft Server!"
}

function StartClient {
	cd ./minestart/client
	java -Xmx1024M -Xms512M -cp minecraft.jar net.minecraft.LauncherFrame
}


function StartServer {
	cd ./minestart/server
	java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
}
# STARTUP
CheckCreateHomeDir
GetClient
GetServer
StartClient


