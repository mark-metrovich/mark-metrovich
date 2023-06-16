# Homework 6 
# Mark Metrovich 
# PSTAT 10 

#1 Write a function 
  #1a write a function that calculates (x,x^2,...,x^10) for 
  # for integer values of x 
power_function <- function(a) {
  for (i in 1:10) {  # have a for() line to have elements in 1:10
    print(a^i)       # have the inserted value of a be raised to this i 
  }
}
  #1b test the function
power_function(7)  # use 7 as a test 

#2 Write a function 
  #2a write my_function to test if 2 arguments are both numeric 
  # if they are, calculate a +b, if not 
  # print "the arguments were both not mnumeric"
my_function <- function(a,b) {
  if(is.numeric(a)==TRUE & is.numeric(b)==TRUE){
    print(a+b)
  } else 
    { print("They were both NOT numeric")}
}

  #2b test the function to see if it worked 
vector1 <- c(1,-2.4, 7.003)                # numeric
vector2 <- c("PSTAT10", "MATH4A", "ECON2") # not numeric
vector3 <- c(7,10, 0.01)                   # not numeric

  my_function(vector1, vector2)  # returns They were both NOT numeric
  my_function(vector1, vector3)  # returns a+b 

#3 ifelse function 
  # using faithful dataset, write code that returns "short"
  # for eruption times less than 3 mins and "long" if it is longer 
  # than 3 minutes 
data("faithful") # load the dataset into GE
ifelse(faithful$eruptions>= 3, print("long"), print("short"))
  # recall the syntax for ifelse(expression, yes, no)

#4 FOR loop 
  # create a vector and write a for() loop to print first 4 elements 
x <- c(16,7,4,8,3,21)
for(i in 1:4) {
  print(x[i])  # this is saying printx[element1:4]
}
  # returns the first 4 values

#5 Repeat loop
  # write a loop that breaks off after 6 loops and prints x at every i 
x <- c("PSTAT10")
i <- 1            # initlialize the vectors 
repeat {
  print(x)        # want it to print x 
  i <- i+1        # increment i so it increases each time
  if(i>=7) {      # once i >= 7 break, 7 because i =1
    break
  }
}

#6 WHILE Loop write a while loop to print square of odd# 13:17
i <- 12        # initialize vector i at 12 
while( i<= 17) {  # while i <=17
  i <- i+1        # i equals i +1 so i increases 
  if(i %%2==1) {  # using if i/2 has a remainder of 1 (is odd)
    print(i^2)    # print i ^2
  }
}
  
#7 Nested Loops 
  # make a matrix with 3 rows and 2 cols, filled by col, with 1:6,
  # write nested for loop to return elements 1 and 5 only 
m <- matrix(1:6, nrow=3, ncol=2, byrow=FALSE) # recall syntax for matrix
m                                              # double check
for(i in 1:3) {    # rows are 1:3
  for(j in 1:2) {  # colums are 1:2
    if(m[i,j] ==1 | m[i,j]==5) {
      # saying if m[i,j] == 1 or ==5, print the element 
      # so if for ex the elements in m[i=2,3] == 5, it would print etc
      print(m[i,j])
    }
  }
}

#8 writing functions 
x <- c(2,5,3,9,8,11,6)
  #8a modify code from lecture to find how many ODD numbers are in x 
odds <- 0   # initialize count of odds 
for( i in x) {
  if(i%%2 ==1) {  # %%2 ==1 means if i/2 has remainder of 1 (is odd)
    odds<- odds +1 # add 1 to odds to show number of odds increasing 
  }
}
print(odds)       # returns the number of odds in x 

  #8b combine code from lecture and above to find how many evens and odds 
  # are in x 
x <- c(2,5,3,9,8,11,6)
odds2 <- 0 
evens<- 0
for(i in x) {      # same as previous
  if(i%%2==1) {
    odds2 <- odds2+1
  }
  if (i%%2==0) {    # now if i/2 has remainder of 0, i is even
    evens <- evens+1 # add count to the evens 
  }
}

    # 8c using 2 separate print() show results 
print(odds2)  # prints numbers of odds(4)
print(evens) # prints numbers of evens(3)

