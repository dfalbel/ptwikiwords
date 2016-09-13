
<!-- README.md is generated from README.Rmd. Please edit that file -->
ptwikiwords
===========

> Words used in Portuguese Wikipedia

This data-package contains a dataset with words used in a random sample from ~15.000 pages from the [Portuguese Wikipedia](https://pt.wikipedia.org/).

Installing
==========

It can be installed using:

``` r
devtools::install_github("dfalbel/ptwikiwords")
```

Using
=====

After installing the package, you can load the dataset using:

``` r
library(ptwikiwords)
data(ptwikiwords)
head(ptwikiwords)
#>   word  count check
#> 1   de 183886  TRUE
#> 2    a  95064  TRUE
#> 3    e  86692  TRUE
#> 4    o  75879  TRUE
#> 5   em  58109  TRUE
#> 6   do  51980  TRUE
```

The dataset contains 3 columns:

-   word: word, as is, found in Wikipedia pages
-   count: number of times the word was found in the sample of Wikipedia pages
-   check: wheter the word exists in the portuguese language
