#!/bin/bash
 
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
		mkdir "backups";
		cd "backups";
		mkdir "worlds";
		mkdir "texturepacks";	
		
		
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

function BackupWorlds {
	
	OF=worlds_backup_$(date +%H.%M_%d.%m.%Y).tar.gz
 	tar -czvf $OF .minecraft/saves
	cp $OF minestart/backups/worlds
	echo "Worlds BACKUPPED!"
	
}


CheckCreateHomeDir


# Declare variable choice and assign value 4
choice=4
# Print to stdout
 echo "MineStart - Miners Personal Bulter"
 echo "-----------------------------------"
 echo "1. Download MineCraft Client"
 echo "2. Download MineCraft Server"
 echo "3. Backup My Worlds"
 echo -n "Please choose a word [1,2 or 3]? "
# Loop while the variable choice is equal 4
# bash while loop
while [ $choice -eq 4 ]; do
 
# read user input
read choice
# bash nested if/else
if [ $choice -eq 1 ] ; then
 
        echo "Please wait MineCraft Client will be downloaded..."
	GetClient

else                   

        if [ $choice -eq 2 ] ; then
                 echo "Please wait MineCraft Server will be downloaded..."
		GetServer
        else	
         
                if [ $choice -eq 3 ] ; then
                        echo "You Worlds will be backupped now!"
			BackupWorlds
                else
                        echo "Please make a choice between 1-3 !"
                        echo "1. Download MineCraft Client"
 			echo "2. Download MineCraft Server"
                        echo "3. Backup My Worlds"
                        echo -n "Please choose a word [1,2 or 3]? "
                        choice=4
                fi   
        fi
fi
done 
