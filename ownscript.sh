#!/bin/bash
#Sime new user account output

while IFS=',' read fname lname
do
	echo "--------------"
	echo "Adding $fname $lname"

#makes the change for all upper case letters to lower case
fname=${fname,,}
lname=${lname,,}

#The userid is to use up to the first 6 chars of the last name concatinated with the first 2 chars of the first name.
first=${fname:0:2}
last=${lname:0:6}

#creates a variable with userid for easier to read functionality
userID=${last}${first}

#Command to add the user with the desire userID and home folder
useradd -c "${userID}" -d /home/"${userID}" -s /bin/bash "${userID}"

#Generates a random password that will be 10 characters long ranging from numbers, letters, and special characters
randompw=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9!@#$%^&*()' | fold -w 10 | head -n 1)

#Changes the password for a user to the specified random password
usermod -p "${randompw}" ${userID}

#Stores a document that has the userID and password in a temporary location
echo "${userID},${randompw}" >> /tmp/results.txt
done < addUser.csv

#Takes the temporary file and uses the paste command to combine the two documents line by line. Making it follow the userID,randompw, then the First Name and Last Name
paste /tmp/results.txt addUser.csv > usersAdded.csv

#Removes the results file for later use
rm /tmp/results.txt