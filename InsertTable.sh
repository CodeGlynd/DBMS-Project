#!/bin/bash

source ./validationfuncs.sh

function InsertTable {
	
	#variables
	typeset tableName colsNum



	if [ -z "$(ls)" ]
	then 
		echo "empty database, no tables to insert into."
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
	

	if [ ! -d "$tableName" ]
	then 
		echo "Table doesn't exist"
		return
	fi

	colsNum=$(head -1 ${tableName}/${tableName}-meta.txt | awk -F ':' '{print NF}')







