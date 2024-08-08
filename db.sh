#!/bin/bash
source ./connectDBfuncs.sh
source ./validationfuncs.sh



#-------------------------------Main Menu Functions----------------------------------

function CreateDB {
	mkdir DataBases
    	
	typeset DBName

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

function ListDB {
	if [ -n "$(ls DataBases/)" ]
	then
		echo "DataBases : "
		ls DataBases/
	else 
		echo "No DataBases found"
	fi
}




function ConnectDB {

	typeset DBName

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
		echo "Connected to $DBName DataBase successfully"
		ShowTablesMenu
	fi



}


function DropDB {

	typeset DBName

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





#------------------------------Main Menu Script----------------------------------------

PS2="DBMS->"

PS3="Select from options: "

MainOptions=("Create DataBase" "List DataBases" "Connect DataBase" "Drop DataBase" "Exit")

select choice in "${MainOptions[@]}";
do
	case $choice in
		"Create DataBase") CreateDB
			;;
		"List DataBases") ListDB
			;;
		"Connect DataBase") ConnectDB
			;;

		"Drop DataBase") DropDB
			;;
		"Exit") exit
			;;
		*)
			echo "Invalid option , try again."
			;;
	esac
done
























