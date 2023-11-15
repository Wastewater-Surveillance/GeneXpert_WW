# GeneXpert Wastewater Surveillance

Some text describing GeneXpert use for wastewater surveillance of pathogens.

*For professionalism we can add some visuals here*

### Table of Contents

- [Usage](#usage)
- [Standard Curves](#standard-curves)  
  * [Cartridge Lot number to Standard Curve mapping table](#cartridge-lot-number-to-standard-curve-mapping)  
  * [Standard Curve Parameters](#standard-curve-parameters)  
- [Roadmap](#roadmap)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)
- [Citations](#citations)
- [License](#license)


## Usage

*For the programmatically capable, we can have lines of R code here explaining how to use our reporting pipeline.*

Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Standard Curves

*Here we can have some text explaining the rotating standard curve*

A [form-fillable excel sheet]() is available for download that provides the function for quantification of GeneXpert Ct values.

### Cartridge Lot Number to Standard Curve Mapping {#cart-to-curve}

*Need to backfill previous lot numbers and standard curves for non-plus cartridges*
*Standard Curve names below are examples and are subject to change*

| Cartridge Lot Number | SARS-CoV-2 Standard Curve ID | FluA1 Standard Curve ID | FluA2 Standard Curve ID | FluB Standard Curve ID | RSV Standard Curve ID |
|---------------|-----------------------|---------|---------|---------|---------|
| 4534                 | GX23-0002_SARS_COV_2         | GX23-001_FluA1          | GX23-001_FluA2          | GX23-001_FluB          | GX23-001_RSV          |
| 7026                 | GX23-0002_SARS_COV_2         | GX23-001_FluA1          | GX23-001_FluA2          | GX23-001_FluB          | GX23-001_RSV          |
| 14018                | GX23-0002_SARS_COV_2         | GX23-001_FluA1          | GX23-001_FluA2          | GX23-001_FluB          | GX23-001_RSV          |
| 20201                | GX23-0002_SARS_COV_2         | GX23-001_FluA1          | GX23-001_FluA2          | GX23-001_FluB          | GX23-001_RSV          |
| 7026                 | GX23-0002_SARS_COV_2         | GX23-001_FluA1          | GX23-001_FluA2          | GX23-001_FluB          | GX23-001_RSV          |
| 20204                | GX23-0002_SARS_COV_2         | GX23-001_FluA1          | GX23-001_FluA2          | GX23-001_FluB          | GX23-001_RSV          |
| 20205                | GX23-0002_SARS_COV_2         | GX23-001_FluA1          | GX23-001_FluA2          | GX23-001_FluB          | GX23-001_RSV          |
| 20206                | GX23-0002_SARS_COV_2         | GX23-001_FluA1          | GX23-001_FluA2          | GX23-001_FluB          | GX23-001_RSV          |
| 7026                 | GX23-0002_SARS_COV_2         | GX23-001_FluA1          | GX23-001_FluA2          | GX23-001_FluB          | GX23-001_RSV          |
| 14019                | GX23-0002_SARS_COV_2         | GX23-001_FluA1          | GX23-001_FluA2          | GX23-001_FluB          | GX23-001_RSV          |
| 14714                | GX23-0002_SARS_COV_2         | GX23-001_FluA1          | GX23-001_FluA2          | GX23-001_FluB          | GX23-001_RSV          |

### Standard Curve Parameters

*Need to backfill standard curves for non-plus cartridges*

| Standard Curve ID    | Target     | Slope  | Intercept | PCR Efficiency | Effective Sample Volume |
|----------------------|:----------:|:------:|:---------:|:--------------:|:-----------------------:|
| GX23-0001_SARS_COV_2 | SARS-CoV-2 | -1.393 | 44.1      | 105%           | 8                       |
| GX23-0002_SARS_COV_2 | SARS-CoV-2 | -1.501 | 44.5      | 94.7%          | 30                      |
| GX23-0001_FluA1      | Flu A      | -1.373 | 40.0      | 107.2%         | 8                       |
| GX23-0001_FluA2      | Flu A      | -1.435 | 43.8      | 100.7%         | 8                       |
| GX23-0001_FluB       | Flu B      | -1.477 | 44.5      | 96.8%          | 8                       |
| GX23-0001_RSV        | RSV        | -1.855 | 49.3      | 71.4%          | 8                       |

Effective sample volume is calculated according to the [Protocol for Evaluations of RT-qPCR Performance Characteristics](https://files.ontario.ca/mecp-protocol-for-analyzing-wastewater-samples-en-2022-03-23.pdf). Effective sample volume is subject to change.

## Roadmap

If you have ideas for releases in the future, it is a good idea to list them in the README.

## Contact

Generic Wastewater surveillance email or NRI email?

## Acknowledgements

Show your appreciation to those who have contributed to the project.

## Citations

If you find NML's GeneXpert Surveillance program useful, please cite the following paper:

> Daigle J, Racher K, Hazenberg J, Yeoman A, Hannah H, Duong D, Mohammed U, Spreitzer D, Gregorchuk BSJ, Head BM, Meyers AFA, Sandstrom PA, Nichani A, Brooks JI, Mulvey MR, Mangat CS, Becker MG. *A Sensitive and Rapid Wastewater Test for SARS-COV-2 and Its Use for the Early Detection of a Cluster of Cases in a Remote Community*. Applied and Environmental Microbiology. 2022. March 8th. doi: [https://doi.org/10.1128/aem.01740-21](https://doi.org/10.1128/aem.01740-21)

## License

*I copied the license from the official PHAC-NML page, not sure if this is correct*

Copyright 2023 Government of Canada

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
