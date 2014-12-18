# Getting and Cleaning Data: Course Project


## Introduction
This repository is my project for the Getting and Cleaning Data assignment from Coursera.

## Setting up the environment

I have included my R studio project file as well as a get_data.sh script.

This ensures that the source data and its location remains consistent.

### Obtaining the data

Once the repository is cloned, run the following file to download the data:

	get_data.sh

This will:
* create the source_data directory
* download the file
* verify the file's md5sum 
* extract the data

###  File Integrity

The RSA Data Security Inc. MD5 Message Digest algorithm of the source data zip file to use is this:

	d29710c9530a31f303801b6bc34bd895

This ensures we are all referring to the same source data.

## The R script

From here, you can execute the run_analysis.R file against the data.

## The Code Book

The Code Book for this project is also included to provide detailed workings of the analysis and description of the data being analyzed.

