
function CreateTable{
}


function ListTables{

}

function DropTable{
}


function InsertTable{
}

function SelectRec{
}


function DeleteRec{
}

function UpdateTable{

}


#--------------DataBase Tables selection menu-------------------------------------
function ShowTablesMenu{
	

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
