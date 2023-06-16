# Mark Metrovich 
# Homework 3 
# PSTAT10 

#1 Arrays in practice 

#1a create an array of 2 2x2 matrices 
#to represent data 

# first create vectors of age groups 
data.young <- c( 8,98,5,115)  
# data of people <55
data.old <- c( 22,76, 16,69)  
# data of people >=55
# then create the array with data
chart <- array(c(data.young, data.old), 
               dim= c(2,2,2))  
print(chart)       # view to make sure it matches 

#1b add the dimnames to the array 
#i outcome (for rows)
#ii treatment (for columns)
#iii age group (for each matrix) 
# assign names to 3 vectors
# then list in dimnames=list()
row.names <- c("Deaths" , "Survivors")
col.names <- c("TOLB", "Placebo")
m.names <- c( "Age < 55", "Age >= 55")
chart <- array( c(data.young, data.old), 
                dim= c(2,2,2), 
                dimnames= list(row.names, 
                               col.names, m.names))
print(chart)

#1c calculate 
#i total number of deaths and total survivors 
sum(chart[1,1:2,1:2]) # using positions and [:]
# two ways to do that, using either 
#element specific or using positions

#ii total number given TOLB and total given placebo 
sum( chart[1:2,1,1:2])  # using positions 
#iii print row 2 column 2 of matrix 2 
print(chart[2,2,2])
# prints 69

#1d create a matrix of the combined data 
combined<- matrix(c(30,174,204,21,184,205), 
                  nrow= 3, ncol= 2, byrow= FALSE)
# create the matrix then assign the row and col names 
# using colnames() and rownnames() 
colnames(combined) <- c("TOLB", "Placebo")
rownames(combined) <- c("Deaths", "Survivors", "Total")
combined   # double check all is correct 


#2 data frames in practice 
# use the VADeaths dataset 
data("VADeaths") # load the data into GE 
print(VADeaths)  # view data in console 

#2a is VADeaths a data frame? if not, coerce it 
is.data.frame(VADeaths)
class(VADeaths)       
# states it is a matrix array
# it is not a data frame 

# coerce it into data frame 
vadeaths2 <- as.data.frame(VADeaths) # assign it to a new 
# variable using as.data.frame()
is.data.frame(vadeaths2)
# it is now a data frame 

#2b create new vriable showing sum of each row 
rsums <- rowSums(vadeaths2) # use the rowSums() 
# so that it will show the sums of rows 
rsums
# shows sums of rows with labels 

#2c create a suitable chart for the data 
rsums # view data 
barplot(rsums, 
        main= toupper("Virginia deaths by age groups in 1940"), 
        xlab= "Age Groups", ylab= "Total Number of Deaths", 
        col= c("coral1", "pink", "red", "dodgerblue1", "blue"))
# create a bar plot with rsums data, 
#customize it so it is presentable. 


#3 working with data frames 
# use state.x77 from state package 
data("state")
rm(state.abb, state.area, state.division, 
   state.name,state.region)
# remove ones we don't want right now 

#3a what kind of R object is state.x77 
class(state.x77)
# states it is a matrix array

#3b create a data frame df1 using state.x77 
df1 <- as.data.frame(state.x77) 
# use the as.data.frame() to coerce data into 
# a dataframe 

#3c using df1 find how many states have an income 
#less than 4300
sum(df1$Income< 4300)
 # there are 20 states with income<$4300


#4 
#4a create a factor z with elements 
z <- factor(c("AGREE", "AGREE", "STRONGLY AGREE", 
              "DISAGREE", "AGREE"))
# use the factor() function to assign values to z 
class(z)
# double check z is a factor 

#4b determine number of levels in z 
nlevels(z)
# use nlevels() to determine number of levels in z 

#4c determine the levels of z 
levels(z)
# use levels() # returns "agree", "disagree", 
# and "strongly agree"


#5 create a data frame from raw data 
#5a create following data frame using data.frame()
M <- data.frame(Subject= c("English", "Math", 
                           "Chemistry", "Physics"),
                Percentage= c(80, 100,85, 95))
M
# can assign the col names as name= c("values")

#5b rename columns as COurse and Score 
colnames(M) <- c("Course", "Score") 
# use colnames() <- ...
M  # double check it works 

#5c extract the course column 
M[,2]
# recall if you want an entire column to use 
# M[,n]


#6 create a data frame from an existing data frame 
# using swiss dataset create a new frame only with 
# rows 1 2 3 10 11 12 13 and only the variables 
# Examination, Education, Infant.Mortality 

data("swiss")
print(swiss)   # view data to see 
swiss2 <- as.data.frame(swiss[c(1,2,3,10,11,12,13), 
                c("Examination", "Education", 
                  "Infant.Mortality")])
# create a new data frame and extract the rows 
#and columns you want 
swiss2 # show to double check 

# End HW 3 