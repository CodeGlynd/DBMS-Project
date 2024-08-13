#!/bin/bash

source ./validationfuncs.sh



function EditTable {
	
	typeset tableName pk colName oldValue newValue colNum

	if [ -z "$(ls)" ]
	then
		echo "empty database, no tables to edit."
		return
	fi

	while true
	do 
		read -p "Enter table name: " tableName
		ValInputName $tableName

		if [ $? -eq 0 ]
		then
			break
		fi

	done

	if [ ! -d "$tableName" ] 
	then
		echo "Table doesn't exist."
		return
	fi

	if [ -z "$(cat "$tableName/$tableName.txt")" ]
	then
		echo "Table ${tableName} is empty."
		return
	fi

	read -p "Enter Record primary key value: " pk

	if [ -z "$(grep ^${pk} ${tableName}/${tableName}.txt)" ]
	then
		echo "Record not found, try again"
		return
	fi

	read -p "Enter column name to update value: " colName

	if [ -z "$(grep ${colName} ${tableName}/${tableName}-meta.txt)" ]
	then
		echo "column doesn't exist."
		return
	fi
	
	colNum=$(awk -F: '{ for (i = 1; i <= NF; i++) if ($i == "'"$colName"'") { print i; exit } }' "${tableName}/${tableName}-meta.txt")
	
	#additional test line
	echo "colNum: $colNum"


	oldValue=$( grep "^${pk}" "${tableName}/${tableName}.txt" | cut -d ':' -f "$colNum" ) 


	read -p "Enter new value: " newValue

	sed -i "/^$pk/s/$oldValue/$newValue/" "${tableName}/${tableName}.txt"


}






	

