
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
head(dataset_list)
#>   id                                                title publicationDate
#> 1  1               Changes in local bird diversity (cSAR)            2018
#> 2  2                                     Forest loss year            2019
#> 3  3        Predicted suitability for EUNIS habitat types            2016
#> 4  4            Relative Magnitude of Fragmentation (RMF)            2020
#> 5  5     Mammal Area Of Habitat 2015-2100 (InSiGHTS LUH2)            2020
#> 6 10 GlobES –  1-km Resolution Global Ecosystem Data Cube            2020
#>               environmentalDomain
#> 1                     Terrestrial
#> 2                     Terrestrial
#> 3                     Terrestrial
#> 4                     Terrestrial
#> 5                     Terrestrial
#> 6 Terrestrial, Marine, Freshwater
#>                                                                                                                                                                                                                                                                                                                                                                                       provenanceDescription
#> 1                                                                                                                                                                                                                                                                                                                                                                                          To be added soon
#> 2                                                                                                                                                                                                                                                                                                                                                                                          To be added soon
#> 3                                                                                                                                                                                                                                                                                                                                                                                          To be added soon
#> 4                                                                                                                                                                                                                                                                                                                                                                                          To be added soon
#> 5                                                                                                                                                                                                                                                                                                                                                                                          To be added soon
#> 6 To develop the individual ecosystem maps in the GlobES data cube, we interpreted the interaction of 59 environmental variables that define ecosystem types, which we derived from 24 state-of-the-art, global datasets including remotely sensed and in-situ measurements of vegetation and abiotic land-surface cover, climate, soil, coastal and stream topography, and other environmental dimensions.
#>     license                                                DOI
#> 1 CC BY 4.0                          10.1101/2020.04.14.031716
#> 2 CC BY 4.0                            10.1126/science.1244693
#> 3 CC BY 4.0                                  10.1111/ddi.12736
#> 4 CC BY 4.0                                              apply
#> 5 CC BY 4.0 10.2139/ssrn.3451453, 10.1016/j.oneear.2020.05.015
#> 6 CC BY 4.0                                              apply
#>                                                                                                                                                                                                     ExternalLink
#> 1                                                                                                                                                                                                               
#> 2                                                                                 https://earthenginepartners.appspot.com, https://earthenginepartners.appspot.com/science-2013-global-forest/download_v1.7.html
#> 3 https://www.eea.europa.eu/data-and-maps/data/predicted-habitat-suitability-for-eunis, https://edepot.wur.nl/428644, https://sdi.eea.europa.eu/catalogue/geoss/api/records/cb23d43e-5495-4ab9-861e-1c2d13db33e2
#> 4                                                                                                                                                                                                               
#> 5                                                                                                                                                                https://globalmammal.org/staff/daniele-baisero/
#> 6                                                                                                                                                                                                               
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                description
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Changes in bird diversity at the grid cell level caused by land-use, estimated by the cSAR model (Pereira et al, https://doi.org/10.1101/2020.04.14.031716). It reports changes in species number (percentage and absolute), relative to 1900, for all bird species, forest bird species, and non-forest bird species in each cell. Uses the LUH 2.0 projections for land-use, and the PREDICTS coefficients for bird affinities to land-uses.
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Data in this layer were generated using multi-spectral satellite imagery from the Landsat 7 thematic mapper plus (ETM+) sensor. The clear surface observations from over 600,000 images were analysed using Google Earth Engine, a cloud platform for earth observation and data analysis, to determine per pixel tree cover using a supervised learning algorithm.
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              The modelled suitability for the EUNIS habitat types is an indication of where conditions are favourable for each habitat type based on verified sample plot data (Braun-Blanquet database) and the Maxent software package. The modelled suitability maps may be used as a proxy for the potential geographical distribution of the habitat types in given environmental and climatic envelopes. Note however that it is not representing the actual distribution of the habitat types. A first set of habitat suitability maps for forest types is available. Over the next years more suitability maps of habitat types will be provided from this page.
#> 4 We use an existing spatially contiguous, global remote-sensing data product (i.e. the 27-year annual ESA CCI land cover maps which can be categorized as an EBV ‘Ecosystem Distribution’) to derive an annual (27 year) time-series of the Relative Magnitude of Fragmentation (RMF) at a global scale and with a spatial resolution of 300m. From this derived EBV data product, we can calculate a RMF indicator of ecosystem degradation, i.e. the change, and rate of change, in  fragmentation of ecosystems (e.g. forests) over the last 27 years. This can provide important information for measuring biodiversity change as it directly links to the draft monitoring framework of the zero draft of the post-2020 global biodiversity framework of the Convention on Biological Diversity (CBD), especially Draft 2050 Goal 1 and the related Draft 2030 Target 1 (see Annex of  the zero draft). To assess the change in ecosystem fragmentation, we calculate, for every 300 m pixel and its neighbourhood (e.g. all eight adjacent grid cells or all grid cells in a given radius, such as 1 km around a focal cell), a metric that is called the entropy-based local indicator of spatial association (ELSA). This ELSA metric quantifies the relative magnitude of fragmentation of a specific land cover type for each landscape around a 300 m pixel (Naimi et al. 2019, Spatial Statistics 29: 66-88). We focus on forest land cover types by aggregating the 14 tree cover related land cover types from the ESA CCI product into ‘forest’  and by measuring its fragmentation relative to eight other (non-forest) land cover types (following the reclassification of Mousivand &amp; Arsanjani 2019, Applied Geography 106: 82-92). The ELSA metric can be used for both binary and multinomial categorical spatial data and quantifies the degree of fragmentation at each location relative to neighbouring locations, simultaneously incorporating both the spatial composition and the configuration of land cover types. The values of ELSA vary between 0 and 1, denoting lowest and highest fragmentation, respectively. The calculated RMF values of each 300 m pixel can be aggregated (e.g. averaged) at any coarser spatial resolution (e.g. country, national park, region) to summarize trends and the magnitude of ecosystem fragmentation for a specific area. The values are also comparable across regions and national boundaries, and thus scalable, because they are relative on a scale from 0 to 1. Values in the data have been scaled to integer with scale factor 0.0001 to reduce the size of the files.
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Data on Area Of Habitat (AOH) for 5090 mammals from 2015 to 2100, in 5 year intervals.
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Global data cube on the yearly extent of ecosystems following the habitat classification scheme of the IUCN Red List, used in the assessment of over 100,000 species. This data cube is composed by 65 ecosystem types and covers the period between 1992 and 2018, where each layer depicts per-pixel areas of a given ecosystem within a given year.
#>                                                                                       keywords
#> 1 Big Data, Remote Sensing, Birds, cSAR model, LUH 2.0 projections, PREDICTS, Land-use, Global
#> 2                  Big Data, Remote Sensing, Forest loss, Google, AI, Machine Learning, Global
#> 3         Big Data, Remote Sensing, Europe, Natural area, Tundra, Terrestrial ecosystem, EUNIS
#> 4                    Big Data, Remote Sensing, ESA, Land cover, Grid cell, Time-series, Global
#> 5                                               Mammals, Species, Habitats, Global, Land cover
#> 6                         Ecosystem extent, Time-series, Remote Sensing, Global, IUCN Red List
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               additionalInfo
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
#> 4 We define the ‘forest’ class by aggregating all 14 tree cover related land cover types from the ESA CCI product into one class. We further define eight non-forest classes (agriculture, grassland, wetland, settlement, sparse vegetation, bare area, water, permanent snow and ice) that we use as multinomial categorical data, or as binary categorical data (to define forest vs. non-forest). This classes follow the reclassification used by Mousivand &amp; Arsanjani 2019 (Applied Geography 106: 82-92). For deriving the RMF, we either calculate ELSA using the binary categorical data (forest vs. non-forest) or the multinomial categorical data (forest vs. the eight non-forest classes)
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           The presented data is a subset of its global dataset, which will be made available after a succeful peer review.
#>                      pathNameDataset pathNameMetadata creator.creatorName
#> 1          /1/netcdf/cSAR_idiv_v1.nc  /1/metadata.xml        Ines Martins
#> 2 /2/netcdf/hansen_lossyear_1000m.nc  /2/metadata.xml      Matthew Hansen
#> 3         /3/netcdf/hennekens_004.nc  /3/metadata.xml   Stephan Hennekens
#> 4               /4/netcdf/RMF_002.nc  /4/metadata.xml         Babak Naimi
#> 5          /5/netcdf/rodinini_002.nc  /5/metadata.xml     Daniele Baisero
#> 6               /10/netcdf/globES.nc /10/metadata.xml     Ruben Remelgado
#>                                                                  creator.creatorOrganisation
#> 1                                 German Centre for Integrative Biodiversity Research (iDiv)
#> 2                                                                     University of Maryland
#> 3                                                                      Wageningen University
#> 4                                                                     University of Helsinki
#> 5 Department of Biology and Biotechnology Charles Darwin (BBCD), Sapienza University of Rome
#> 6                                 German Centre for Integrative Biodiversity Research (iDiv)
#>        creator.creatorEmail contact.contactName
#> 1      ines.martins@idiv.de        Ines Martins
#> 2           mhansen@umd.edu      Matthew Hansen
#> 3  Stephan.Hennekens@wur.nl   Stephan Hennekens
#> 4         naimi.b@gmail.com  W. Daniel Kissling
#> 5 daniele.baisero@gmail.com     Daniele Baisero
#> 6   ruben.remelgado@idiv.de       Carsten Meyer
#>                                                                  contact.contactOrganisation
#> 1                                 German Centre for Integrative Biodiversity Research (iDiv)
#> 2                                                                     University of Maryland
#> 3                                                                      Wageningen University
#> 4          Institute for Biodiversity and Ecosystem Dynamics (IBED), University of Amsterdam
#> 5 Department of Biology and Biotechnology Charles Darwin (BBCD), Sapienza University of Rome
#> 6                                 German Centre for Integrative Biodiversity Research (iDiv)
#>        contact.contactEmail          ebv.ebvClass            ebv.ebvName
#> 1      ines.martins@idiv.de Community composition    Taxonomic diversity
#> 2           mhansen@umd.edu   Ecosystem structure Ecosystem distribution
#> 3  Stephan.Hennekens@wur.nl   Ecosystem structure Ecosystem distribution
#> 4      wdkissling@gmail.com   Ecosystem structure Ecosystem distribution
#> 5 daniele.baisero@gmail.com   Species populations  Species distributions
#> 6     carsten.meyer@idiv.de   Ecosystem structure Ecosystem distribution
#>   spatialDomain.spatialExtent spatialDomain.spatialDescription
#> 1                      Global                                 
#> 2                      Global                                 
#> 3        Continental/Regional                           Europe
#> 4                      Global                                 
#> 5                      Global                                 
#> 6                      Global                                 
#>   spatialDomain.spatialResolution spatialDomain.spatialAccuracy
#> 1                        1 degree                      1 degree
#> 2                      1000 meter                    1000 meter
#> 3                      1000 meter                    1000 meter
#> 4                      1000 meter                    1000 meter
#> 5                     0.25 degree                   0.25 degree
#> 6                     0.08 degree                   0.08 degree
#>   temporalDomain.temporalResolution temporalDomain.temporalExtentStart
#> 1                            Decade                         1900-01-01
#> 2                            Yearly                         2001-01-01
#> 3                     Every 5 years                         2014-01-01
#> 4                            Yearly                         1992-01-01
#> 5                     Every 5 years                         2015-01-01
#> 6                            Yearly                         1992-01-01
#>   temporalDomain.temporalExtentEnd biologicalEntity.entityType
#> 1                       2015-01-01            Species Taxonomy
#> 2                       2018-01-01             Ecosystem Types
#> 3                       2019-01-01             Ecosystem Types
#> 4                       2018-12-31             Ecosystem Types
#> 5                       2055-12-31            Species Taxonomy
#> 6                       2018-12-31             Ecosystem Types
#>          biologicalEntity.taxonomicCoverage
#> 1 All birds, Non-forest birds, forest birds
#> 2                                          
#> 3                                          
#> 4                                          
#> 5                                   Mammals
#> 6                                          
#>   biologicalEntity.classification.classificationSystemName
#> 1                                                         
#> 2                                                         
#> 3                                                         
#> 4                                                         
#> 5                                                         
#> 6         IUCN Habitat Classification Scheme (Version 3.1)
#>   biologicalEntity.classification.classificationSystemType
#> 1                                                         
#> 2                                                         
#> 3                                                         
#> 4                                                         
#> 5                                                         
#> 6                                                         
#>   biologicalEntity.classification.classificationSystemReference
#> 1                                                              
#> 2                                                              
#> 3                                                              
#> 4                                                              
#> 5                                                              
#> 6
```

From here, you can request information on a single record, and download
the data associated with this record, if any is available.

``` r
# List possible ids
dataset_list$id
#> [1] "1"  "2"  "3"  "4"  "5"  "10"

# Get a specific record
geobon_get(id = 1)
#>   id                                  title publicationDate environmentalDomain
#> 1  1 Changes in local bird diversity (cSAR)            2018         Terrestrial
#>   provenanceDescription   license                       DOI ExternalLink
#> 1      To be added soon CC BY 4.0 10.1101/2020.04.14.031716             
#>                                                                                                                                                                                                                                                                                                                                                                                                                                      description
#> 1 Changes in bird diversity at the grid cell level caused by land-use, estimated by the cSAR model (Pereira et al, https://doi.org/10.1101/2020.04.14.031716). It reports changes in species number (percentage and absolute), relative to 1900, for all bird species, forest bird species, and non-forest bird species in each cell. Uses the LUH 2.0 projections for land-use, and the PREDICTS coefficients for bird affinities to land-uses.
#>                                                                                       keywords
#> 1 Big Data, Remote Sensing, Birds, cSAR model, LUH 2.0 projections, PREDICTS, Land-use, Global
#>   additionalInfo           pathNameDataset pathNameMetadata creator.creatorName
#> 1                /1/netcdf/cSAR_idiv_v1.nc  /1/metadata.xml        Ines Martins
#>                                  creator.creatorOrganisation
#> 1 German Centre for Integrative Biodiversity Research (iDiv)
#>   creator.creatorEmail contact.contactName
#> 1 ines.martins@idiv.de        Ines Martins
#>                                  contact.contactOrganisation
#> 1 German Centre for Integrative Biodiversity Research (iDiv)
#>   contact.contactEmail          ebv.ebvClass         ebv.ebvName
#> 1 ines.martins@idiv.de Community composition Taxonomic diversity
#>   spatialDomain.spatialExtent spatialDomain.spatialDescription
#> 1                      Global                                 
#>   spatialDomain.spatialResolution spatialDomain.spatialAccuracy
#> 1                        1 degree                      1 degree
#>   temporalDomain.temporalResolution temporalDomain.temporalExtentStart
#> 1                            Decade                         1900-01-01
#>   temporalDomain.temporalExtentEnd biologicalEntity.entityType
#> 1                       2015-01-01            Species Taxonomy
#>          biologicalEntity.taxonomicCoverage
#> 1 All birds, Non-forest birds, forest birds
#>   biologicalEntity.classification.classificationSystemName
#> 1                                                         
#>   biologicalEntity.classification.classificationSystemType
#> 1                                                         
#>   biologicalEntity.classification.classificationSystemReference
#> 1

# Download the data from that record into a temp directory
geobon_download(id = 1, path = tempdir())
```
