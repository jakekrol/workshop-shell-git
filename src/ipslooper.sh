#!/bin/bash

# ============
# ipslooper.sh
# 	For a given directory of fasta files, each fasta will be run through InterProScan's RESTful API
# ============
# Usage
# 	1) Place individual fasta files in a directory under the script location named as "seqs" (e.g. dir_with_script/seqs)
# 	2) Run the file
# ===========

# k counts every iteration
k=1
# i is a sleep counter that resets to 0 when it reaches 30
i=1

# mkdir -p ./ips_out

for FILE in ~/Lab/plant-virus/data/seqs/*; do
	# NAME is the file name
	NAME=$(basename "$FILE")
	echo "Iteration "$k".Scanning "$NAME" for domains . . ."
	# remove ".fa" for output files
	FNAME=${NAME:0:-3}
	# Run iprscan 1 file at a time. Name the output 
	python3 iprscan5_urllib3.py --email kroljac1@msu.edu --sequence ../data/single-protein-fastas/$NAME \
		--outfile=../data/ips_out/$FNAME \
		--outformat=json
	echo "$NAME processed."
	i=$((i+1))
	if [ $i -eq 30 ]
	then
		# print text that explains the process will sleep for 30secs
		
		echo "i = "$i". Sleeping for 30 seconds."
		# sleep process #sd 
		sleep 30
		echo "Sleep Finished."
		# reset sleep counter
		i=$((0))
	fi 	
	k=$((k+1))
	echo $FILE;
done
