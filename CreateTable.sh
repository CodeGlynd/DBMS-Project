#!/bin/bash

source ./validationfuncs.sh


function CreateTable {
	typeset tableName colsNumber colName colDataType counter=0 
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
		echo "table already exists"
		return
	fi

	mkdir $tableName
	cd $tableName

	touch "${tableName}.txt"
	touch "${tableName}-meta.txt"

	while true 
	do
		read -p "Enter number of columns: " colsNumber
		if [[ ! $colsNumber =~ ^[0-9]+$ ]]
		then
			echo "number of columns should be integar"
			exit 
		elif [[ $colsNumber -eq 0 ]]
		then
			echo "number of columns should be greater than 0"
			exit
		fi
		break
	done


	while [ $counter -lt $colsNumber ]
	do
		read -p "Enter column name: " colName
		echo "choose column data type: "


		select colDataType in "string" "integar"
		do
			case $colDataType in
				"integar" | "string" ) break ;;
				*) echo "invalid data type" ;;
			esac
		done


		let counter=counter+1
	done

		cd ../
	}
