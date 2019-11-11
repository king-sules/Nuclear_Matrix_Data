# Nuclear_Matrix_Data
The following is my python and R codes I used for my undergraduate thesis paper. 
The basis of my paper was to capture house price variation with distance from a nearby nuclear power plant. I obtained house sales data from an assessors office and continued to clean, and later find correlations in my data. Prices were originally listed in my dataset, but distance was obtained using geopy and geopandas library. By using these libraries, I obtained distance from each individual house listed to the power plant. 

My paper essentially looked at how the Fukushima Daiichi event effected house prices. I created a new column in my dataset, a Fukushima dummy, where a value of 1 was assigned if the indivial house sold after 2011 and 0 before 2011. I also categorically grouped my distance column, in incriments of 4 miles, to control price variation in rural areas.

Lastly I used R to run  my regressions.

All of my codes are listed in this repository and I also included an original sample of data I recieved for the year 2007, which can be ran through each file. 

Thank you for taking a look at my work.
