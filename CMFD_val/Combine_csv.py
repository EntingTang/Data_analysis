import os
import pandas as pd
from datetime import datetime

# 这段代码实现了：
# 1. 合并多个csv
# 2. 让合并后的日期按正常顺序排列
# 3. 去掉重复的数据行

# 结果的列是错开列数的，手动合并成了一列

# Combine csv files with wrong time format (if correct, follow the youtube)
master_df = pd.DataFrame()

for file in os.listdir(os.getcwd()):
    if file.endswith('.csv'):
        master_df = master_df.append(pd.read_csv(file))

# Change the column name into "date" and make it in Date format in python        
df_combined = master_df.rename(columns={'Unnamed: 0': 'Date'})
df_combined["Date"] = pd.to_datetime(df_combined["Date"])
print(df_combined.dtypes)

# Make the date in ascending order and drop the duplicated rows
df_combined.sort_values(by='Date', inplace=True)
df_pres_2018 = df_combined.drop_duplicates()
df_pres_2018.to_csv('Lrad_YK_2016.csv', index=False)


