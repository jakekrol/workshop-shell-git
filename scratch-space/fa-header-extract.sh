#!/bin/bash
FA_FILE=$1

main() {
	grep "^>" $FA_FILE
} 2> log-file.txt

main 
