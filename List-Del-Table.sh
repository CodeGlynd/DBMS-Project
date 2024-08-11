#!/bin/bash

source ./validationfuncs.sh

function ListTables {

if [ -z "$(ls)" ]
then
	echo "empty database, no tables to show."
else
	ls
fi

}



function DropTable {

	typeset tableName

	if [ -z "$(ls)" ]
	then
		echo "empty database, no tables to drop."
	else
		while true
		do 
			read -p "Enter table name: " tableName
			ValInputName $tableName
			if [ $? -eq 0 ]
			then
				break
			fi
		done

		if [ -d "$tableName" ]
		then
			rm -rf "$tableName"
			echo "Table ${tableName} deleted successfully."
		else
			echo "Table ${tableName} doesn't exist."
			return
		fi
	fi
}



