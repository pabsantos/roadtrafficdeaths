# Brazilian road traffic deaths data

Death certificates from road traffic crashes. Data from the Brazilian
Ministry of Health, between 1996 and 2024. All variables are encoded in
Brazilian Portuguese.

## Usage

``` r
rtdeaths
```

## Format

### `rtdeaths` dataset

A `data.frame` with 1,005,743 rows and 23 columns:

- `cid`:

  ICD-10 code of main cause of death

- `cod_modal_vitima`:

  Code that identifies type of transport

- `modal_vitima`:

  Mode of transport of the victim during the road crash

- `cod_modal_outro`:

  Code that identifies third-party envolvement on the crash

- `modal_outro`:

  Identifies third-party envolvement on the road crash

- `data_ocorrencia`:

  Date of death in ISO 8601 format

- `ano_ocorrencia`:

  Year of death

- `idade_vitima`:

  Age in years of the victim

- `faixa_etaria_vitima`:

  Age range of the victim

- `sexo_vitima`:

  Sex of the victim

- `escolaridade_vitima`:

  Education of the victim

- `raca_vitima`:

  Race of the victim

- `ocup_cbo_vitima`:

  Ocupation of the victim, based on the CBO code

- `estado_civil_vitima`:

  Marital status of the victim

- `local_ocor`:

  Place of death of the victim

- `cod_municipio_ocor`:

  City of death occurrence, based on IBGE code

- `nome_regiao_ocor`:

  Brazilian region where the death occurred

- `cod_municipio_res`:

  City of residence of the victim, based on IBGE code

- `nome_regiao_res`:

  Brazilian region where the victim had an residence address

- `nome_uf_ocor`:

  Name of the state where the death occurred

- `nome_municipio_ocor`:

  Name of the city where the death occurred

- `nome_uf_res`:

  Name of the state where the victim had an residence address

- `nome_municipio_res`:

  Name of the city where the victim had an residence address

## Source

<ftp://ftp.datasus.gov.br/dissemin/publicos/SIM/CID10/DOFET>
