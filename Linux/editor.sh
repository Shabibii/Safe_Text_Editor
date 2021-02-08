	# Samir Habibi
	# 1819364
	# Operating Systems (Linux Bash Shell Assignment)

#!/bin/bash
path=$PWDd
# Suitable introduction.
echo -e "SAFE TEXT EDITOR"
echo -e "Welcome"

# Make use of if-statements to check if user enters a parameter and how many.
# First we check if the user enters more than one parameter, if yes, show error
# message.
if [ $# -gt 1 ]
then 
	echo "Too many parameters entered!"
	echo "This text editor can only take one parameter at a time."
	read -p "Press any key to quit.."
	exit
fi

# Check if the user enters just one file as a parameter.
if [ $# -eq 1 ]
then
	# Check if file exists.
	if [ -e $1 ] 
	then	
		# Back the file up.
		cp $1 $1.bak
		echo "File is backed up as $1.bak"
		read -p "Press any key to continue.."
		vim $1
		exit
	else
		# Create new file.
		echo "File not found."
		echo "Creating..."
		read -p "Press any key to continue.."
		vim $1
		exit
	fi

# Check if $# is equal to null. If no parameter entered, enter interactive mode.
elif [ $# -eq 0 ]
then
	# Prompt the user for a filename
	echo "Which file would you like to edit?"
	read f
	# Check if the file exists.
	if [ -e $f ]
	then
		# Back the file up.
		cp $f $f.bak
		echo "File is backed up as $f.bak"
		read -p "Press any key to continue.."
		vim $f
		exit			
	else
		# Create new file.
		echo "File not found."
		echo "Creating..."
		read -p "Press any key to continue.."
		vim $f
		exit
	fi
fi
