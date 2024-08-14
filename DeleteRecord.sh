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

    if [ -z "$(cat "${tableName}/${tableName}.txt")" ]
    then
        echo "Table $tableName is empty."
        return
    fi

    

	read -p "Enter Record primary key value: " pk

	typeset pkCompare=$(awk -F: '{print $1}' "${tableName}/${tableName}.txt" | grep -w ${pk})

	while true
	do
		if [ ! -z "$pkCompare" ]
		then
			sed -i '/^'"${pkCompare}"':/d' "${tableName}/${tableName}.txt"
                	echo "Record of primary key ${pk} deleted successfully"
			break
		else
			echo "Record doesn't exist"
			return
		fi
	done

}
