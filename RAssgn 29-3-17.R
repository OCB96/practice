library(readr)
# Warning message:
#   package 'readr' was built under R version 3.3.3 
Housing <- read_csv("D:/Housing.csv")
# Parsed with column specification:
#   cols(
#     X1 = col_integer(),
#     price = col_double(),
#     lotsize = col_integer(),
#     bedrooms = col_integer(),
#     bathrms = col_integer(),
#     stories = col_integer(),
#     driveway = col_character(),
#     recroom = col_character(),
#     fullbase = col_character(),
#     gashw = col_character(),
#     airco = col_character(),
#     garagepl = col_integer(),
#     prefarea = col_character()
#   )
# Warning message:
#   Missing column names filled in: 'X1' [1] 
View(Housing)

summary(Housing);
# X1            price           lotsize         bedrooms    
# Min.   :  1.0   Min.   : 25000   Min.   : 1650   Min.   :1.000  
# 1st Qu.:137.2   1st Qu.: 49125   1st Qu.: 3600   1st Qu.:2.000  
# Median :273.5   Median : 62000   Median : 4600   Median :3.000  
# Mean   :273.5   Mean   : 68122   Mean   : 5150   Mean   :2.965  
# 3rd Qu.:409.8   3rd Qu.: 82000   3rd Qu.: 6360   3rd Qu.:3.000  
# Max.   :546.0   Max.   :190000   Max.   :16200   Max.   :6.000  
# bathrms         stories        driveway           recroom         
# Min.   :1.000   Min.   :1.000   Length:546         Length:546        
# 1st Qu.:1.000   1st Qu.:1.000   Class :character   Class :character  
# Median :1.000   Median :2.000   Mode  :character   Mode  :character  
# Mean   :1.286   Mean   :1.808                                        
# 3rd Qu.:2.000   3rd Qu.:2.000                                        
# Max.   :4.000   Max.   :4.000                                        
# fullbase            gashw              airco          
# Length:546         Length:546         Length:546        
# Class :character   Class :character   Class :character  
# Mode  :character   Mode  :character   Mode  :character  
# 
# 
# 
# garagepl        prefarea        
# Min.   :0.0000   Length:546        
# 1st Qu.:0.0000   Class :character  
# Median :0.0000   Mode  :character  
# Mean   :0.6923                     
# 3rd Qu.:1.0000                     
# Max.   :3.0000                     

hist(Housing$price);
hist(Housing$lotsize);
hist(Housing$bedrooms);
hist(Housing$bathrms);
hist(Housing$stories);
hist(Housing$garagepl);
boxplot(price~bedrooms, data = Housing);
boxplot(price~lotsize, data = Housing);
boxplot(price~driveway, data = Housing);
boxplot(price~bathrms, data = Housing);
boxplot(price~stories, data = Housing);
boxplot(price~recroom, data = Housing);
boxplot(price~fullbase, data = Housing);
boxplot(price~gashw, data = Housing);
boxplot(price~airco, data = Housing);
boxplot(price~garagepl, data = Housing);
boxplot(price~prefarea, data = Housing);

pairs(price~lotsize+bedrooms+bathrms+stories+garagepl, data = Housing);

#> model <- lm(price~lotsize+bedrooms+bathrms+stories+garagepl, data = Housing);
# > plot(model);
# Hit <Return> to see next plot: 
#   Hit <Return> to see next plot: 
#   Hit <Return> to see next plot: 
#   Hit <Return> to see next plot: 
#   > summary(model);

# Call:
#   lm(formula = price ~ lotsize + bedrooms + bathrms + stories + 
#        garagepl, data = Housing)
# 
# Residuals:
#   Min     1Q Median     3Q    Max 
# -48487 -10463   -928   8577  80709 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -2063.6401  3521.8874  -0.586   0.5582    
# lotsize         4.7334     0.3798  12.462  < 2e-16 ***
#   bedrooms     2388.4877  1184.2320   2.017   0.0442 *  
#   bathrms     16148.0605  1695.6955   9.523  < 2e-16 ***
#   stories      7879.4411   981.4634   8.028 6.22e-15 ***
#   garagepl     5371.9533   953.5204   5.634 2.84e-08 ***
#  ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#Residual standard error: 17770 on 540 degrees of freedom
#Multiple R-squared:  0.5613,	Adjusted R-squared:  0.5573 
#F-statistic: 138.2 on 5 and 540 DF,  p-value: < 2.2e-16

#> test <- lm(price~driveway, data = Housing)
#> plot(test);
#Hit <Return> to see next plot: 
  #Hit <Return> to see next plot: 
  #Hit <Return> to see next plot: 
 # Hit <Return> to see next plot: 
#  > remove(model);
#> remove(test);


model <-lm(price~., data = Housing);
plot(model);
# Hit <Return> to see next plot: 
#   Hit <Return> to see next plot: 
#   Hit <Return> to see next plot: 
#   Hit <Return> to see next plot: 
summary(model);

# Call:
#   lm(formula = price ~ ., data = Housing)
# 
# Residuals:
#   Min     1Q Median     3Q    Max 
# -41272  -9312   -885   7346  75628 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -4447.4245  3422.1157  -1.300 0.194296    
# X1              6.9709     5.4090   1.289 0.198036    
# lotsize         3.4313     0.3613   9.498  < 2e-16 ***
#   bedrooms     1840.8782  1046.3755   1.759 0.079102 .  
# bathrms     14353.6882  1489.0661   9.639  < 2e-16 ***
#   stories      6348.4461   938.7632   6.763 3.57e-11 ***
#   drivewayyes  6224.2509  2075.3841   2.999 0.002834 ** 
#   recroomyes   4484.9187  1898.8932   2.362 0.018542 *  
#   fullbaseyes  5671.0707  1596.0875   3.553 0.000414 ***
#   gashwyes    12845.7083  3215.6268   3.995 7.39e-05 ***
#   aircoyes    12634.5979  1554.0602   8.130 3.02e-15 ***
#   garagepl     4278.5911   840.4329   5.091 4.95e-07 ***
#   prefareayes  8192.0506  1901.8780   4.307 1.97e-05 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 15410 on 533 degrees of freedom
# Multiple R-squared:  0.6741,	Adjusted R-squared:  0.6668 
# F-statistic: 91.89 on 12 and 533 DF,  p-value: < 2.2e-16

# at .05 level of significance, lotsize, bathrms, stories, drivewayyes, recroomyes, fullbaseyes, gashwyes, aircoyes, garagepl, prefareayes are all significant. bedrooms is insignificant. If the ols were modeled after that variable, then we would not have rejected the null hypothesis that "bedrooms" affect "prices".
# as per the t-test, all variables except "bedrooms" is statistically significant. refining model. #

refm <- lm(price~lotsize+bathrms+stories+driveway+recroom+fullbase+gashw+airco+garagepl+prefarea, data = Housing);
plot(refm);
# Hit <Return> to see next plot: 
#   Hit <Return> to see next plot: 
#   Hit <Return> to see next plot: 
#   Hit <Return> to see next plot: 
summary(refm)

# Call:
#   lm(formula = price ~ lotsize + bathrms + stories + driveway + 
#        recroom + fullbase + gashw + airco + garagepl + prefarea, 
#      data = Housing)
# 
# Residuals:
#   Min     1Q Median     3Q    Max 
# -41603  -9000   -962   7427  75573 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  -497.3484  2749.2067  -0.181 0.856510    
# lotsize         3.5959     0.3498  10.279  < 2e-16 ***
#   bathrms     14924.1569  1454.2442  10.262  < 2e-16 ***
#   stories      7128.7990   867.3174   8.219 1.55e-15 ***
#   drivewayyes  6259.6177  2034.4638   3.077 0.002200 ** 
#   recroomyes   4440.4102  1903.1824   2.333 0.020010 *  
#   fullbaseyes  5846.5080  1574.9946   3.712 0.000227 ***
#   gashwyes    12949.4428  3223.0822   4.018 6.72e-05 ***
#   aircoyes    12605.9217  1557.9379   8.091 3.98e-15 ***
#   garagepl     4355.3216   839.7822   5.186 3.05e-07 ***
#   prefareayes  9431.7782  1671.9235   5.641 2.74e-08 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 15450 on 535 degrees of freedom
# Multiple R-squared:  0.6712,	Adjusted R-squared:  0.6651 
# F-statistic: 109.2 on 10 and 535 DF,  p-value: < 2.2e-16

# as per the t-test, all variables here are statistically significant. The ones with 3 stars are more significant than the ones with 2 stars which are more significant than the one with 1 star.
# Additionally, the model is also statistically significant as per the p-value of 2.2e-16 in the f-test#
