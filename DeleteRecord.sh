#!/bin/bash

source ./validationfuncs.sh

function DeleteRec {
	
    typeset pk tableName

	if [ -z $(ls) ]
	then
		echo "empty database, no tables to delete from."
		return
	fi

	while true
	do
		read -p "enter table name: " tableName
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

    if [ -s "$ tableName/$ tableName.txt" ]
    then
        echo "Table $tableName is empty."
        return
    fi

    

	read -p "Enter Record primary key value: " pk
	while true
	do
		if [ ! -z "$(grep ^${pk} ${tableName}/${tableName}.txt)" ]
		then
			sed -i "/^${pk}/d" "${tableName}/${tableName}.txt"
			echo "Record of primary key ${pk} deleted successfully"
			break
		else
			echo "Record doesn't exist"
			return
		fi
	done

}
