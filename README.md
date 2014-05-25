#README for Getting and Cleaning Data project

All of the code used for this project is contained in the run_analysis.R script.  The script is labeled in the comments with parts that align with these descriptions.

##Part 0
This section is completely commented out for the purposes of submission but goes through the process of downloading, time-stamping, and unzipping all the necessary files.

##Part 1
This section loads all the data files into R.  Worth noting:
* The commented lines are based on the data staying in the original folder structure; the uncommented is assuming all files are in the working directory.
* The features file has to be loaded early because it provides the column names for the X_ files (applied via col.names)

##Part 2
This takes the activity integers from the y_ frames and casts them as factors using the labels option and the activity_labels file

##Part 3
The section puts the data together in two dimensions:
* First, it combines the features (X_), activity (y_), and subject information columnwise (using cbind) to make a single test and single training data frame
* Second, it combines the test and training data rowwise (using rbind) to make a single data frame

##Part 4
This section uses regular expressions to find those features that represent a mean or standard deviation of some observation attribute.  These columns are then extracted.

##Part 5
This section uses the strength of the plyr package to summarize the data.  Per unique combination of subject and activity, the mean of each column is taken, and the result is renamed to be more tidy (human-readable).

##Part 6
This section takes the summarized data frame and exports to a comma-separated txt file.