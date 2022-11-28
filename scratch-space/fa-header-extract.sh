#!/bin/bash
FA_FILE=$1

main() {
	find ./FAKEDIR/ -type f -name "$FA_FILE"
	grep "^>" $FA_FILE
} 2> log-file.txt

main 
