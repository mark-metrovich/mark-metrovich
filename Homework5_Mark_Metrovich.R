# Mark Metrovich 
# PSTAT 10 
# Homework 5 

#1 unif(4,10) find P(X< 8) 
  # use the punif() with x=8, min=4, max=10)
punif(8, min=4, max=10, lower.tail=TRUE, # using punif() since we want 
                                        # the probability
      log.p=FALSE)

#2 about8% males are color blind. Experiment 
  # needs 3 colorblind men, what is the Probability
  # that she finds 3 or more colorblind men in first 
  # 9? 
  # a binomial problem, 9C3 p=0.08 
  # use pbinom() 
colorblind <-pbinom(3, size=9, prob= 0.08, lower.tail=FALSE, 
       log.p=FALSE)
colorblind
  # change lower.tail to FALSE since we want 3 OR MORE 

#3 X ~ N(83, 11) 
  #3a what is P(X is between 61 and 94)
?pnorm()
p_between <- pnorm(q=94, mean=83, sd=11, lower.tail=TRUE) - 
  pnorm(q=61, mean=83, sd=11, lower.tail=TRUE)
p_between
  # subtracting P(X<61) from the P(X<= 94), to find 
  # middle area 
  
  #3b what is P(X is less than 74) 
p_less<- pnorm(q=74, mean=83, sd=11, lower.tail=TRUE)
p_less
  # pnorm returns probability of everything below value 

  #3cwhat is P(X is greater than 101)
  # use pnorm() but make lower.tail=FALSE)
p_greater<- pnorm(q=101, mean=83, sd=11, lower.tail=FALSE)
p_greater


#4 cost of sidhhuh is N($775, $150) 
  # what is P(treatment is less than $1,000)?
below<- pnorm(1000, mean=775, sd=150, lower.tail=TRUE)
below
  # plug in all values, using pnorm() since we want the probability


#5 roll a die 100 times, write code to count how many 6's 
  # use set.seed() and sample() 
set.seed(123)
probability <- c(1/6,1/6,1/6,1/6,1/6,1/6)
sixes <- length(which(sample(x=1:6, size=100, replace=TRUE, 
             prob=probability)==6))
sixes
  # make sure to run set.seed and line of code at 
  # same time, assign to  


#6. download Question7.csv from GS 
  # 6a download as R data frame 
data <- read.csv("Question7")
is.data.frame(data)
  # returns that it is a data frame 

  #6b produce a histogram of the heights 
heights <- data$height
hist(heights, main= "Heights of Students",
     xlab= "Height (CM)", ylab= "Frequency")

  #6c check "heights" for normality
  # use the qqnorm() and qq line()
qqnorm(heights) # create the qq plot 
qqline(heights) # add line to plot
  # viewing the chart, want the line to be straight as possible
  # the data does seem to be approximately normal. 


#7 using the Standard Normal Distribution find... 
  # use qnorm()
  #7a P(z<A) =0.83
a <-qnorm(0.83, mean=0, sd=1, lower.tail=TRUE)
  # gives us the prob that z<A =0.83
a
  #7b P(z>A) =0.0064
  # again use qnorm but change p to 0.0064
  # and lower.tail to FALSE 
b <-qnorm(p=0.0064, mean=0, sd=1, lower.tail=FALSE)
b


#8 men's height is ~N(69.0, 2.8) inches 
  # women's height is ~N(63.6, 2.5) inches 

  #8a what % of men must duck when walking through a 72inch 
  # high door? 
  # use pnorm() but chage lower.tail to FALSE
  # because we want percentage of men who have to duck. 
men_duck <-100* pnorm(72, mean=69.0, sd=2.8, lower.tail=FALSE)
men_duck # is the percentage of men that need to duck under 
  # a 72 inch door 

  # 8b what % of women must duck when walking through a 72 inch door 
women_duck <-  100*pnorm(72, mean=63.6, sd=2.5, lower.tail=FALSE)
women_duck # is percentage of women who have to duck under a 
  # 72 inch door 

  #8c what door height will allow at least 95% of men to walk through 
  # without ducking 
  # use the qnorm() function to find this value
  # recall syntax qnorm(p, mean, sd, lower.tail) 
  # p in this case is .95
good_door<- qnorm(0.95, mean=69.0, sd=2.8, lower.tail=TRUE)
good_door 
  # returns 73.60559, unclear if door has to be whole inch, but if 
  # door must be rounded, round up to 74 inches to allow 
  # at least 95% of men to fit. 

#9 determine if following are Binomial distributions or not 
  # check the criteria for binomial for each 
  #9a 1. trials=n=20 
    # 2. trials are independent, one randome guess does not affect another
    # 3. success= correct failure =incorrect
    # 4. P(success)= 0.25  P(failure)= 0.75 (1-0.25=0.75)
  # this is a binomial distribution since all conditions hold

  #9b this is a sampling situation, not a binomial distribution

  #9c just given the mean bird chirps in an hour, does not qualify for a 
   # binomial distribution. There are no trials and no probability

  #9d 1. trials=n=30
    # 2. trials are independent, previous flip does not affect next roll
    # 3. success= heads   failure= tails 
    # 4. P(success)= 0.5    P(failure) =0.5 (1-0.5=0.5)
  # this is a binomial distribution since all conditions hold

  #9e 1. trials=n = 50
   # 2. trials are independent, next 2 rolls do not affect previous 2 
    # 3. success = sum is prime number  failure=sum is not prime number 
    # sum can be 2:12, in those numbers, prime numbers are 2, 3, 5, 7, 11
    # so there are 11 numbers and 5 of them are prime P(prime)= 5/11= 0.4545
    # 4 P(success)= 0.4545 P(failure)= 0.5454 (1-0.4545=0.5454)
  # this is a binomial distribution since all conditions hold


#10 time for child to eat is ~ Unif(0.5, 4) minutes inclusive
  # what is the Probability that a randomly selected child will take 
  # more than 2 minutes to eat, given that the child has been eating 
  # for more than 1.5 minutes.

  # use punif() but chage min to 1.5 minutes 
  # and subtract the punif(4)- punif(2)
donut <- punif(4, min=1.5, max=4, lower.tail=TRUE) -
  punif(2, min=1.5, max=4, lower.tail=TRUE)
donut
