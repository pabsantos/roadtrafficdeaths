## code to prepare `rtdeaths` dataset goes here

library(microdatasus)
library(readODS)

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

city_list <- janitor::clean_names(city_list)

## Reference tables

modal_vitima_df <- data.frame(
  cod_modal = c("V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8"),
  modal_vitima = c(
    "Pedestre", "Bicicleta", "Motocicleta", "Triciclo",
    "Automóvel", "Automóvel", "Caminhão", "Ônibus", "Outros"
  )
)

modal_outro_df <- data.frame(
  cod_modal_outro = as.character(seq(0, 9, 1)),
  modal_outro = c(
    "Pedestre ou animal", "Bicicleta", "Motocicleta ou triciclo",
    "Automóvel", "Caminhão ou ônibus", "Trem", "Outro veículo não-motorizado",
    "Objeto fixo ou parado", "Sem colisão", "Não especificado"
  )
)

raca_vitima_df <- data.frame(
  cod_raca = as.character(seq(1, 5, 1)),
  raca_vitima = c("Branca", "Preta", "Amarela", "Parda", "Indígena")
)

escolaridade_vitima_df <- data.frame(
  cod_esc = as.character(seq(1, 5, 1)),
  escolaridade_vitima = c(
    "Nenhuma", "de 1 a 3 anos", "de 4 a 7 anos",
    "de 8 a 11 anos", "12 anos ou mais"
  )
)

regiao_df <- data.frame(
  cod_regiao = as.character(seq(1, 5, 1)),
  regiao = c("Norte", "Nordeste", "Sudeste", "Sul", "Centro-Oeste")
)

## Main table
datasus_doext$cod_modal_vitima <- substr(datasus_doext$CAUSABAS, 1, 2)
datasus_road <- subset(
  datasus_doext,
  cod_modal_vitima %in% modal_vitima_df$cod_modal
)

datasus_road$cid <- datasus_road$CAUSABAS

datasus_road$cod_modal_outro <- substr(datasus_road$CAUSABAS, 3, 3)

datasus_road <- merge(
  x = datasus_road,
  y = modal_vitima_df,
  by.x = "cod_modal_vitima",
  by.y = "cod_modal",
  all.x = TRUE
)

datasus_road <- merge(
  x = datasus_road,
  y = modal_outro_df,
  by = "cod_modal_outro",
  all.x = TRUE
)

datasus_road$data_ocorrencia <- lubridate::dmy(datasus_road$DTOBITO)
datasus_road$ano_ocorrencia <- lubridate::year(datasus_road$data_ocorrencia)

datasus_road$idade_vitima <- ifelse(
  substr(datasus_road$IDADE, 1, 1) == "4",
  as.numeric(substr(datasus_road$IDADE, 2, 3)),
  ifelse(
    substr(datasus_road$IDADE, 1, 1) %in% c("0", "1", "2", "3"),
    0,
    ifelse(
      substr(datasus_road$IDADE, 1, 1) == "5",
      as.numeric(paste0("1", substr(datasus_road$IDADE, 2, 3))),
      NA
    )
  )
)

datasus_road$faixa_etaria_vitima <- cut(
  datasus_road$idade_vitima,
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
)

datasus_road$sexo_vitima <- ifelse(
  datasus_road$SEXO == "1",
  "Masculino",
  ifelse(
    datasus_road$SEXO == "2",
    "Feminino",
    NA
  )
)

datasus_road <- merge(
  x = datasus_road,
  y = raca_vitima_df,
  by.x = "RACACOR",
  by.y = "cod_raca",
  all.x = TRUE
)

datasus_road <- merge(
  x = datasus_road,
  y = escolaridade_vitima_df,
  by.x = "ESC",
  by.y = "cod_esc",
  all.x = TRUE
)

datasus_road$cod_municipio_ocor <- substr(
  as.character(datasus_road$CODMUNOCOR), 1, 6
)

datasus_road$cod_municipio_res <- substr(
  as.character(datasus_road$CODMUNRES), 1, 6
)

datasus_road$cod_regiao_ocor <- substr(datasus_road$cod_municipio_ocor, 1, 1)
datasus_road$cod_regiao_res <- substr(datasus_road$cod_municipio_res, 1, 1)

datasus_road <- merge(
  x = datasus_road,
  y = regiao_df,
  by.x = "cod_regiao_res",
  by.y = "cod_regiao"
)

datasus_road$nome_regiao_res <- datasus_road$regiao
datasus_road$regiao <- NULL

datasus_road <- merge(
  x = datasus_road,
  y = regiao_df,
  by.x = "cod_regiao_ocor",
  by.y = "cod_regiao"
)

datasus_road$nome_regiao_ocor <- datasus_road$regiao
datasus_road$regiao <- NULL

datasus_road$ocup_cbo_vitima <- as.character(datasus_road$OCUP)

datasus_road <- subset(datasus_road, select = c(
  cid, cod_modal_vitima, modal_vitima, cod_modal_outro, modal_outro,
  data_ocorrencia, ano_ocorrencia, idade_vitima,
  faixa_etaria_vitima, sexo_vitima, escolaridade_vitima, raca_vitima,
  ocup_cbo_vitima, cod_municipio_ocor, nome_regiao_ocor, cod_municipio_res,
  nome_regiao_res
))

city_list$cod_municipio <- substr(
  as.character(city_list$codigo_municipio_completo), 1, 6
)

city_list <- subset(
  city_list,
  select = c(cod_municipio, nome_uf, nome_municipio)
)

## Join datasets


rtdeaths <- datasus_road |>
  dplyr::left_join(city_list, by = c("cod_municipio_ocor" = "cod_municipio")) |>
  dplyr::rename(nome_municipio_ocor = nome_municipio, nome_uf_ocor = nome_uf) |>
  dplyr::left_join(city_list, by = c("cod_municipio_res" = "cod_municipio")) |>
  dplyr::rename(nome_municipio_res = nome_municipio, nome_uf_res = nome_uf)

usethis::use_data(rtdeaths, overwrite = TRUE)
