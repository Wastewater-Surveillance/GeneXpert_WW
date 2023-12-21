# GeneXpert Wastewater Surveillance

The National Micriobiology Laboratory has developed a protocol and analysis pipeline for the use of GeneXpert Systems in wastewater surveillance of respiratory targets.

### Table of Contents

-   [Usage](#usage)
-   [Standard Curves](#standard-curves)
    -   [Cartridge Lot to Standard Curve Mapping](#cartridge-lot-to-standard-curve-mapping)
    -   [Standard Curve Parameters](#standard-curve-parameters)
    -   [Example Calculation](#example-calculation)
-   [Roadmap](#roadmap)
-   [Contact](#contact)
-   [Citations](#citations)

## Usage

This section will describe using examples the usage of the NML GeneXpert wastewater analysis pipeline. The pipeline will also be shared on this repository shortly.

## Standard Curves

A [form-fillable excel file](GXWW_conversion_2023_12_21.xlsx) is available for download that provides quantification of GeneXpert Ct values into viral copies per mL.

### Cartridge Lot to Standard Curve Mapping

A table that maps the GeneXpert Cartridge Lot Number to its standard curve is available for download as an [excel file](gx_lotmapping/GXWW_lotmapping_2023_12_21.xlsx) and [csv file](gx_lotmapping/GXWW_lotmapping_2023_12_21.csv). Files will be updated to inlcude new lots. The GeneXpert Cartridge Lot Number is the 5 digit number (inlcuding all leading zeros) found on the test cartridge or GeneXpert pdf test report (as Reagent Lot ID).

An example of the this table is seen here:
| Cartridge Lot Number | SARS-CoV-2 Standard Curve ID | Flu A 1 Standard Curve ID | Flu A 2 Standard Curve ID | Flu B Standard Curve ID | RSV Standard Curve ID |
|------------|------------|------------|------------|------------|------------|
| 02009                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 02119                | GX23-0001_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |
| 22920                | GX23-0002_SARS_COV_2         | GX23-0001_FluA1           | GX23-0001_FluA2           | GX23-0001_FluB          | GX23-0001_RSV         |

[Back to top](#genexpert-wastewater-surveillance)

### Standard Curve Parameters

Standard curves for the quantification of Ct values in wastewater is available for download as [excel file](gx_stdcurves/GXWW_gx_stdcurves_2023_12_21.xslx) and [csv file](gx_stdcurves/GXWW_gx_stdcurves_2023_12_21.csv). Files will be updated to include current standard curve information.

The formula for GeneXpert Ct quantification with these standard curves is:

**cp/mL in Wastewater = (10^((Ct - Intercept)/ Slope)) / Effective Sample Volume**

An example of the this table is seen here:
| Standard Curve ID    |   Target   | Slope  | Intercept | PCR Efficiency | Effective Sample Volume |
|------------|:----------:|:----------:|:----------:|:----------:|:----------:|
| GX23-0001_SARS_COV_2 | SARS-CoV-2 | -3.207 |  42.434   |     105.0%     |            9            |
| GX23-0002_SARS_COV_2 | SARS-CoV-2 | -3.479 |  43.146   |     93.8%      |            9            |
| GX23-0001_FluA1      |   Flu A    | -3.162 |  39.022   |     107.2%     |            9            |
| GX23-0001_FluA2      |   Flu A    | -3.309 |  42.769   |     100.7%     |            9            |
| GX23-0001_FluB       |   Flu B    | -3.401 |  43.454   |     96.8%      |            9            |
| GX23-0001_RSV        |    RSV     | -4.270 |  48.025   |     71.4%      |            9            |

Effective sample volume is the amount of original sample volume being processed by the assay as defined by [Protocol for Evaluations of RT-qPCR Performance Characteristics](https://files.ontario.ca/mecp-protocol-for-analyzing-wastewater-samples-en-2022-03-23.pdf). In short, Effective sample volume is calculated by accounting for volume lost in the process using ratios.

Using the NML GeneXpert process as an example:

40 mL of wastewater is clarified and 15 mL of the supernatant is used for analysis. The supernatant is concentrated via filter to a volume of 250 uL. 200 uL of this concentrate is diluted with 200 uL of nuclease-free water to make a final solution of 400 uL of diluted concentrate. 300 uL of the diluted concentrate is analyzed using the GeneXpert cartridge. The formula below accounts for all volume losses as a ratio from the starting volume of 40 mL. Note: There is a dilution step but since we do not lose volume it is not included.

40 mL x 15 mL / 40 mL x 200 uL / 250 uL x 300 uL / 400 uL = 9 mL effective volume.

**Note: Work is underway to measure and adjust for volume lost in the filter and clarification steps of the NML protocol**

[Back to top](#genexpert-wastewater-surveillance)

### Example Calculation

Using Cartridge Lot Number Lot 22920 using the protocol as described above, the sample generated a SARS Ct value of 36.5. According to the lot mapping table, the SARS-CoV-2 Standard Curve ID for Cartridge Lot Number Lot 22920 is GX23-0002_SARS_COV_2. Therefore:

- Slope = -3.479
- Intercept = 43.487
- Effective Sample Volume (ESV) = 9

cp/mL in wastewater = (10^((Ct - Intercept)/ Slope)) / Effective Sample Volume

cp/mL in wastewater = (10^((36.5 - 43.487)/ -3.479)) / 9 = 11.3 cp/mL

## Roadmap

Ideas for future releases will be listed here.

## Contact

Wastewater Surveillance Unit  
National Microbiology Laboratory  
Public Health Agency of Canada  
[nmlwastewater@phac-aspc.gc.ca](mailto:nmlwastewater@phac-aspc.gc.ca)

## Citations

If you find NML's GeneXpert Surveillance program useful, please cite the following:

> Hizon N, Mejia E, Hannah E, Gregorchuck BSJ, Medina N, Becker MG, Mangat CS. *GeneXpert Wastewater Surveillance*. GitHub repository. <https://github.com/Wastewater-Surveillance/GeneXpert_WW>

> Daigle J, Racher K, Hazenberg J, Yeoman A, Hannah H, Duong D, Mohammed U, Spreitzer D, Gregorchuk BSJ, Head BM, Meyers AFA, Sandstrom PA, Nichani A, Brooks JI, Mulvey MR, Mangat CS, Becker MG. *A Sensitive and Rapid Wastewater Test for SARS-COV-2 and Its Use for the Early Detection of a Cluster of Cases in a Remote Community*. Applied and Environmental Microbiology. 2022. March 8th. doi: <https://doi.org/10.1128/aem.01740-21>

[Back to top](#genexpert-wastewater-surveillance)
