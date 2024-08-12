#!/bin/bash

source ./CreateTable.sh
source ./List-Del-Table.sh
source ./InsertTable.sh
source ./SelectRecord.sh


#--------------DataBase Tables selection menu-------------------------------------
function ShowTablesMenu {
	
	

	TableOptions=("Create Table" "List Tables" "Drop Table" "Insert" "Select" "Delete" "Update" "Exit")
	select TableChoice in "${TableOptions[@]}";
	do 
		case $TableChoice in 
			"Create Table") CreateTable
				;;
			"List Tables") ListTables
				;;
			"Drop Table") DropTable
				;;
			"Insert") InsertTable
				;;
			"Select") SelectRec
				;;
			"Delete") DeleteRec
				;;
			"Update") UpdateTable
				;;
			"Exit")
				cd ../..
				break
				;;
			*)
				echo "$TableChoice option not valid"
				;;
		esac
	done




	}
