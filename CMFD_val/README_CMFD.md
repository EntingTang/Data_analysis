# CMFD validation 
## (He et al. (2020))
Please download a sub-dataset as a demo to run the python code(https://surfdrive.surf.nl/files/index.php/s/aDuUyJBiEx9pq9q, password: 202212), which is written for: 
1. Extract the variables from *.nc file (see *Extract_Lrad.py*). The output are 12 **.csv* files, which are the 3-hourly meteo. variables for each month.
2. Combine the 12 files into one csv in sequence (see *Combine_csv.py*). The output file is named *"Lrad_YK_2016_interploated.xlsx"*.
3. Downsacle the 3-hourly data into half-hourly data (see *Lrad_upsample.py*).
4. The linear regression is done in Excel with the avaliable in-situ measurements.
