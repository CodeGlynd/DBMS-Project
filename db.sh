#!/bin/bash

#---Input Name validation-------------------------------------

function ValInputName {

	if [ -z "$1" ]
	then
		echo "Name field can't be empty"
		return 1

	elif [[ $1 == *" "* ]]
	then
		echo "Name shouldn't include spaces"
		return 1

	elif [[ $1 =~ [^a-zA-Z0-9_] ]]
	then
		echo "Name shouldn't have special characters"
		return 1

	elif [[ "$1" =~ ^[0-9] ]]
	then
		echo "Name shouldn't begin with a number"
		return 1
	
	fi
}


#-------------------------------Main Menu Functions----------------------------------

function CreateDB {
	mkdir DataBases
	while true 
	do
		read -p "Enter DataBase Name: " DBName
		ValInputName $DBName
		if [ $? -eq 0 ]
		then
			break
		fi
		done

	if [ -d "DataBases/$DBName" ]
	then
		echo "DataBase already exists"
	else
		mkdir DataBases/$DBName
		echo "DataBase created successfully"
	fi

}

function ListDBs {
	if [ -n "$(ls DataBases/)" ]
	then
		echo "DataBases : "
		ls DataBases/
	else 
		echo "No DataBases found"
	fi
}




function ConnectDB {
	if [ -z "$(ls DataBases/ )" ]
	then
		echo "No DataBases found to connect"
	fi

	while true
	do
		read -p "Enter DataBase name: " DBName
		ValInputName $DBName
		if [ $? -eq 0 ]
		then
			break
		fi
	done

	if [ ! -d "DataBases/$DBName" ]
	then
		echo "DataBase not found"
	else
		cd DataBases/$DBName
		"Connected to $DBName DataBase successfully"

	fi



}


function DropDB {

	if [ -z "$(ls DataBases/)" ]
	then 
		echo "No DataBases found"
	fi

	while true 
	do
		read -p "Enter DataBase name: " DBName

		ValInputName $DBName
		if [ $? -eq 0 ]
		then 
			break
		fi
	done

	if [ ! -d "DataBases/$DBName" ]
	then 
		echo "DataBase not found"
	else 
		rm -rf DataBases/$DBName
		echo "$DBName DataBase deleted successfully"
	fi

}



























