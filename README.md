
<!-- README.md is generated from README.Rmd. Please edit that file -->

# roadtrafficdeaths

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
#> Classes 'data.table' and 'data.frame':   923440 obs. of  18 variables:
#>  $ cod_modal          : chr  "V8" "V2" "V8" "V8" ...
#>  $ modal_vitima       : chr  "Outros" "Motocicleta" "Outros" "Outros" ...
#>  $ data_ocorrencia    : Date, format: "1997-01-16" "1997-10-03" ...
#>  $ ano_ocorrencia     : int  1997 1997 1998 1998 1999 2000 2000 2000 2000 2001 ...
#>  $ idade_vitima       : num  68 47 17 42 49 47 6 12 47 46 ...
#>  $ faixa_etaria_vitima: Factor w/ 17 levels "0 a 4 anos","5 a 9 anos",..: 14 10 4 9 10 10 2 3 10 10 ...
#>  $ sexo_vitima        : chr  "Masculino" "Feminino" "Masculino" "Feminino" ...
#>  $ escolaridade_vitima: chr  NA "Nenhuma" NA "Nenhuma" ...
#>  $ raca_vitima        : chr  NA NA "Branca" "Branca" ...
#>  $ ocup_cbo_vitima    : chr  NA "62100" "00700" "62100" ...
#>  $ cod_municipio_ocor : chr  "110001" "110001" "110001" "110001" ...
#>  $ nome_regiao_ocor   : chr  "Norte" "Norte" "Norte" "Norte" ...
#>  $ cod_municipio_res  : chr  "110001" "110001" "110001" "110001" ...
#>  $ nome_regiao_res    : chr  "Norte" "Norte" "Norte" "Norte" ...
#>  $ nome_uf_ocor       : chr  "Rondônia" "Rondônia" "Rondônia" "Rondônia" ...
#>  $ nome_municipio_ocor: chr  "Alta Floresta D'Oeste" "Alta Floresta D'Oeste" "Alta Floresta D'Oeste" "Alta Floresta D'Oeste" ...
#>  $ nome_uf_res        : chr  "Rondônia" "Rondônia" "Rondônia" "Rondônia" ...
#>  $ nome_municipio_res : chr  "Alta Floresta D'Oeste" "Alta Floresta D'Oeste" "Alta Floresta D'Oeste" "Alta Floresta D'Oeste" ...
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
#>   Deaths Data from Brazil_. R package version 0.1.0.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {roadtrafficdeaths: Road Traffic Deaths Data from Brazil},
#>     author = {Pedro Augusto Borges Santos and João Pedro Melani Saraiva},
#>     year = {2023},
#>     note = {R package version 0.1.0},
#>   }
```
