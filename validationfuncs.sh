#!/bin/bash

#---Input Name validation-------------------------------------

function ValInputName {

	if [ -z "$1" ]
	then
		echo "Name field can't be empty"
		return 1

	elif [[ $1 == *" "* ]]
	then
		echo "Name shouldn't include spaces"
		return 1

	elif [[ $1 =~ [^a-zA-Z0-9_] ]]
	then
		echo "Name shouldn't have special characters"
		return 1

	elif [[ "$1" =~ ^[0-9] ]]
	then
		echo "Name shouldn't begin with a number"
		return 1
	
	fi
}


function ValDataType {
    
    if [ -z "$1" ]
    then
        echo " value can't be empty."
        return 1
    fi
    
    if [[ "$1" =~ ^[0-9]+$ ]]
    then
        if [ "$2" == "integer" ]
        then
            return 0
        else
            echo "The value should be a String."
            return 1
        fi
    fi
    
    if [[ "$1" =~ ^[a-zA-Z0-9_]+$ ]]
    then
        if [ "$2" == "string" ]
        then
            return 0
        else
            echo "The value should be an Integer."
            return 1
        fi
    fi
    
}