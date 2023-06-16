# Mark Metrovich 
#Homework 1 PSTAT 10 

#1. create vector x with 5 7 3 10 1 
x <- c(5,7,3,10,1) #use c() to combine 

#1a extract 3rd element
x[3]  #use form object[element] to extract 

#1b extract all elements except 2nd element 
x[-2]  #recall adding - in front of element will 
#extract all elements except that one 

#1c  extract 2nd 3rd 5th elements 
x[c(2,3,5)] # can use c() inside of [] to extract only 
#2nd 3rd and 5th elements 

#1d add 17 as 4th element 
# must assign 17 as the 4th element of x 
x[4] <- 17    #use assingment operator for this 
x[4]          # works 
# did not do this in lecture 
#now x is 5 7 3 17 1 

#1e replace 1st and 3rd elements with the number 4 
#use [] and c() 
x[c(1,3)] <- 4  # this says replace the 1st and 3rd 
#elements of x with 4 using c()
x  # is now 4 7 4 17 1 


#2 
#2a create vector with elements 
# i am using the variable y for new vector
y <- c(1,2,3,7,6,8,3,12,0,17) #given elements 
y                             #see it in global environment 

#2b find length of y
length(y)  #remember to use length(object) 
# length is 10 

#2c sort y in descending order
sort(y, decreasing= TRUE) # recall the sort function 
# have to mention decreasing is true since 
#increasing is the default! it works 

#2d find mean of y 
mean(y)   # mean function is already built in 
# mean is 5.9 


#3 write code that prints PSTAT 10 HW 1 Question 5
# without the ""
print(" PSTAT 10 HW 1 Question 5", quote=FALSE)
# make sure to add quote = false to rid the "" 
# make sure to add , after "" to end string 


#4 use seq() to construct 
# 2.25 2.50 2.75 3.0 
seq(from= 2, to= 3, by= 0.25)  # seq(from=, to=, by=)
# see pattern and make sure it runs correctly 

#5 use rep() to create vector 
# 1 1 1 2 2 2 3 3 3 4 
rep(1:4, each= 3, length=10) # recall rep() form 
# remember that you can manipulate the length of the 
#vector to make it seem there is only 1 repetition
# of 4.

#6 use readline()

#6a look up readline() in help 
help(readline)       # see help in bottom right 
# form is readline(prompt= " ") 
#end "" with a space 

 #6b write code that asks user for name 
z<- readline(prompt = "What is your name? ") # assign this function to vector z 
# will ask your name in the console, enter answer 

#6c write code to print user's name 
print(paste("User's name is", z)) # this has your answer attached to it
# so when you print the string, it will show "Users name is Mark" in console

#6d test with 3 different names 
# run both lines of code 3 times, using different vectors  
a <- readline( prompt= "What is your name? ")  # remember to add space 
print(paste("User's name is", a))  # using "User's name is" because that is the 
#response desired 

b <- readline (prompt= "What is your name? ") #remember to type name in console 
# then hit enter 
print(paste("User's name is", b))  # used Barry for name 2 

c<- readline(prompt= "What is your name? ")  # using Theo for name 3 
print(paste( "User's name is", c)) #will show in console 
# all worked