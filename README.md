
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rgeobon <img src="inst/images/sticker.png" align="right" width=140/>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R build
status](https://github.com/VLucet/geobon/workflows/R-CMD-check/badge.svg)](https://github.com/VLucet/geobon/actions)
<!-- badges: end -->

The goal of rgeobon is to provide an interface between R and the [GEOBON
open data portal](https://portal.geobon.org/) RESTfull API (please note
that the portal is currently in beta). It allows to consult the datasets
available on the portal and download them.

## Installation

You can install rgeobon from GitHub:

``` r
devtools::install_github("vlucet/rgeobon")
```

## Example

This demonstrates the basic abilities of `rgeobon`. You can first get
the list of all the available datasets:

``` r
library(rgeobon)
# Get the list of GEOBON datasets
dataset_list <- geobon_list()
dataset_list
#> # A tibble: 6 x 33
#>   id    title publicationDate environmentalDo… provenanceDescr… license DOI  
#>   <chr> <chr> <chr>           <chr>            <chr>            <chr>   <lis>
#> 1 1     Chan… 2018            Terrestrial      To be added soon CC BY … <chr…
#> 2 2     Fore… 2019            Terrestrial      To be added soon CC BY … <chr…
#> 3 3     Pred… 2016            Terrestrial      To be added soon CC BY … <chr…
#> 4 4     Rela… 2020            Terrestrial      To be added soon CC BY … <chr…
#> 5 5     Mamm… 2020            Terrestrial      To be added soon CC BY … <chr…
#> 6 10    Glob… 2020            Terrestrial, Ma… To develop the … CC BY … <chr…
#> # … with 26 more variables: ExternalLink <list>, description <chr>,
#> #   keywords <list>, additionalInfo <chr>, pathNameDataset <chr>,
#> #   pathNameMetadata <chr>, creator.creatorName <chr>,
#> #   creator.creatorOrganisation <chr>, creator.creatorEmail <chr>,
#> #   contact.contactName <chr>, contact.contactOrganisation <chr>,
#> #   contact.contactEmail <chr>, ebv.ebvClass <chr>, ebv.ebvName <chr>,
#> #   spatialDomain.spatialExtent <chr>, spatialDomain.spatialDescription <chr>,
#> #   spatialDomain.spatialResolution <chr>, spatialDomain.spatialAccuracy <chr>,
#> #   temporalDomain.temporalResolution <chr>,
#> #   temporalDomain.temporalExtentStart <chr>,
#> #   temporalDomain.temporalExtentEnd <chr>, biologicalEntity.entityType <chr>,
#> #   biologicalEntity.taxonomicCoverage <chr>,
#> #   biologicalEntity.classification.classificationSystemName <chr>,
#> #   biologicalEntity.classification.classificationSystemType <chr>,
#> #   biologicalEntity.classification.classificationSystemReference <chr>
```

From here, you can request information on a single record, and download
the data associated with this record, if any is available.

``` r
# List possible ids
dataset_list$id
#> [1] "1"  "2"  "3"  "4"  "5"  "10"

# Get a specific record
geobon_get(id = 1)
#> # A tibble: 1 x 33
#>   id    title publicationDate environmentalDo… provenanceDescr… license DOI  
#>   <chr> <chr> <chr>           <chr>            <chr>            <chr>   <lis>
#> 1 1     Chan… 2018            Terrestrial      To be added soon CC BY … <chr…
#> # … with 26 more variables: ExternalLink <list>, description <chr>,
#> #   keywords <list>, additionalInfo <chr>, pathNameDataset <chr>,
#> #   pathNameMetadata <chr>, creator.creatorName <chr>,
#> #   creator.creatorOrganisation <chr>, creator.creatorEmail <chr>,
#> #   contact.contactName <chr>, contact.contactOrganisation <chr>,
#> #   contact.contactEmail <chr>, ebv.ebvClass <chr>, ebv.ebvName <chr>,
#> #   spatialDomain.spatialExtent <chr>, spatialDomain.spatialDescription <chr>,
#> #   spatialDomain.spatialResolution <chr>, spatialDomain.spatialAccuracy <chr>,
#> #   temporalDomain.temporalResolution <chr>,
#> #   temporalDomain.temporalExtentStart <chr>,
#> #   temporalDomain.temporalExtentEnd <chr>, biologicalEntity.entityType <chr>,
#> #   biologicalEntity.taxonomicCoverage <chr>,
#> #   biologicalEntity.classification.classificationSystemName <chr>,
#> #   biologicalEntity.classification.classificationSystemType <chr>,
#> #   biologicalEntity.classification.classificationSystemReference <chr>

# Download the data from that record into a temp directory
geobon_download(id = 1, path = tempdir())
```
