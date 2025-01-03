#' Brazilian road traffic deaths data
#'
#' Death certificates from road traffic crashes. Data from the Brazilian
#' Ministry of Health, between 1996 and 2023. All variables are encoded in
#' Brazilian Portuguese.
#'
#' @format ## `rtdeaths` dataset
#' A `data.frame` with 1,005,743 rows and 23 columns:
#' \describe{
#'   \item{\code{cid}}{ICD-10 code of main cause of death}
#'   \item{\code{cod_modal_vitima}}{Code that identifies type of transport}
#'   \item{\code{modal_vitima}}{Mode of transport of the victim during the road crash}
#'   \item{\code{cod_modal_outro}}{Code that identifies third-party envolvement on the crash}
#'   \item{\code{modal_outro}}{Identifies third-party envolvement on the road crash}
#'   \item{\code{data_ocorrencia}}{Date of death in ISO 8601 format}
#'   \item{\code{ano_ocorrencia}}{Year of death}
#'   \item{\code{idade_vitima}}{Age in years of the victim}
#'   \item{\code{faixa_etaria_vitima}}{Age range of the victim}
#'   \item{\code{sexo_vitima}}{Sex of the victim}
#'   \item{\code{escolaridade_vitima}}{Education of the victim}
#'   \item{\code{raca_vitima}}{Race of the victim}
#'   \item{\code{ocup_cbo_vitima}}{Ocupation of the victim, based on the CBO code}
#'   \item{\code{estado_civil_vitima}}{Marital status of the victim}
#'   \item{\code{local_ocor}}{Place of death of the victim}
#'   \item{\code{cod_municipio_ocor}}{City of death occurrence, based on IBGE code}
#'   \item{\code{nome_regiao_ocor}}{Brazilian region where the death occurred}
#'   \item{\code{cod_municipio_res}}{City of residence of the victim, based on IBGE code}
#'   \item{\code{nome_regiao_res}}{Brazilian region where the victim had an residence address}
#'   \item{\code{nome_uf_ocor}}{Name of the state where the death occurred}
#'   \item{\code{nome_municipio_ocor}}{Name of the city where the death occurred}
#'   \item{\code{nome_uf_res}}{Name of the state where the victim had an residence address}
#'   \item{\code{nome_municipio_res}}{Name of the city where the victim had an residence address}
#' }
#' @source <ftp://ftp.datasus.gov.br/dissemin/publicos/SIM/CID10/DOFET>
"rtdeaths"
