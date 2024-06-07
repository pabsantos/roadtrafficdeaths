
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

The dataset is provided in the `data.frame` format. To check each
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
#> 'data.frame':    970862 obs. of  21 variables:
#>  $ cid                : chr  "V093" "V893" "V499" "V280" ...
#>  $ cod_modal_vitima   : chr  "V0" "V8" "V4" "V2" ...
#>  $ modal_vitima       : chr  "Pedestre" "Outros" "Automóvel" "Motocicleta" ...
#>  $ cod_modal_outro    : chr  "9" "9" "9" "8" ...
#>  $ modal_outro        : chr  "Não especificado" "Não especificado" "Não especificado" "Sem colisão" ...
#>  $ data_ocorrencia    : Date, format: "2001-02-11" "2006-09-30" ...
#>  $ ano_ocorrencia     : num  2001 2006 2018 2020 2012 ...
#>  $ idade_vitima       : num  9 33 33 40 84 6 66 47 0 36 ...
#>  $ faixa_etaria_vitima: Factor w/ 17 levels "0 a 4 anos","5 a 9 anos",..: 2 7 7 9 17 2 14 10 1 8 ...
#>  $ sexo_vitima        : chr  "Masculino" "Masculino" "Feminino" "Masculino" ...
#>  $ escolaridade_vitima: chr  "de 1 a 3 anos" "de 8 a 11 anos" "de 8 a 11 anos" "de 1 a 3 anos" ...
#>  $ raca_vitima        : chr  "Parda" "Parda" "Parda" "Parda" ...
#>  $ ocup_cbo_vitima    : chr  "00600" "313305" "524305" NA ...
#>  $ cod_municipio_ocor : chr  "150618" "150230" "150420" "150270" ...
#>  $ nome_regiao_ocor   : chr  "Norte" "Norte" "Norte" "Norte" ...
#>  $ cod_municipio_res  : chr  "150618" "150230" "150420" "150270" ...
#>  $ nome_regiao_res    : chr  "Norte" "Norte" "Norte" "Norte" ...
#>  $ nome_uf_ocor       : chr  "Pará" "Pará" "Pará" "Pará" ...
#>  $ nome_municipio_ocor: chr  "Rondon do Pará" "Capitão Poço" "Marabá" "Conceição do Araguaia" ...
#>  $ nome_uf_res        : chr  "Pará" "Pará" "Pará" "Pará" ...
#>  $ nome_municipio_res : chr  "Rondon do Pará" "Capitão Poço" "Marabá" "Conceição do Araguaia" ...
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
#>   Deaths Data from Brazil_. R package version 0.3.1,
#>   https://github.com/pabsantos/roadtrafficdeaths,
#>   <https://pabsantos.github.io/roadtrafficdeaths/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {roadtrafficdeaths: Road Traffic Deaths Data from Brazil},
#>     author = {Pedro Augusto Borges Santos and João Pedro Melani Saraiva},
#>     year = {2023},
#>     note = {R package version 0.3.1, https://github.com/pabsantos/roadtrafficdeaths},
#>     url = {https://pabsantos.github.io/roadtrafficdeaths/},
#>   }
```
