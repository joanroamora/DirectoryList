#!/usr/bin/env bash
echo "Welcome to the directory information wizard." 
echo "-------------------------------------------------------" 
sleep 2
echo "Be sure that the directory to be searched exists, otherwise the script will not be able to process your request."
echo "-------------------------------------------------------"

sleep 3

read -p "Enter the route: " route
echo "Checking directory existence..."
echo "-------------------------------------------------------"

sleep 3
while [ ! -d $route ]
do
    if [ -d "$route" ]
    then
        echo "The directory ${route} exists."
        echo "-------------------------------------------------------"
        break
    else
        echo "The directory ${route} does not exists"
        echo "Please check and try again..."
        echo "-------------------------------------------------------"
    fi

    read -p "Enter the route: " route
    echo "Checking directory existence..."
    echo "-------------------------------------------------------"
done

sleep 1
echo "Perfect. The entered route exists."
sleep 3
echo "-------------------------------------------------------"

echo "Checking directory content..."
echo "-------------------------------------------------------"

if [ ! "$(ls $route)" ]
    then
        echo "The directory ${route} is empty, no files to give the information."
        echo "-------------------------------------------------------"
    else
        echo "The directory ${route} contains files, starting verification process..."
        echo "-------------------------------------------------------"
fi

echo "****"
sleep 1.5
echo "*******"
sleep 1.7
echo "**************"
sleep 1.0
echo "*************************"
sleep 0.5
echo "**************************************"
sleep 0.9
echo "*************************************************"
sleep 2
echo "***********************************************************"

read -p "Do you want a full list of the content in the requested directory? y or n" p1
if [ $p1 = "y" ]
    then
        ls -a $route
    else
        echo "."
fi

echo "-------------------------------------------------------"
sleep 2
echo "Calculating the total of files..."
echo "-------------------------------------------------------"

echo "The requested directory has : "
ls $route | wc -l
echo "files..."
echo "-------------------------------------------------------"

sleep 2
echo "Calculating the usage disk space...."
du -hs $route
echo "-------------------------------------------------------"

sleep 2
echo "Finally, information stats about your selected directory..."
stat $route
echo "-------------------------------------------------------"

