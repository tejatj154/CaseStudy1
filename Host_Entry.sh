#!/bin/sh
File=/home/azuser/CaseStudy1/test.txt
if grep -q docker "$File";
        then 
		     echo "Available"
		else
			echo "[docker]" >> $File
fi
if grep -q $(az vm list-ip-addresses -g master-resources -n master-vm | grep ipAdd | cut -d '"' -f 4) "$File";
        then
                echo "Available"
        else
                az vm list-ip-addresses -g master-resources -n master-vm | grep ipAdd | cut -d '"' -f 4 >> $File
                echo "Added"
fi
