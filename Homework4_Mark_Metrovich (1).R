# Homework 4 part 2 
# Mark Metrovich 
# PSTAT 10 

#7 construct cdf for following data and produce 
# a barplot for each distr

#7a number of sixes sxored when 2 dice are thrown 
num_sixes <- c(0,1,2)  # create a vector with 0:2 to assing # of 6s
p <- c( 25/36, 10/36, 1/36) # assign probs for each outcome
# to a vector 
cdf_sixes <- cumsum(p) # assing the cumsum(p) to vector 
cdf_sixes

barplot(cdf_sixes, names.arg= num_sixes, 
        xlab= "Number of Sixes Rolled", 
        ylab= "Cumulative Probability", 
        space= 0.1, col= c("coral1", "pink", "red"))
# make the barplot, check that data looks correct

# 7b number of heads when three fair coins are tossed 
# similar process 
num_heads <- c(0,1,2,3)          # assign outcomes
p_heads <- c(1/8, 3/8, 3/8, 1/8) #assign probs
cdf_heads <- cumsum(p_heads)
cdf_heads

barplot( cdf_heads, names.arg= num_heads, 
         xlab= "Number of Heads Tossed", 
         ylab= "Cumulative Probability", 
         col= c("dodgerblue1","blue", "purple", "green"))

#8 simulate 20 rolls of a fair 8 sided die
num_sides <- c(1:8) # assign number of sides 
roll20 <- sample(num_sides, size=20, replace= TRUE) # recall syntax for sample
roll20

# 9 use mtcars to sample 5 mpg values 
mpg <- sample(mtcars$mpg, size=5, replace=FALSE)
mpg  # remmeber to use $ to select specific data from set

#10 randomly sample and print 6rows from mtcars data set 
mtcars[c(sample(1:nrow(mtcars), 5)), c(1:ncol(mtcars))]
# want to print the rows and cols of mtcars so use syntax mtcars[,]
# but rows want to be sampled, so do sample(rows) and then define the columns 

#11 3 red 3 blue 4 green in a bag use sample() to simulate drawing 2 balls 
# from bag no replacement 
# create a vector with the data
bag <- c("BLUE", "BLUE", "BLUE", "RED", "RED", "RED", "GREEN", "GREEN", 
         "GREEN", "GREEN")
bag_sample <- sample(bag, 2, replace=FALSE)
bag_sample
