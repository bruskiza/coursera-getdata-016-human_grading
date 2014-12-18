# CodeBook for the project

## The source data

The data analyzed and it's descriptions are available here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## The analysis

Running the `run_analysis.R` file after downloading the data will result in the following:

1. The training and the test sets to will be merged into one.
1. Activity labels will be read in from `activity_labels.txt`
1. For the column names, `features.txt` will be read in and applied to the merged data set.
1. The measurements on the mean `*Mean*` and standard deviation `*Std*` on the merged data set is subsetted.
1. The results are written out to the results/mean-and-std.txt directory.

## The resulting tidy data set (results/mean-and-std.txt)

The column names in the tidy data set are similar to the column names in the features file as follows:

	Features Column Name	Tidy Column Name
	--------------------	----------------
	tBodyAcc-std()-X 		tbodyaccstdx
	tBodyAcc-std()-Y 		tbodyaccstdy
	tBodyAcc-std()-Z 		tbodyaccstdx
	...



	


