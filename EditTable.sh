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

	typeset pkCompare=$(awk -F: '{print $1}' "${tableName}/${tableName}.txt" | grep -w ${pk})

	if [ -z "$pkCompare" ]
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
	echo "column number: $colNum"


	
	oldValue=$(awk -F: -v pk="$pk" -v colNum="$colNum" '$1 == pk {print $colNum}' "${tableName}/${tableName}.txt")
 
	
	#additional test line case
	echo "old value: $oldValue"

	read -p "Enter new value: " newValue

	sed -i "/^${pk}:/s/${oldValue}/${newValue}/" "${tableName}/${tableName}.txt"
	echo "${colName} value of record ${pk} pk updated from ${oldValue} to ${newValue}"


}






	

