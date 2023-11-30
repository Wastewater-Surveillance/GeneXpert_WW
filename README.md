# GeneXpert Wastewater Surveillance

The National Micriobiology Laboratory has developed a protocol and analysis pipeline for the use of GeneXpert Systems in wastewater surveillance of respiratory targets.

### Table of Contents

-   [Usage](#usage)
-   [Standard Curves](#standard-curves)
    -   [Cartridge Lot to Standard Curve mapping table](#cartridge-lot-to-standard-curve-mapping)
    -   [Standard Curve Parameters](#standard-curve-parameters)
-   [Roadmap](#roadmap)
-   [Contact](#contact)
-   [Citations](#citations)

## Usage

This section will describe using examples the usage of the NML GeneXpert wastewater analysis pipeline. The pipeline will also be shared on this repository shortly.

## Standard Curves

A [form-fillable excel sheet]() will be made available for download that provides the function for quantification of GeneXpert Ct values.

### Cartridge Lot to Standard Curve Mapping

| Cartridge Lot Number | SARS-CoV-2 Standard Curve ID | Flu A 1 Standard Curve ID | Flu A 2 Standard Curve ID | Flu B Standard Curve ID | RSV Standard Curve ID |
|------------|------------|------------|------------|------------|------------|
| 02009                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 02024                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 02102                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 02112                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 02119                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 02201                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 02409                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 02410                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 02418                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 03628                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 03723                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 03727                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 04513                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 04514                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 04702                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05006                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05533                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05611                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05615                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05616                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05619                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05620                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05621                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05622                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05625                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05626                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05627                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 05630                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06305                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06308                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06313                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06314                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06316                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06318                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06319                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06325                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06602                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06606                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06607                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06608                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06609                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06610                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06611                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 06708                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 13816                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 14903                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 4534                 | GX23-0002_SARS_COV_2         | GX23-001_FluA1            | GX23-001_FluA2            | GX23-001_FluB           | GX23-001_RSV          |
| 7026                 | GX23-0002_SARS_COV_2         | GX23-001_FluA1            | GX23-001_FluA2            | GX23-001_FluB           | GX23-001_RSV          |
| 14018                | GX23-0002_SARS_COV_2         | GX23-001_FluA1            | GX23-001_FluA2            | GX23-001_FluB           | GX23-001_RSV          |
| 20201                | GX23-0002_SARS_COV_2         | GX23-001_FluA1            | GX23-001_FluA2            | GX23-001_FluB           | GX23-001_RSV          |
| 20204                | GX23-0002_SARS_COV_2         | GX23-001_FluA1            | GX23-001_FluA2            | GX23-001_FluB           | GX23-001_RSV          |
| 20205                | GX23-0002_SARS_COV_2         | GX23-001_FluA1            | GX23-001_FluA2            | GX23-001_FluB           | GX23-001_RSV          |
| 20206                | GX23-0002_SARS_COV_2         | GX23-001_FluA1            | GX23-001_FluA2            | GX23-001_FluB           | GX23-001_RSV          |
| 14019                | GX23-0002_SARS_COV_2         | GX23-001_FluA1            | GX23-001_FluA2            | GX23-001_FluB           | GX23-001_RSV          |
| 14714                | GX23-0002_SARS_COV_2         | GX23-001_FluA1            | GX23-001_FluA2            | GX23-001_FluB           | GX23-001_RSV          |

[Back to top](#genexpert-wastewater-surveillance)

### Standard Curve Parameters

| Standard Curve ID    |   Target   | Slope  | Intercept | PCR Efficiency | Effective Sample Volume |
|------------|:----------:|:----------:|:----------:|:----------:|:----------:|
| GX23-0001_SARS_COV_2 | SARS-CoV-2 | -3.207 |  42.434   |      105%      |            9            |
| GX23-0002_SARS_COV_2 | SARS-CoV-2 | -3.479 |  43.487   |     93.8%      |            9            |
| GX23-0001_FluA1      |   Flu A    | -1.373 |   40.0    |     107.2%     |            9            |
| GX23-0001_FluA2      |   Flu A    | -1.435 |   43.8    |     100.7%     |            9            |
| GX23-0001_FluB       |   Flu B    | -1.477 |   44.5    |     96.8%      |            9            |
| GX23-0001_RSV        |    RSV     | -1.855 |   49.3    |     71.4%      |            9            |

Effective sample volume is the amount of original sample volume being processed by the assay as defined by [Protocol for Evaluations of RT-qPCR Performance Characteristics](https://files.ontario.ca/mecp-protocol-for-analyzing-wastewater-samples-en-2022-03-23.pdf). In short, Effective sample volume is calculated by accounting for volume lost in the process using ratios. Using the NML GeneXpert process as an example:

40 mL of wastewater is clarified and 15 mL of the supernatant is used for analysis. The supernatant is concentrated via filter to a volume of 250 uL. 200 uL of concentrate is diluted with 200 uL of nuclease-free water to 400 uL of diluted concentrate. 300 uL of the diluted concentrate is analyzed using the GeneXpert cartridge. The formula before accounts for all volume losses as a ratio from the starting volume of 40 mL. Note: There is a dilution step but since we do not lose volume it is not included.

40 mL x 15 mL/40 mL x 200 uL / 250 uL x 300 uL / 400 uL = 9 mL effective volume.

**Note: Work is underway to measure and account for volume lost in the filter and clarification steps of the NML protocol**

[Back to top](#genexpert-wastewater-surveillance)

## Roadmap

Ideas for future releases will be listed here.

## Contact

Wastewater Surveillance Unit National Microbiology Laboratory Public Health Agency of Canada [nmlwastewater\@phac-aspc.gc.ca](mailto:nmlwastewater@phac-aspc.gc.ca)

## Citations

If you find NML's GeneXpert Surveillance program useful, please cite the following:

> Hizon N, Mejia E, Gregorchuck BSJ, Hannah H, Medina N, Becker MG, Mangat CS. *GeneXpert Wastewater Surveillance*. GitHub repository. <https://github.com/Wastewater-Surveillance/GeneXpert_WW>

> Daigle J, Racher K, Hazenberg J, Yeoman A, Hannah H, Duong D, Mohammed U, Spreitzer D, Gregorchuk BSJ, Head BM, Meyers AFA, Sandstrom PA, Nichani A, Brooks JI, Mulvey MR, Mangat CS, Becker MG. *A Sensitive and Rapid Wastewater Test for SARS-COV-2 and Its Use for the Early Detection of a Cluster of Cases in a Remote Community*. Applied and Environmental Microbiology. 2022. March 8th. doi: <https://doi.org/10.1128/aem.01740-21>

[Back to top](#genexpert-wastewater-surveillance)
