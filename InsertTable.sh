#!/bin/bash

source ./validationfuncs.sh

function InsertTable {
	typeset tableName colsNumber counter=0 insertVal=""
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

	
	colsNumber=$(head -1 ${tableName}/${tableName}-meta.txt | awk -F ':' '{print NF}')


	
	
	while [ $counter -lt $colsNumber ]
	do
	  typeset colName=$(tail -1 ${tableName}/${tableName}-meta.txt | cut -d ":" -f $((counter+1)))
	  typeset colDataType=$(head -1 ${tableName}/${tableName}-meta.txt | cut -d ":" -f $((counter+1)))

	  while true
	  do
		  read -p "enter value of ${colName} in ${colDataType}: " colValue
		  ValDataType "$colValue" "$colDataType"
		  if [ $? -eq 1 ]
		  then
			  continue
		  fi
		  

		  if [ $counter -eq 0 ]
		  then
			  if [ ! -z "$(grep ^${colValue} ${tableName}/${tableName}.txt)" ]
			  then
				  echo "primary key value exists, choose another one."
				  continue
			  fi
		  fi
		  

		  if [ $? -eq 0 ]
		  then
			  break
		  fi
	  done

	  if [ $counter -eq $((colsNumber-1)) ]
	  then
	      insertVal="${insertVal}${colValue}"
	  else
              insertVal="${insertVal}${colValue}:"

	  fi

	  let counter=$counter+1
       
    done


	  echo ${insertVal} >> "${tableName}/${tableName}.txt"

  }






