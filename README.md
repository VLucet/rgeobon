
<!-- README.md is generated from README.Rmd. Please edit that file -->

# geobon <img src="inst/images/sticker.png" align="right" width=140/>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![R-CMD-check](https://github.com/VLucet/geobon/workflows/R-CMD-check/badge.svg)
<!-- badges: end -->

The goal of geobon is to provide an interface between R and the [GEOBON
open data portal](https://portal.geobon.org/index%3E) RESTfull API
(please note that the portal is currently in beta). It allows to consult
the datasets available on the portal and download them.

## Installation

You can install geobon from GitHub:

``` r
devtools::install_github("vlucet/geobon")
```

## Example

This demonstrates the basic functionnalities of `geobon`. You can first
get the list of all the available datasets:

``` r
library(geobon)
# Get the list of geobin datasets
dataset_list <- geobon_list()
head(dataset_list)
#>   id                                   name            author publicationDate
#> 1 48 Changes in local bird diversity (cSAR)      Ines Martins            2018
#> 2 49                       Forest loss year    Matthew Hansen            2019
#> 3 50      European habitat suitability maps Stephan Hennekens            2020
#>   additionalInfo spatialCoverage temporalResolution taxonomicCoverage License
#> 1                         Global             Yearly             Birds   CC BY
#> 2                         Global             Yearly            Plants   CC BY
#> 3                    Continental             Yearly            Plants   CC BY
#>                       pathNameDataset pathNameMetadata
#> 1          /48/netcdf/cSAR_idiv_v1.nc /48/metadata.xml
#> 2 /49/netcdf/hansen_lossyear_1000m.nc /49/metadata.xml
#> 3         /50/netcdf/hennekens_004.nc /50/metadata.xml
#>                                                                                                                                                                                                                                                                                                                                                                                                                abstract
#> 1 Changes in bird diversity at the grid cell level caused by land-use, estimated by the cSAR model (Martins &amp;amp; Pereira, 2017). It reports changes in species number (percentage and absolute), relative to 1900, for all bird species, forest bird species, and non-forest bird species in each cell. Uses the LUH 2.0 projections for land-use, and the PREDICTS coefficients for bird affinities to land-uses.
#> 2                                                   Data in this layer were generated using multi-spectral satellite imagery from the Landsat 7 thematic mapper plus (ETM+) sensor. The clear surface observations from over 600,000 images were analysed using Google Earth Engine, a cloud platform for earth observation and data analysis, to determine per pixel tree cover using a supervised learning algorithm.
#> 3                                                                                                                                                                                                                                                                                                                                                                             Changes in habitat suitability in europe.
#>         keywords          ebv.ebvClass                        ebv.ebvName
#> 1 remote sensing Community composition                  Species diversity
#> 2 remote sensing   Ecosystem structure Ecosystem extent and fragmentation
#> 3 remote sensing   Ecosystem structure                  Habitat structure
#>   contactDetails.contactPerson
#> 1                 Thomas Bauer
#> 2                 Thomas Bauer
#> 3                 Thomas Bauer
#>                              contactDetails.contactInstitute
#> 1          A.N. Severtsov Institute of Ecology and Evolution
#> 2 German Centre for Integrative Biodiversity Research (iDiv)
#> 3 German Centre for Integrative Biodiversity Research (iDiv)
#>   contactDetails.contactEmail
#> 1        thomas.bauer@idiv.de
#> 2        thomas.bauer@idiv.de
#> 3        thomas.bauer@idiv.de
```

From here, you can request information on a single record, and download
the data associated with this record, if any is available.

``` r
# Get a specific record
geobon_get(id = 49)
#>   id             name         author publicationDate additionalInfo
#> 1 49 Forest loss year Matthew Hansen            2019               
#>   spatialCoverage temporalResolution taxonomicCoverage License
#> 1          Global             Yearly            Plants   CC BY
#>                       pathNameDataset pathNameMetadata
#> 1 /49/netcdf/hansen_lossyear_1000m.nc /49/metadata.xml
#>                                                                                                                                                                                                                                                                                                                                                              abstract
#> 1 Data in this layer were generated using multi-spectral satellite imagery from the Landsat 7 thematic mapper plus (ETM+) sensor. The clear surface observations from over 600,000 images were analysed using Google Earth Engine, a cloud platform for earth observation and data analysis, to determine per pixel tree cover using a supervised learning algorithm.
#>         keywords        ebv.ebvClass                        ebv.ebvName
#> 1 remote sensing Ecosystem structure Ecosystem extent and fragmentation
#>   contactDetails.contactPerson
#> 1                 Thomas Bauer
#>                              contactDetails.contactInstitute
#> 1 German Centre for Integrative Biodiversity Research (iDiv)
#>   contactDetails.contactEmail
#> 1        thomas.bauer@idiv.de

# Download the data from that record into a temp directory
geobon_download(id = 49, path = tempdir())
```
