library(tidyquant)
library(plotly)
library(magrittr)

tick <- c("AMZN", "VOO", "GE", "ENB", "AAPL","IGV", "XLP","V", "BAC", "VOX",
          "VB", "VO", "BIL", "TLT", "GBF", "BWZ", "VXUS", "MORT", "VNQ",
          "ICF", "FREL", "EWJ", "8267.T", "3382.T", "9022.T","CPRX")

price_data <- tq_get(tick, from = '2013-01-01',
                     to = '2023-03-03',
                     get = 'stock.prices')


log_ret_tidy <- price_data %>%
  group_by(symbol) %>%
  tq_transmute(select = adjusted,
               mutate_fun = periodReturn,
               period = 'daily',
               col_rename = 'ret',
               type = 'log')

head(log_ret_tidy)


log_ret_xts <- log_ret_tidy %>%
  spread(symbol, value = ret) %>%
  tk_xts()

head(log_ret_xts)
tail(log_ret_xts)

mean_ret <- colMeans(log_ret_xts, na.rm = TRUE)
print(round(mean_ret, 5))


cov_mat <- cov(log_ret_xts, use= 'complete') * 252

print(round(cov_mat,4))

# first random weights
wts <- runif(n = length(tick))

wts <- wts/sum(wts)
print(wts)
sum(wts)

port_returns <- (sum(wts * mean_ret) + 1)^252 - 1
port_returns # we see an 8.67118 return


port_risk <- sqrt(t(wts) %*% (cov_mat %*% wts))
print(port_risk) # we see a 0.1381 

# Since Risk free rate is 0% 

sharpe_ratio <- port_returns/port_risk
print(sharpe_ratio) # sharpe ratio is 0.6276653


num_port <- 5000

# Creating a matrix to store the weights

all_wts <- matrix(nrow = num_port,
                  ncol = length(tick))

# Creating an empty vector to store
# Portfolio returns

port_returns <- vector('numeric', length = num_port)

# Creating an empty vector to store
# Portfolio Standard deviation

port_risk <- vector('numeric', length = num_port)

# Creating an empty vector to store
# Portfolio Sharpe Ratio

sharpe_ratio <- vector('numeric', length = num_port)


for (i in seq_along(port_returns)) {
  
  wts <- runif(length(tick))
  wts <- wts/sum(wts)
  
  # Storing weight in the matrix
  all_wts[i,] <- wts
  
  # Portfolio returns
  
  port_ret <- sum(wts * mean_ret)
  port_ret <- ((port_ret + 1)^252) - 1
  
  # Storing Portfolio Returns values
  port_returns[i] <- port_ret
  
  
  # Creating and storing portfolio risk
  port_sd <- sqrt(t(wts) %*% (cov_mat  %*% wts))
  port_risk[i] <- port_sd
  
  # Creating and storing Portfolio Sharpe Ratios
  # Assuming 0% Risk free rate
  
  sr <- port_ret/port_sd
  sharpe_ratio[i] <- sr
  
}


# Storing the values in the table
portfolio_values <- tibble(Return = port_returns,
                           Risk = port_risk,
                           SharpeRatio = sharpe_ratio)


# Converting matrix to a tibble and changing column names
all_wts <- tk_tbl(all_wts)

colnames(all_wts) <- colnames(log_ret_xts)

# Combing all the values together
portfolio_values <- tk_tbl(cbind(all_wts, portfolio_values))

head(portfolio_values)


min_var <- portfolio_values[which.min(portfolio_values$Risk),]
max_sr <- portfolio_values[which.max(portfolio_values$SharpeRatio),]
max_ret <- portfolio_values[which.max(portfolio_values$Return),]


p <- min_var %>%
  gather(tick, key = Asset,
         value = Weights) %>%
  mutate(Asset = as.factor(Asset)) %>%
  ggplot(aes(x = fct_reorder(Asset,Weights), y = Weights, fill = Asset)) +
  geom_bar(stat = 'identity') +
  theme_minimal() +
  labs(x = 'Assets', y = 'Weights', title = "Minimum Variance Portfolio Weights") +
  scale_y_continuous(labels = scales::percent) 

ggplotly(p)


p <- max_ret %>%
  gather(tick, key = Asset,
         value = Weights) %>%
  mutate(Asset = as.factor(Asset)) %>%
  ggplot(aes(x = fct_reorder(Asset,Weights), y = Weights, fill = Asset)) +
  geom_bar(stat = 'identity') +
  theme_minimal() +
  labs(x = 'Assets', y = 'Weights', title = "Maximum Returns Portfolio Weights") +
  scale_y_continuous(labels = scales::percent) 

ggplotly(p)



p <- max_sr %>%
  gather(tick, key = Asset,
         value = Weights) %>%
  mutate(Asset = as.factor(Asset)) %>%
  ggplot(aes(x = fct_reorder(Asset,Weights), y = Weights, fill = Asset)) +
  geom_bar(stat = 'identity') +
  theme_minimal() +
  labs(x = 'Assets', y = 'Weights', title = "Tangency Portfolio Weights") +
  scale_y_continuous(labels = scales::percent) 

ggplotly(p)
p <- portfolio_values %>%
  ggplot(aes(x = Risk, y = Return, color = SharpeRatio)) +
  geom_point() +
  theme_classic() +
  scale_y_continuous(labels = scales::percent) +
  scale_x_continuous(labels = scales::percent) +
  labs(x = 'Annualized Risk',
       y = 'Annualized Returns',
       title = "Portfolio Optimization & Efficient Frontier") +
  geom_point(aes(x = Risk,
                 y = Return), data = min_var, color = 'red') +
  geom_point(aes(x = Risk,
                 y = Return), data = max_sr, color = 'red')+
  geom_point(aes(x= 0.1593589,y=0.0834957),colour="green")+
  
  annotate('text', x = 0.132, y = 0.099, label = "Tangency Portfolio") +
  annotate('text', x = 0.13, y = 0.06, label = "Minimum variance portfolio")+
  annotate('text', x=0.165, y=0.085, label = "My Portfolio")
 



ggplotly(p)

print(tick)
my_wts <-c(0.015503112, 0.088251776, 0.020116198, 0.020177378, 0.015027944,
        0.026334153,0.012501407, 0.020188228, 0.022028145, 0.019914286,
        0.014764976, 0.01471634, 0.099756118, 0.100598285, 0.199795856,
        0.01869497, 0.062309562, 0.015668211, 0.049884525, 0.019817825,
        0.012700089, 0.030708426, 0.031514328, 0.031560207, 0.031032812)

my_wts <- my_wts/sum(my_wts)
print(my_wts)
sum(my_wts)

my_port_returns <- (sum(my_wts * mean_ret) + 1)^252 - 1
my_port_returns # we see an 0.0834957 annual return


my_port_risk <- sqrt(t(my_wts) %*% (cov_mat %*% my_wts))
print(my_port_risk) # we see a 0.15935 

# Since Risk free rate is 0% 

my_sharpe_ratio <- my_port_returns/my_port_risk
print(my_sharpe_ratio) # sharpe ratio is 0.5239474

my_info <- c(my_wts, my_port_returns, my_port_risk, my_sharpe_ratio)
my_labels <- c(tick, "Return", "Risk", "SharpeRatio")
my_port <- data.frame(my_labels, my_info)
