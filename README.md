
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
#> 'data.frame':    1005743 obs. of  23 variables:
#>  $ cid                : chr  "V789" "V099" "V234" "V284" ...
#>  $ cod_modal_vitima   : chr  "V7" "V0" "V2" "V2" ...
#>  $ modal_vitima       : chr  "Ônibus" "Pedestre" "Motocicleta" "Motocicleta" ...
#>  $ cod_modal_outro    : chr  "8" "9" "3" "8" ...
#>  $ modal_outro        : chr  "Sem colisão" "Não especificado" "Automóvel" "Sem colisão" ...
#>  $ data_ocorrencia    : Date, format: "1999-02-22" "1999-03-28" ...
#>  $ ano_ocorrencia     : num  1999 1999 1999 2014 2018 ...
#>  $ idade_vitima       : num  33 58 28 25 24 30 20 23 49 24 ...
#>  $ faixa_etaria_vitima: Factor w/ 17 levels "0 a 4 anos","5 a 9 anos",..: 7 12 6 6 5 7 5 5 10 5 ...
#>  $ sexo_vitima        : chr  "Masculino" "Feminino" "Masculino" "Masculino" ...
#>  $ escolaridade_vitima: chr  NA NA NA "de 1 a 3 anos" ...
#>  $ raca_vitima        : chr  "Parda" "Preta" "Parda" "Parda" ...
#>  $ ocup_cbo_vitima    : chr  "00034" "00612" "00004" "622020" ...
#>  $ estado_civil_vitima: chr  NA NA NA "solteiro" ...
#>  $ local_ocor         : chr  "saude" "hospital" "saude" "via" ...
#>  $ cod_municipio_ocor : chr  "270630" "270030" "270750" "280240" ...
#>  $ nome_regiao_ocor   : chr  "Nordeste" "Nordeste" "Nordeste" "Nordeste" ...
#>  $ cod_municipio_res  : chr  "270760" "270260" "270030" "280240" ...
#>  $ nome_regiao_res    : chr  "Nordeste" "Nordeste" "Nordeste" "Nordeste" ...
#>  $ nome_uf_ocor       : chr  "Alagoas" "Alagoas" "Alagoas" "Sergipe" ...
#>  $ nome_municipio_ocor: chr  "Palmeira dos Índios" "Arapiraca" "Porto Real do Colégio" "Gararu" ...
#>  $ nome_uf_res        : chr  "Alagoas" "Alagoas" "Alagoas" "Sergipe" ...
#>  $ nome_municipio_res : chr  "Quebrangulo" "Feira Grande" "Arapiraca" "Gararu" ...
```

## Credits

The authors of this package would like to thank the authors of
[`microdatasus`](https://github.com/rfsaldanha/microdatasus):

> Saldanha, R. D. F., Bastos, R. R., & Barcellos, C. (2019).
> Microdatasus: pacote para download e pré-processamento de microdados
> do Departamento de Informática do SUS (DATASUS) (Version 1.0.0)
> \[Computer software\]. <https://doi.org/10.1590/0102-311X00032419>

## Citation

If you use this package, please cite as follow

``` r
citation("roadtrafficdeaths")
#> To cite package 'roadtrafficdeaths' in publications use:
#> 
#>   Santos PAB, Saraiva JPM (2023). _roadtrafficdeaths: Road Traffic
#>   Deaths Data from Brazil_. R package version 0.5.0,
#>   https://github.com/pabsantos/roadtrafficdeaths,
#>   <https://pabsantos.github.io/roadtrafficdeaths/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {roadtrafficdeaths: Road Traffic Deaths Data from Brazil},
#>     author = {Pedro Augusto Borges Santos and João Pedro Melani Saraiva},
#>     year = {2023},
#>     note = {R package version 0.5.0, https://github.com/pabsantos/roadtrafficdeaths},
#>     url = {https://pabsantos.github.io/roadtrafficdeaths/},
#>   }
```
