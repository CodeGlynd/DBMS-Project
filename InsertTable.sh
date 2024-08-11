#!/bin/bash

source ./validationfuncs.sh

function InsertTable {
	
	#variables
	typeset tableName colsNum counter=0 insertVal="" 



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
	done
	
	

	if [ ! -d "$tableName" ]
	then 
		echo "Table doesn't exist"
		return
	fi

	colsNum=$(head -1 ${tableName}/${tableName}-meta.txt | awk -F ':' '{print NF}')

	while [ $counter -lt $colsNum ]
	do
	  colName=$(tail -1 ${tableName}/${tableName}-meta.txt | cut -d ":" -f $((counter+1)))
	  colDataType=$(head -1 ${tableName}/${tableName}-meta.txt | cut -d ":" -f $((counter+1)))

	  while true
	  do
		  read -p "enter value of ${colName} in ${colDataType}: " colValue
	  done

	  if [ counter -eq $((colsNum-1)) ]
	  then
	      insertVal="${insertVal}${colValue}"
	  else
              insertVal="${insertVal}${colValue}:"

	  fi
	  let counter=$counter+1
       
       done


	  echo ${insertVal} >> "${tableName}/${tableName}.txt"

  }






