data(cars);

data.frame(cars);

View(cars)
colnames(cars)[1]<-"velocity"
View(cars)
cars[c("acceleration")]<-6
View(cars)
colnames(cars)[3]<-"time"
cars[c("acceleration")]<-cars[2]/(cars[3]*cars[3])

  