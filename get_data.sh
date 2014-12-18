#!/bin/sh

CHECKSUM=d29710c9530a31f303801b6bc34bd895
SOURCE_URL=http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

[ ! -d source_data ] && mkdir source_data

cd source_data

if [ ! -f UCI\ HAR\ Dataset.zip ]; then
 	echo "Source data does not exist... attempting to download..."
 	wget $SOURCE_URL
else
	echo "Source data file exists..." 
fi

echo "Checking integrity of download..."
MYSUM=`md5 UCI\ HAR\ Dataset.zip 2>&1 | cut -d " " -f 6`

if [ $CHECKSUM == $MYSUM ]; then
	echo "Checkum validated. Extracting..."
	unzip *.zip
else
	echo "ERROR! Checksum failed... check your data. Cannot continue"
fi


