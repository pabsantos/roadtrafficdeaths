## code to prepare `rtdeaths` dataset goes here

library(microdatasus)
library(tidyverse)
library(readODS)
library(data.table)

## data import

datasus_doext <- fetch_datasus(
  year_start = 1996,
  year_end = 2022,
  information_system = "SIM-DOEXT",
  vars = c(
    "CAUSABAS", "CODMUNOCOR", "DTOBITO", "IDADE", "SEXO", "RACACOR", "ESC",
    "OCUP", "CODMUNRES"
  )
)

city_list <- read_ods("data-raw/ibge_lista_municipios.ods", skip = 6)

datasus_doext <- as.data.table(datasus_doext)

city_list <- city_list %>%
  janitor::clean_names() %>%
  as.data.table()

## deaths arrangement

datasus_road <- datasus_doext[, cod_modal := str_sub(CAUSABAS, 1, 2)] %>%
  .[cod_modal %in% paste0("V", seq(0, 8, 1))] %>%
  .[, modal_vitima := case_match(
    cod_modal,
    "V0" ~ "Pedestre",
    "V1" ~ "Bicicleta",
    "V2" ~ "Motocicleta",
    "V3" ~ "Triciclo",
    c("V4", "V5") ~ "Automóvel",
    "V6" ~ "Caminhão",
    "V7" ~ "Ônibus",
    "V8" ~ "Outros"
    )] %>%
  .[, data_ocorrencia := dmy(DTOBITO)] %>%
  .[, ano_ocorrencia := year(data_ocorrencia)] %>%
  .[, idade_vitima := case_when(
    str_sub(IDADE, 1, 1) == "4" ~ as.numeric(str_sub(IDADE, 2, 3)),
    str_sub(IDADE, 1, 1) %in% c("0", "1", "2", "3") ~ 0,
    str_sub(IDADE, 1, 1) == "5" ~ as.numeric(paste0("1", str_sub(IDADE, 2, 3))),
    TRUE ~ NA
  )] %>%
  .[, faixa_etaria_vitima := cut(
    idade_vitima,
    breaks = c(
      0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 100
    ),
    labels = c(
      "0 a 4 anos", "5 a 9 anos", "10 a 14 anos", "15 a 19 anos",
      "20 a 24 anos", "25 a 29 anos", "30 a 34 anos",
      "35 a 39 anos", "40 a 44 anos", "45 a 49 anos",
      "50 a 54 anos", "55 a 59 anos", "60 a 64 anos",
      "65 a 69 anos", "70 a 74 anos", "75 a 79 anos",
      "Mais de 80 anos"
    ),
    include.lowest = TRUE,
    right = FALSE
  )] %>%
  .[, sexo_vitima := case_match(
    SEXO,
    "1" ~ "Masculino",
    "2" ~ "Feminino"
  )] %>%
  .[, raca_vitima := case_match(
    RACACOR,
    "1" ~ "Branca",
    "2" ~ "Preta",
    "3" ~ "Amarela",
    "4" ~ "Parda",
    "5" ~ "Indígena"
  )] %>%
  .[, escolaridade_vitima := case_match(
    ESC,
    "1" ~ "Nenhuma",
    "2" ~ "de 1 a 3 anos",
    "3" ~ "de 4 a 7 anos",
    "4" ~ "de 8 a 11 anos",
    "5" ~ "12 anos ou mais"
  )] %>%
  .[, cod_municipio_ocor := str_sub(as.character(CODMUNOCOR), 1, 6)] %>%
  .[, nome_regiao_ocor := case_match(
    str_sub(cod_municipio_ocor, 1, 1),
    "1" ~ "Norte",
    "2" ~ "Nordeste",
    "3" ~ "Sudeste",
    "4" ~ "Sul",
    "5" ~ "Centro-Oeste"
  )] %>%
  .[, cod_municipio_res := str_sub(as.character(CODMUNRES), 1, 6)] %>%
  .[, nome_regiao_res := case_match(
    str_sub(cod_municipio_res, 1, 1),
    "1" ~ "Norte",
    "2" ~ "Nordeste",
    "3" ~ "Sudeste",
    "4" ~ "Sul",
    "5" ~ "Centro-Oeste"
  )] %>%
  .[, ocup_cbo_vitima := as.character(OCUP)] %>%
  .[, .(
    cod_modal, modal_vitima, data_ocorrencia, ano_ocorrencia, idade_vitima,
    faixa_etaria_vitima, sexo_vitima, escolaridade_vitima, raca_vitima,
    ocup_cbo_vitima, cod_municipio_ocor, nome_regiao_ocor, cod_municipio_res,
    nome_regiao_res
  )]

city_list <- city_list[
  ,
  cod_municipio := str_sub(as.character(codigo_municipio_completo), 1, 6)
] %>%
  .[, .(cod_municipio, nome_uf, nome_municipio)]

## Join datasets

datasus_road[city_list, on = .(cod_municipio_ocor = cod_municipio), roll = TRUE]

rtdeaths <- datasus_road |>
  left_join(city_list, by = c("cod_municipio_ocor" = "cod_municipio")) |>
  rename(nome_municipio_ocor = nome_municipio, nome_uf_ocor = nome_uf) |>
  left_join(city_list, by = c("cod_municipio_res" = "cod_municipio")) |>
  rename(nome_municipio_res = nome_municipio, nome_uf_res = nome_uf)

usethis::use_data(rtdeaths, overwrite = TRUE)
