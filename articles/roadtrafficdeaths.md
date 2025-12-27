# Getting Started

The `roadtrafficdeaths` package contains one dataset of death
certificates from road traffic crashes that happened in Brazil. This
data is provided by the Brazilian Ministry of Health, and includes all
certificated between 1996 and 2024.

## Installation

The current version of `roadtrafficdeaths` can be installed from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("pabsantos/roadtrafficdeaths")
```

Next, the libraries that will be used in this vignette are loaded. This
package loads an `data.frame` object called `rtdeaths`.

``` r
library(roadtrafficdeaths)
```

## Usage example

In this example, we will use the `rtdeaths` dataset to extract the
annual quantity of road traffic deaths in Brazil, between 1996 and 2024.

``` r
year_deaths <- table(rtdeaths$ano_ocorrencia)

plot(year_deaths, type = "l")
```

![](roadtrafficdeaths_files/figure-html/example-1.png)
