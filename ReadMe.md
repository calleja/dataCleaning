Import the 'run_analysis.R' script into R Studio.

Ensure that you have changed the working directory to where you have saved the raw data files. Run the 'load the raw files' section... if you encounter an error you may need to manually insert the filesystem location of the files from your local into the 'read.table' functions. For your convenience I added the files onto the git repository, so you can just clone.

Question #1 is answered by running one line of code.

Every subsequent question is broken up by question number. Run the code line by line in order to get to the final answers.

Question 2 script simply detects which variable names contain the strings "mean()","std()" - those that are positive are kept in the 'index' vector.

The 'index' vector is then used to select the appropriate fields from the raw data set. Later, the train and test data sets are combined using rbind command.

For question #3 labels are retrieved from 'activity_labels.txt'. I use the merge function to merge the activity label to the activity code. I subsequently merge activity data with volunteer ID.

Question #4 - I simply read in names from fields table into the data frame of concatenated data of observations, activities and volunteer id.

Question #5 - I create a second tidy data set from the "df.full" data frame which contained all the raw data. Here, using data.table package, I iterate through all the columns and calculate mean by volunteer id and activity type.

I convert the resulting table back into a data frame in order to arrange the data by the two grouping variables using the 'arrange' function within 'plyr' package.