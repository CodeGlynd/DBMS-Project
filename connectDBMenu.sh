#!/bin/bash

source ./CreateTable.sh
source ./List-Del-Table.sh
source ./InsertTable.sh
source ./SelectRecord.sh
source ./DeleteRecord.sh


#--------------DataBase Tables selection menu-------------------------------------
function ShowTablesMenu {
	
	

	TableOptions=("Create Table" "List Tables" "Drop Table" "Insert" "Select" "Delete" "Edit" "Exit")
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
			"Edit") EditTable
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
