setwd('D:/IiAD sem_4/Statystyka')
getwd()
cars <- read.csv('Car_sales.csv', header = T, sep = ',')

cars <- na.omit(cars)
colnames(cars)[3] <- "Sales"
colnames(cars)[6] <- "Price"
cars$Sales <- cars$Sales*1000
cars$Price <- cars$Price*1000

#srednia wzgledem marki
vprices <- c()
vcounter <- c()
price <- cars$Price[1]
counter <- 0



for (i in 2:length(cars$Price))
  if (cars$Manufacturer[i-1]==cars$Manufacturer[i]){
    price <- price + cars$Price[i]
    counter <- counter + 1
    if(i==length(cars$Price)){
      price <- price + cars$Price[i]
      counter <- counter + 1
      vprices <- append(vprices, price)
      vcounter <- append(vcounter, counter)
    }
  }else{
      price <- price + cars$Price[i]
      counter <- counter + 1
      vprices <- append(vprices, price)
      vcounter <- append(vcounter, counter)
      counter <- 0
      price <- 0
    }


