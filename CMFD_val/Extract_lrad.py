# -*- coding: utf-8 -*-
"""
Created on Fri Dec 17 20:00:34 2021

@author: etang
"""


from netCDF4 import Dataset
import numpy as np
import pandas as pd

# 这段代码实现了：提取nc文件中某个特定点的时间序列数据

# Reading in the netCDF file
data01 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201601.nc','r')

lat01 = data01.variables['lat'][:]
lon01 = data01.variables['lon'][:]

# Define the study point
lat_yanchi = 37.82944
lon_yanchi = 107.4936

# Calculate the difference between study point and each data point
sq_diff_lat01 = (lat01 - lat_yanchi)**2
sq_diff_lon01 = (lon01 - lon_yanchi)**2

min_index_lat01 = sq_diff_lat01.argmin()
min_index_lon01 = sq_diff_lon01.argmin()

pres01 = data01.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test01 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-01-01 00:00', '2016-01-31 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df01 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test01)
# Create an index column
dt01 = np.arange(0,data01.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt01:
    df01.iloc[time_index] = pres01[time_index,min_index_lat01,min_index_lon01] # presMay should be the sradMay

df01.to_csv('Lrad01_YK.csv')
    
#################################################################################################

data02 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201602.nc','r')

lat02 = data02.variables['lat'][:]
lon02 = data02.variables['lon'][:]

# Calculate the difference between study point and each data point
sq_diff_lat02 = (lat02 - lat_yanchi)**2
sq_diff_lon02 = (lon02 - lon_yanchi)**2

min_index_lat02 = sq_diff_lat02.argmin()
min_index_lon02 = sq_diff_lon02.argmin()

pres02 = data02.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test02 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-02-01 00:00', '2016-02-29 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df02 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test02)
# Create an index column
dt02 = np.arange(0,data02.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt02:
    df02.iloc[time_index] = pres02[time_index,min_index_lat02,min_index_lon02] # presMay should be the sradMay

df02.to_csv('Lrad02_YK.csv')

#################################################################################################

data03 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201603.nc','r')

lat03 = data03.variables['lat'][:]
lon03 = data03.variables['lon'][:]

# Calculate the difference between study point and each data point
sq_diff_lat03 = (lat03 - lat_yanchi)**2
sq_diff_lon03 = (lon03 - lon_yanchi)**2

min_index_lat03 = sq_diff_lat03.argmin()
min_index_lon03 = sq_diff_lon03.argmin()

pres03 = data03.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test03 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-03-01 00:00', '2016-03-31 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df03 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test03)
# Create an index column
dt03 = np.arange(0,data03.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt03:
    df03.iloc[time_index] = pres03[time_index,min_index_lat03,min_index_lon03] # presMay should be the sradMay

df03.to_csv('Lrad03_YK.csv')

#################################################################################################

data04 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201604.nc','r')

lat04 = data04.variables['lat'][:]
lon04 = data04.variables['lon'][:]

# Calculate the difference between study point and each data point
sq_diff_lat04 = (lat04 - lat_yanchi)**2
sq_diff_lon04 = (lon04 - lon_yanchi)**2

min_index_lat04 = sq_diff_lat04.argmin()
min_index_lon04 = sq_diff_lon04.argmin()

pres04 = data04.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test04 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-04-01 00:00', '2016-04-30 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df04 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test04)
# Create an index column
dt04 = np.arange(0,data04.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt04:
    df04.iloc[time_index] = pres04[time_index,min_index_lat04,min_index_lon04] # presMay should be the sradMay

df04.to_csv('Lrad04_YK.csv')

#################################################################################################

data05 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201605.nc','r')

lat05 = data05.variables['lat'][:]
lon05 = data05.variables['lon'][:]

# Calculate the difference between study point and each data point
sq_diff_lat05 = (lat05 - lat_yanchi)**2
sq_diff_lon05 = (lon05 - lon_yanchi)**2

min_index_lat05 = sq_diff_lat05.argmin()
min_index_lon05 = sq_diff_lon05.argmin()

pres05 = data05.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test05 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-05-01 00:00', '2016-05-31 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df05 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test05)
# Create an index column
dt05 = np.arange(0,data05.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt05:
    df05.iloc[time_index] = pres05[time_index,min_index_lat05,min_index_lon05] # presMay should be the sradMay

df05.to_csv('Lrad05_YK.csv')


#################################################################################################

data06 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201606.nc','r')

lat06 = data06.variables['lat'][:]
lon06 = data06.variables['lon'][:]

# Calculate the difference between study point and each data point
sq_diff_lat06 = (lat06 - lat_yanchi)**2
sq_diff_lon06 = (lon06 - lon_yanchi)**2

min_index_lat06 = sq_diff_lat06.argmin()
min_index_lon06 = sq_diff_lon06.argmin()

pres06 = data06.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test06 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-06-01 00:00', '2016-06-30 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df06 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test06)
# Create an index column
dt06 = np.arange(0,data06.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt06:
    df06.iloc[time_index] = pres06[time_index,min_index_lat06,min_index_lon06] # presMay should be the sradMay

df06.to_csv('Lrad06_YK.csv')

#################################################################################################

data07 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201607.nc','r')

lat07 = data07.variables['lat'][:]
lon07 = data07.variables['lon'][:]

# Calculate the difference between study point and each data point
sq_diff_lat07 = (lat07 - lat_yanchi)**2
sq_diff_lon07 = (lon07 - lon_yanchi)**2

min_index_lat07 = sq_diff_lat07.argmin()
min_index_lon07 = sq_diff_lon07.argmin()

pres07 = data07.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test07 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-07-01 00:00', '2016-07-31 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df07 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test07)
# Create an index column
dt07 = np.arange(0,data07.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt07:
    df07.iloc[time_index] = pres07[time_index,min_index_lat07,min_index_lon07] # presMay should be the sradMay

df07.to_csv('Lrad07_YK.csv')

#################################################################################################

data08 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201608.nc','r')

lat08 = data08.variables['lat'][:]
lon08 = data08.variables['lon'][:]

# Calculate the difference between study point and each data point
sq_diff_lat08 = (lat08 - lat_yanchi)**2
sq_diff_lon08 = (lon08 - lon_yanchi)**2

min_index_lat08 = sq_diff_lat08.argmin()
min_index_lon08 = sq_diff_lon08.argmin()

pres08 = data08.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test08 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-08-01 00:00', '2016-08-31 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df08 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test08)
# Create an index column
dt08 = np.arange(0,data08.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt08:
    df08.iloc[time_index] = pres08[time_index,min_index_lat08,min_index_lon08] # presMay should be the sradMay

df08.to_csv('Lrad08_YK.csv')

#################################################################################################

data09 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201609.nc','r')

lat09 = data09.variables['lat'][:]
lon09 = data09.variables['lon'][:]

# Calculate the difference between study point and each data point
sq_diff_lat09 = (lat09 - lat_yanchi)**2
sq_diff_lon09 = (lon09 - lon_yanchi)**2

min_index_lat09 = sq_diff_lat09.argmin()
min_index_lon09 = sq_diff_lon09.argmin()

pres09 = data09.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test09 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-09-01 00:00', '2016-09-30 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df09 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test09)
# Create an index column
dt09 = np.arange(0,data09.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt09:
    df09.iloc[time_index] = pres09[time_index,min_index_lat09,min_index_lon09] # presMay should be the sradMay

df09.to_csv('Lrad09_YK.csv')


#################################################################################################

data10 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201610.nc','r')

lat10 = data10.variables['lat'][:]
lon10 = data10.variables['lon'][:]

# Calculate the difference between study point and each data point
sq_diff_lat10 = (lat10 - lat_yanchi)**2
sq_diff_lon10 = (lon10 - lon_yanchi)**2

min_index_lat10 = sq_diff_lat10.argmin()
min_index_lon10 = sq_diff_lon10.argmin()

pres10 = data10.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test10 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-10-01 00:00', '2016-10-31 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df10 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test10)
# Create an index column
dt10 = np.arange(0,data10.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt10:
    df10.iloc[time_index] = pres10[time_index,min_index_lat10,min_index_lon10] # presMay should be the sradMay

df10.to_csv('Lrad10_YK.csv')

#################################################################################################

data11 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201611.nc','r')

lat11 = data11.variables['lat'][:]
lon11 = data11.variables['lon'][:]

# Calculate the difference between study point and each data point
sq_diff_lat11 = (lat11 - lat_yanchi)**2
sq_diff_lon11 = (lon11 - lon_yanchi)**2

min_index_lat11 = sq_diff_lat11.argmin()
min_index_lon11 = sq_diff_lon11.argmin()

pres11 = data11.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test11 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-11-01 00:00', '2016-11-30 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df11 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test11)
# Create an index column
dt11 = np.arange(0,data11.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt11:
    df11.iloc[time_index] = pres11[time_index,min_index_lat11,min_index_lon11] # presMay should be the sradMay

df11.to_csv('Lrad11_YK.csv')

#################################################################################################

data12 = Dataset(r'D:\YK_Dataset\Data_forcing_03hr_010deg\LRad\2016\lrad_CMFD_V0106_B-01_03hr_010deg_201612.nc','r')

lat12 = data12.variables['lat'][:]
lon12 = data12.variables['lon'][:]

# Calculate the difference between study point and each data point
sq_diff_lat12 = (lat12 - lat_yanchi)**2
sq_diff_lon12 = (lon12 - lon_yanchi)**2

min_index_lat12 = sq_diff_lat12.argmin()
min_index_lon12 = sq_diff_lon12.argmin()

pres12 = data12.variables['lrad']  #presMay should be the sradMay

# Create a column of dates' format to prepare for filling data
test12 = (pd.DataFrame(columns=['lrad'],
                  index=pd.date_range('2016-12-01 00:00', '2016-12-31 21:00',
                                      freq='180T'))
        .between_time('00:00','21:00')
        .index.strftime('%Y-%m-%d %H:%M')
        .tolist()
)

# Make a two columns dataframe
df12 = pd.DataFrame(0,columns = ['Lrad_YK'],index = test12)
# Create an index column
dt12 = np.arange(0,data12.variables['time'].size)

# Extract the data in the study point to the two columns df
for time_index in dt12:
    df12.iloc[time_index] = pres12[time_index,min_index_lat12,min_index_lon12] # presMay should be the sradMay

df12.to_csv('Lrad12_YK.csv')
# starting_date = '2016-5-1 ' + data.variables['time'].units[23:28]
# ending_date = '2016-5-31 ' + data.variables['time'].units[23:28]  
# date_range = pd.date_range(start = starting_date, end = ending_date)
# df = pd.DataFrame(0,columns = ['Air pressure'], index = date_range)