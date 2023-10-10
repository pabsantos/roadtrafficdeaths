
<!-- README.md is generated from README.Rmd. Please edit that file -->

# roadtrafficdeaths <a href="https://pabsantos.github.io/roadtrafficdeaths/"><img src="man/figures/logo.png" align="right" height="139" alt="roadtrafficdeaths website" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/pabsantos/roadtrafficdeaths/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/pabsantos/roadtrafficdeaths/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

The goal of `roadtrafficdeaths` is to provide a dataset of death
certificates from road traffic crashes that happened in Brazil, from the
Brazilian Ministry of Health.

The dataset is provided in the `data.table` format. To check each
variable, use `?rtdeaths`.

## Installation

You can install the current version of `roadtrafficdeaths` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("pabsantos/roadtrafficdeaths")
```

## Example

This is a basic example which shows how to use this package:

``` r
library(roadtrafficdeaths)

str(rtdeaths)
#> Classes 'data.table' and 'data.frame':   936969 obs. of  18 variables:
#>  $ cod_modal          : chr  "V8" "V8" "V8" "V8" ...
#>  $ modal_vitima       : chr  "Outros" "Outros" "Outros" "Outros" ...
#>  $ data_ocorrencia    : Date, format: "1996-01-27" "1996-01-11" ...
#>  $ ano_ocorrencia     : int  1996 1996 1996 1996 1996 1996 1996 1996 1996 1996 ...
#>  $ idade_vitima       : num  27 20 19 41 41 36 17 63 55 7 ...
#>  $ faixa_etaria_vitima: Factor w/ 17 levels "0 a 4 anos","5 a 9 anos",..: 6 5 4 9 9 8 4 13 12 2 ...
#>  $ sexo_vitima        : chr  "Masculino" "Masculino" "Masculino" "Masculino" ...
#>  $ escolaridade_vitima: chr  "Nenhuma" NA NA NA ...
#>  $ raca_vitima        : chr  NA NA NA NA ...
#>  $ ocup_cbo_vitima    : chr  "55100" "00200" "00600" "00200" ...
#>  $ cod_municipio_ocor : chr  "110010" "110020" "110010" "110010" ...
#>  $ nome_regiao_ocor   : chr  "Norte" "Norte" "Norte" "Norte" ...
#>  $ cod_municipio_res  : chr  "110010" "110020" "110020" "110020" ...
#>  $ nome_regiao_res    : chr  "Norte" "Norte" "Norte" "Norte" ...
#>  $ nome_uf_ocor       : chr  "Rondônia" "Rondônia" "Rondônia" "Rondônia" ...
#>  $ nome_municipio_ocor: chr  "Guajará-Mirim" "Porto Velho" "Guajará-Mirim" "Guajará-Mirim" ...
#>  $ nome_uf_res        : chr  "Rondônia" "Rondônia" "Rondônia" "Rondônia" ...
#>  $ nome_municipio_res : chr  "Guajará-Mirim" "Porto Velho" "Porto Velho" "Porto Velho" ...
#>  - attr(*, ".internal.selfref")=<externalptr>
```

## Credits

The authors of this package would like to thank the authors of
[`microdatasus`](https://github.com/rfsaldanha/microdatasus):

> Saldanha, R. D. F., Bastos, R. R., & Barcellos, C. (2019).
> Microdatasus: pacote para download e pré-processamento de microdados
> do Departamento de Informática do SUS (DATASUS) (Version 1.0.0)
> \[Computer software\]. <https://doi.org/10.1590/0102-311X00032419>

## Citation

If you use this package, please cite as follow:

``` r
citation("roadtrafficdeaths")
#> To cite package 'roadtrafficdeaths' in publications use:
#> 
#>   Santos PAB, Saraiva JPM (2023). _roadtrafficdeaths: Road Traffic
#>   Deaths Data from Brazil_.
#>   https://pabsantos.github.io/roadtrafficdeaths/,
#>   https://github.com/pabsantos/roadtrafficdeaths.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {roadtrafficdeaths: Road Traffic Deaths Data from Brazil},
#>     author = {Pedro Augusto Borges Santos and João Pedro Melani Saraiva},
#>     year = {2023},
#>     note = {https://pabsantos.github.io/roadtrafficdeaths/, https://github.com/pabsantos/roadtrafficdeaths},
#>   }
```
