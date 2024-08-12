#!/bin/bash
source ./validationfuncs.sh

function SelectRec {
	typeset tableName colsNum

	if [ -z $(ls) ]
	then
		echo "empty database, no tables to select from."
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
		echo "Table doesn't exist"
		return
	fi

	if [ -s "$tableName/$tablename.txt" ]
	then
		echo "Table $tableName is empty"
		return
	fi


	tail -1 ${tableName}/${tableName}-meta.txt | sed 's/:/\t/g'
	sed 's/:/\t/g' ${tableName}/${tableName}.txt && echo

}

