# GeneXpert Script for csv files 2022-10-18
# importing packages
# will optimize later

import pandas as pd                             # this is for dataframe and organization
import os                                       # this is for just operating system functions
import glob                                     # helps with file recognition
import csv                                      #
import sys                                      #

# from numpy.distutils.fcompiler import none # what is this?

# setting working directory (where the csv files are)
### os.chdir('/tmp') ###
############################### Not ready yet vvvvv
if getattr(sys, 'frozen', False):
    app_path = os.path.dirname(sys.executable)
else:
    app_path = os.path.dirname(os.path.abspath(__file__)) # file name?
############################### Not Ready Yet ^^^^^
# hopefully once this is a standalone executable then the working directory will be the folder that it is in atm
# check with: print("Current working directory: {0}".format(os.getcwd()))

# list of files in working directory
path = os.getcwd()                              # this will become app_path eventually
file_list = glob.glob(path + "/*.csv")          # this will return all the CSV files' list located within th path that contain: .csv

data_frame = pd.DataFrame()                     # placeholder for when we bind all dataframes together
content = []                                    # placeholder for list of dataframes made from loop

for filename in file_list:                      # looping function to make dataframes for each csv
    df_in = pd.read_csv(filename, engine = "python", encoding = 'utf_16',
                        names = ['info1','info2','end_point','analyte_result','probe_check_result','second_derived_peak_height', 'G'],
                        delimiter = ',',
                        skip_blank_lines = False,
                        on_bad_lines = 'warn')

        info1_list = []
        for i, v in enumerate(info1_list):
            totalcount = info1_list.count(v)
            count = info1_list[:i].count(v)
            newlist.append(v + str(count + 1) if totalcount > 1 else v)

                                                    # store variables and organize into new dataframe
                                                    # If.else functions for a
        content.append(df_out)                      # recreates list of dataframes created from loop

ddata_frame = pd.concat(content)                     # converts content into dataframe