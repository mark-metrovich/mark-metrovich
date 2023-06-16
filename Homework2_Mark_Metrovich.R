# Homework 2 
# Mark Metrovich 
# PSTAT 10

#1 
#1a rename HairEyeColor 
HairEyeColor1 <- HairEyeColor # assign new name to existig matrix

#1b Remove HairEyeColor from GE
rm(HairEyeColor)              # use rm() to remove haireyecolor

#1c find data set with name HairEyeColor, view dataset
data("HairEyeColor") #load the data set 
print(HairEyeColor) # view in Console 

#1d Check if HairEyeColor is an array 
is.array(HairEyeColor)
# TRUE 

#1e write code to determine 
  #i total number of respondents in survey 
sum(HairEyeColor)
# returns the total respondents  # 592
  #ii total male respondents 
sum(HairEyeColor[,, "Male"])  # check the title for male matrix area 
# use the [] notation to pull element
 # returns the total male respondents #279
  #iii respondents with blue eyes 
sum(HairEyeColor[, "Blue",])
# returns sum of blue eyes # 215 
  #iv how many females with red hair 
sum(HairEyeColor["Red",,"Female"])
# returns sum of females with red hair # 37


#2 Use mtcars dataset 

#2a plot miles/(US)gallons vs rear axle ratio using 
#plot()function. which axis is mpg plotted?
data("mtcars")   # import data 
plot(mtcars$drat, mtcars$mpg, col="BLUE",
     main= "U.S Rear Axle Ratio vs. U.S Miles per Gallon",
     xlab= "Rear Axle Ratio", ylab= "Miles Per Gallon(U.S)")
# include main title and axis labels, as well as mpg on y axis and 
# rear axle ratio on x axis 
# Mpg will be on the yaxis 

#2b construct a barplot of number of forward gears 
# gear = mumber of forward gears
?barplot()                       # recall syntax 
forward.gears <- table(mtcars$gear)
print(forward.gears)               # view table 
barplot(forward.gears, col= "PURPLE",
        xlab= "Number of Forward Gears",
        ylab= "Number of Cars",
        main = "Number of Forward Gears from mtcars Dataset")
# make the table first to organize the data

#2c show numeric summary of mtcars 
summary(mtcars) # shows all summary data for each set 

#2d make a boxplot of mpg #turn scientific notation off if needed 
boxplot(mtcars$mpg, col= "ORANGE",
        border= "BLACK", 
        main= "Distribution of U.S Miles per Gallon",
        horizontal =TRUE, xlab= "Miles per Gallon")
# change to horizontal orientation for better look
# remember that the $ allows to have 
#maindataset$subdataset

#2e use a boxplot to compare mpg to number of gears 
# remember to use ~ (tilda) to separate data 
# it's y~x 

boxplot(mtcars$mpg~mtcars$gear, 
        main= toupper("comparing miles per gallon to number of gears"), 
        col= "BLUE", border= "BLACK",
        xlab= "Number of Gears", ylab= "Miles per Gallon")
# make sure result is clear, labeling helps to clarify which axis is which 


#3 creating lists 
?list
#3a create vector y
v1 <- c(77,44,33)                          # combine into v1
v2 <- c("Hamilton", "Bottas", "Verstappen") # combine into v2
y <- c(v1,v2)    # combine v1 and v2 into singular vector y
class(y)      # y is a character vector 

#3b create list z #what is different of types of z and y?
z <- list(y) # add to z
class(z)    # changes data type to a list

#3c add perez and 11 to list z z 
z <- c( z, list("Perez"), list(11))
z

#3d retrieve hamilton, bottas, verstappen from z in list of 3 
z[[1]][4:6] # choose the 1st section of list, elements 4:6


#4 
#4a create a 4x4 matric with 16:31 fill by row 
l <- matrix( 16:31, nrow=4, ncol=4,
             byrow= TRUE) # make sure byrow=true
l # double check that it works 

#4b name columns c1:c4 
colnames(l) <- c("C1", "C2", "C3", "C4") # use colnames function 
l # double check code works 

#4c name rows R1:R4
rownames(l) <- c( "R1", "R2", "R3", "R4") #use rownames function 
l # now rows and cols have names 

#4d return 3rd elements in 2nd row 
l[2,3] # recall form is matrix.name[row,column]


#5 make array of 2 3x4 matrices from vector with 1:20 by column 
c <- c(1:20) # make vector with 1:20 
G <- array(c, dim=c(3,4,2))  # recall dim is (row,col,#ofmatrices)
G
# fill by col is the default 

#5a add rownames col names and matrix names 
col.names <- c("C1", "C2", "C3", "C4") # assign column names to a vector
row.names <- c("R1", "R2", "R3")       # assign row names to a vector 
m.names <- c("M1", "M2")               # assign matrix names to a vector
G <- array( c, dim=c(3,4,2),           # combine vectors in dim names 
            dimnames= list(row.names,col.names,m.names))
# have to the row.names first in dimnames
G

#5b use apply() ti find the sum of col elements 
sum.columns <- apply(G, 2, sum) # recall it is (data, row/col, function)
sum.columns

#5c find mean of the array elements with apply() and mean()
mean.array <- apply(G,3, mean) # use 3 since want the whole mean 
mean.array # returns 2 values 

# END HW 2