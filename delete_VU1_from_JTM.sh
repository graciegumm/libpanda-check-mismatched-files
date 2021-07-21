#!/bin/bash
files=`ils -r /iplant/home/sprinkjm/private-circles/JTMB6RFV5MD010181/libpanda/`
for f in $files; do
    match=$(echo $f | grep -c "2T3MWRFVXLW056972")
    if [ $match -eq 1 ]; then
        year_file=${f:0:4}
        month_file=${f:5:2}
        day_file=${f:8:2}
        directory_name=$year_file"_"$month_file"_"$day_file
        # input line to delete file. file location is listed below
        # file location: /iplant/home/sprinkjm/private-circles/JTMB6RFV5MD010181/$directory_name/$f
    fi
done
