#!/bin/bash
files=`ls -R /var/panda/CyverseData/JmscslgroupData/PandaData/`
for f in $files; do
	match=$(echo $f | grep -c $(cat /etc/libpanda.d/vin) )
	if [ $match -eq 1 ]; then
		echo "The file $f matches"
	fi
	if [ $match -ne 1 ]; then
		match2=$(echo $f | grep -c "csv")
		if [ $match2 -eq 1 ]; then
			echo $f
			echo "The file $f doesn't match"
			year_file=${f:0:4}
			month_string=${f:5:2}
			day_string=${f:8:2}
			date_directory=$year_file"_"$month_string"_"$day_string
			echo $date_directory
			mkdir -p /home/circles/mismatched_files
			mv /var/panda/CyverseData/JmscslgroupData/PandaData/$date_directory/$f /home/circles/mismatched_files
			echo "The file $f has been moved to mismatched_files"
		fi
	fi
done
