    library(knitr)
    library(dplyr) 
    # mtcars is a built-in data set
    lmfit1 <- lm(mpg ~ wt, mtcars)
    lmfit1

    ## 
    ## Call:
    ## lm(formula = mpg ~ wt, data = mtcars)
    ## 
    ## Coefficients:
    ## (Intercept)           wt  
    ##      37.285       -5.344

    summary(lmfit1)

    ## 
    ## Call:
    ## lm(formula = mpg ~ wt, data = mtcars)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -4.5432 -2.3647 -0.1252  1.4096  6.8727 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  37.2851     1.8776  19.858  < 2e-16 ***
    ## wt           -5.3445     0.5591  -9.559 1.29e-10 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 3.046 on 30 degrees of freedom
    ## Multiple R-squared:  0.7528, Adjusted R-squared:  0.7446 
    ## F-statistic: 91.38 on 1 and 30 DF,  p-value: 1.294e-10

    # 'tidy' and 'glance' are functions of the 'broom' package, which you will need to install if you don't have it.
    # install.packages("broom")
    library(broom)
    # tidy makes a dataframe of coefficients.
    tidy(lmfit1) %>% kable(digits=2)

<table>
<thead>
<tr class="header">
<th align="left">term</th>
<th align="right">estimate</th>
<th align="right">std.error</th>
<th align="right">statistic</th>
<th align="right">p.value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">(Intercept)</td>
<td align="right">37.29</td>
<td align="right">1.88</td>
<td align="right">19.86</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">wt</td>
<td align="right">-5.34</td>
<td align="right">0.56</td>
<td align="right">-9.56</td>
<td align="right">0</td>
</tr>
</tbody>
</table>

    # glance makes a one-row dataframe with statistics for the overall model (r-squared, aic, bic, etc.)
    glance(lmfit1) %>% kable(digits=2)

<table>
<thead>
<tr class="header">
<th align="right">r.squared</th>
<th align="right">adj.r.squared</th>
<th align="right">sigma</th>
<th align="right">statistic</th>
<th align="right">p.value</th>
<th align="right">df</th>
<th align="right">logLik</th>
<th align="right">AIC</th>
<th align="right">BIC</th>
<th align="right">deviance</th>
<th align="right">df.residual</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">0.75</td>
<td align="right">0.74</td>
<td align="right">3.05</td>
<td align="right">91.38</td>
<td align="right">0</td>
<td align="right">2</td>
<td align="right">-80.01</td>
<td align="right">166.03</td>
<td align="right">170.43</td>
<td align="right">278.32</td>
<td align="right">30</td>
</tr>
</tbody>
</table>

    # update is a base R function that lets you update regression models (add predictors).
    # You can see that I am adding a predictor, "cyl," and creating a new regression model with it, "lmfit2."
    # 'lmfit3' just adds the interaction effect. 
    lmfit2 <- update(lmfit1,~.+ cyl)
    lmfit3 <- update(lmfit2,~.+ wt:cyl)

    # rbind is base R for "bind these dataframes together vertically." 'cbind' connects dataframes together horizontally.
    rbind(glance(lmfit1),
          glance(lmfit2),
          glance(lmfit3)) %>% kable(digits=2)

<table>
<thead>
<tr class="header">
<th align="right">r.squared</th>
<th align="right">adj.r.squared</th>
<th align="right">sigma</th>
<th align="right">statistic</th>
<th align="right">p.value</th>
<th align="right">df</th>
<th align="right">logLik</th>
<th align="right">AIC</th>
<th align="right">BIC</th>
<th align="right">deviance</th>
<th align="right">df.residual</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">0.75</td>
<td align="right">0.74</td>
<td align="right">3.05</td>
<td align="right">91.38</td>
<td align="right">0</td>
<td align="right">2</td>
<td align="right">-80.01</td>
<td align="right">166.03</td>
<td align="right">170.43</td>
<td align="right">278.32</td>
<td align="right">30</td>
</tr>
<tr class="even">
<td align="right">0.83</td>
<td align="right">0.82</td>
<td align="right">2.57</td>
<td align="right">70.91</td>
<td align="right">0</td>
<td align="right">3</td>
<td align="right">-74.01</td>
<td align="right">156.01</td>
<td align="right">161.87</td>
<td align="right">191.17</td>
<td align="right">29</td>
</tr>
<tr class="odd">
<td align="right">0.86</td>
<td align="right">0.85</td>
<td align="right">2.37</td>
<td align="right">57.62</td>
<td align="right">0</td>
<td align="right">4</td>
<td align="right">-70.85</td>
<td align="right">151.70</td>
<td align="right">159.03</td>
<td align="right">156.98</td>
<td align="right">28</td>
</tr>
</tbody>
</table>
