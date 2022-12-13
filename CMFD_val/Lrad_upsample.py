
from pandas import datetime
from pandas import read_csv
from matplotlib import pyplot




def parser(x):
    return datetime.strptime(''+x[0:16], '%Y-%m-%d %H:%M')

series = read_csv('Lrad_YK_2016.csv', header=0, parse_dates=[0], index_col=0, squeeze=True, date_parser=parser)
print(series.head())
series.plot()
pyplot.show()

hh_upsampled = series.resample('0.5H')
hh_interpolated = hh_upsampled.interpolate(method='linear')
# print(hh_upsampled.head(12))
print(hh_interpolated.head())
hh_interpolated.plot()
pyplot.show()

hh_interpolated.to_excel('Lrad_YK_2016_interpolated.xlsx')

# # 提取5月到7月的下行长波辐射
# df_lrad = read_csv('lrad_yanchi_5to8_interpolated.csv', header=0)
# lrad_MaytoJuly = df_lrad.iloc[0:4416]

# lrad_MaytoJuly.to_csv('lrad_MaytoJuly.csv')



