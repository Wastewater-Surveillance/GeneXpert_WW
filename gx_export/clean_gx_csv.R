# This script cleans GeneXpert csv data export files and returns a list of
# dataframes separated by assay where data is tabulated by test

# V1.0 2023-11-29

# By Hannah Exner and Cole Baril

# Load libraries ####
packages <- c("dplyr", "tidyr", "magrittr", "readr", "stringr", "purrr", "hms", "lubridate")

suppressMessages(suppressWarnings(lapply(packages, library, character.only = TRUE)))

# Main function ####

#' file
#' csv export file or list of files to be cleaned, if empty, will prompt user

#' date_format
#' date format of GeneXpert system to convert to datetimes
#' day-month-year(dmy), month-day-year (mdy), year-month-date (ymd) or
#' do not convert (NA)

#' mask_IDS
#' If sample and patient IDs should be removed (boolean)

#' flag_qc
#' If to flag possible positive QC tests or the SARS/Flu/RSV test (results where
#' all targets are positive) (boolean)


#' Example
#' 
#' clean_data <- clean_gx_csv("GX_export_demo.csv",
#' date_format = "ymd",
#' mask_IDS = FALSE,
#' flag_qc = TRUE)
#' 
#' In this example, a list of dataframes separated by assay type will be returned.

clean_gx_csv <-
  function(file = NA,
           date_format = NA,
           mask_IDS = FALSE,
           flag_qc = FALSE) {
    
    # CHECK CSV FILE AND IMPORT ----
    
    if (is.na(file) == TRUE){file <- choose.files(multi = TRUE)}
    
    csv <- data.frame()
    
    for(n in file){
      
      # check that file is a csv
      if (!grepl("\\.csv$", n)){
        stop(safeError("Invalid file detected. Please import a GeneXpert-generated csv file. / Type de fichier non valide. SVP télécharger un fichier .csv généré par un GeneXpert"))
      }
      
      n_csv <- readr::read_csv(n,
                               col_names = c("c1", "c2"),
                               locale = readr::locale(encoding = "UTF-16LE"),
                               show_col_types = F) %>%
        suppressWarnings()
      
      
      # check if file is valid
      if (n_csv$c1[[2]] != "System Name" &
          n_csv$c1[[2]] != "Nom du système") {
        stop(safeError("Invalid csv file detected. Please import a GeneXpert-generated csv file. / Type de fichier non valide. SVP télécharger un fichier .csv généré par un GeneXpert"))
      } else message("Valid GeneXpert csv file detected. / Fichier csv valide détecter")
      
      csv <- rbind(csv, n_csv)
    }
    
    # get language and assign column names
    if (csv$c1[[2]] == "System Name") lang <<- "EN"
    if (csv$c1[[2]] == "Nom du système") lang <<- "FR"
    
    if (lang == "EN") {
      test_col <<- "Assay"
      analyte_header <<- "Analyte Name_analyte_result"
      detail_header <<- "Analyte Name_detail"
      result_col <<- "Test Result"
      qc_col <<- "Multiplex_Positive_QC"
      start_date <<- "Start Date"
      start_time <<- "Start Time"
      end_date <<- "End Date"
      end_time <<- "End Time"
      run_time <<- "Run Time (min)"
      exp_date <<- "Expiration Date"
      sample_id <<- "Sample ID"
      patient_id <<- "Patient ID"
    }
    
    if (lang == "FR") {
      test_col <<- "Test"
      analyte_header <<- "Nom de l'analyte_analyte_result"
      detail_header <<- "Nom de l'analyte_detail"
      result_col <<- "Résultat du test"
      qc_col <<- "Multiplex_CQ_positif"
      start_date <<- "Date de lancement"
      start_time <<- "Heure de lancement"
      end_date <<- "Date de fin"
      end_time <<- "Heure de fin"
      run_time <<- "Durée du test (min)"
      exp_date <<- "Date d'expiration"
      sample_id <<- "N° Id de l'échantillon"
      patient_id <<- "N° Id du patient"
    }
    
    # SETUP ----
    
    # assign test number to new column in csv
    csv$Test_number <- grepl(pattern = "^RESULT TABLE|^TABLEAU DE RÉSULTATS",
                             csv$c1) %>%
      cumsum()
    
    message(max(csv$Test_number), " tests detected / tests détecter")
    
    # assign anchors to analyte and test data, then pivot data
    csv <- csv %>%
      # identify type of data in c1 and fill in between these anchors
      dplyr::mutate(
        name = dplyr::case_when(
          grepl("RESULT TABLE|TABLEAU DE RÉSULTATS", c1) ~ "test",
          grepl("Analyte Result|Résultat de l'analyte", c1) ~ "analyte_result",
          grepl("Melt Peaks|Pics de fusion", c1) ~ "melt_peak",
          grepl("Detail|Détail", c1) ~ "detail",
          grepl("Errors|Erreurs", c1) ~ "error",
          grepl("Messages", c1) ~ "message",
          grepl("History|Historique", c1) ~ "history",
          grepl("Cartridge Index|Indice de cartouche", c1) ~ "test",
          nchar(c1) == 1 & is.na(c2) ~ "misc"
        )
      ) %>%
      tidyr::fill(name) %>%
      
      # filter misc, history and missing information, add anchors
      dplyr::filter(name != "misc" & name != "history") %>%
      tidyr::drop_na(c2) %>%
      tidyr::unite("test", c(c1, name))
    
    # make sure c1 is distinct per test so pivot works
    csv <- csv %>%
      dplyr::group_by(Test_number) %>%
      dplyr::distinct(test, .keep_all = TRUE) %>%
      dplyr::ungroup()
    
    # pivot data
    csv <- csv %>%
      tidyr::pivot_wider(names_from = test, values_from = c2)
    
    # fix dates and times
    csv <- csv %>%
      tidyr::separate_wider_delim(!!sym(paste0(end_time, "_test")),
                                  delim = " ",
                                  names = c(end_date, end_time)) %>%
      
      tidyr::separate_wider_delim(!!sym(paste0(start_time, "_test")),
                                  delim = " ",
                                  names = c(start_date, start_time))
    
    csv[[start_time]] <- hms::as_hms(csv[[start_time]])
    csv[[end_time]] <- hms::as_hms(csv[[end_time]])
    csv[[run_time]] <- signif((csv[[end_time]] - csv[[start_time]]) / 60, digits = 4)
    
    csv <- dplyr::relocate(csv, all_of(run_time), .after = all_of(end_time))
    csv <- dplyr::relocate(csv, contains(patient_id), .after = contains(sample_id))
    
    if (date_format %in% (c("dmy", "ymd", "mdy"))) {
      
      csv[[start_date]] <- date(
        lubridate::parse_date_time2(csv[[start_date]], orders = date_format))
      csv[[end_date]] <- date(
        lubridate::parse_date_time2(csv[[end_date]], orders = date_format))
      csv[[paste0(exp_date, "_test")]] <- date(
        lubridate::parse_date_time2(csv[[paste0(exp_date, "_test")]], orders = date_format))
      
    }
    
    # merge all errors into one column if they exist
    if(any(grepl("_error", colnames(csv)))) {
      csv <- tidyr::unite(csv, "Test_errors", (dplyr::ends_with("error")), na.rm = T)
    }
    
    # GET ANALYTE DATA BY ASSAY ----
    
    assays <- csv %>% 
      dplyr::distinct(!!sym(paste0(test_col, "_test"))) %>%
      dplyr::pull(!!sym(paste0(test_col, "_test")))
    
    output <- list()
    
    # extract data for each detected assay
    for (i in c(1:length(assays))) {
      
      assay <- as.character(assays[i])
      message(assay, " detected / détecter")
      
      # filter for assay and remove columns with no data
      df <- csv %>%
        dplyr::filter(!!sym(paste0(test_col, "_test")) == assay) %>%
        dplyr::select(where( ~ !all(is.na(.x))))
      
      # check that detail analyte table exists then separate nested data
      if (analyte_header %in% colnames(df)) {
        analyte_result_headers <- dplyr::pull(df, !!sym(analyte_header)) %>%
          unlist() %>% .[1] %>% stringr::str_split_1(",")
        
        df <- df %>%
          tidyr::separate_wider_delim(
            cols = ends_with("_analyte_result"),
            delim = regex("(,(?=\\S))"),
            names_sep = "_",
            too_few = "align_start")
        
        # fix headers for nested analyte data
        for (n in c(1:length(analyte_result_headers))) {
          df <- df %>%
            dplyr::rename_with( ~ gsub(
              paste0("analyte_result_", n),
              analyte_result_headers[n],
              .x,
              fixed = TRUE))}
      }
      
      # check that detail table exists then separate nested data
      if (detail_header %in% colnames(df)) {
        detail_headers <- dplyr::pull(df,!!sym(detail_header)) %>%
          unlist() %>% .[1] %>% stringr::str_split_1(",")
        
        df <- df %>%
          tidyr::separate_wider_delim(
            cols = ends_with("_detail"),
            delim = regex("(,(?=\\S))"),
            names_sep = "_",
            too_few = "align_start"
          )
        
        # fix headers for nested detail data
        for (n in c(1:length(detail_headers))) {
          # check if header is not also a analyte data header to avoid duplicates
          if (!(detail_headers[n] %in% analyte_result_headers)) {
            df <- df %>%
              dplyr::rename_with( ~ gsub(paste0("detail_", n),
                                         detail_headers[n], .x, fixed = TRUE))
          }
        }
      }
      
      # remove redundant columns and fix generic test data columns
      df <- df %>%
        dplyr::select(
          !starts_with("Analyte Name") &
            !starts_with("Nom de l'analyte") &
            !contains("_detail_") &
            !contains("_history")
        )
      
      colnames(df) <- gsub("_test|_detail", "", colnames(df))
      
      output[[assay]] <- df
      
    }
    
    # FINAL CLEANING ----
    
    # flag positive QC samples
    if (flag_qc == TRUE) {
      output <- purrr::map(output,
                           ~ dplyr::mutate(
                             .,
                             `Mutiplex_QC/CQ` = dplyr::case_when(
                               !!sym(result_col) == "SARS-CoV-2 POSITIVE|Flu A POSITIVE|Flu B POSITIVE|RSV POSITIVE" ~ "*",
                               TRUE ~ NA)))
    }
    
    # remove sample and patient IDs
    if (mask_IDS == TRUE) {
      output <- purrr::map(output,
                           ~ dplyr::select(
                             .,
                             -dplyr::any_of(c(sample_id, patient_id))))
    }
    
    # separate multiple analytes if present and extract quantitative results
    output <- purrr::map(
      output,
      ~ tidyr::separate_wider_delim(
        .,
        cols = any_of(c("Test Result", "Résultat du test")),
        delim = "|",
        names = c(
          "Result / Résultat 1",
          "Result / Résultat 2",
          "Result / Résultat 3",
          "Result / Résultat 4",
          "Result / Résultat 5",
          "Result / Résultat 6",
          "Result / Résultat 7"
        ),
        too_few = "align_start",
        too_many = "merge",
        cols_remove = FALSE
      ) %>%
        dplyr::mutate(rq = case_when(
          stringr::str_detect(`Result / Résultat 1`, 'log ') ~
            stringr::str_extract(`Result / Résultat 1`, 'log \\d\\.\\d\\d'),
          TRUE ~ NA
        )) %>%
        dplyr::mutate(`Log cp/ml` = case_when(
          stringr::str_detect(rq, 'log ') ~
            stringr::str_extract(rq, '\\d\\.\\d\\d'),
          TRUE ~ NA
        )) %>% select(-rq) %>%
        # Removes completely empty columns
        dplyr::select_if(function(x) {
          !all(is.na(x))
        })
    )
    
    # make df with all tests combined
    output$All_Tests <- dplyr::bind_rows(output)
    
    return(output)
    
  }
