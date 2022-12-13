%% Read files
df = readtable('Daily_5_9_final.xlsx','Sheet','all');
Rn_grass_avg = mean(df{:,28},'omitnan');
Rn_mix_avg = mean(df{:,27},'omitnan');
Rn_var = (Rn_mix_avg - Rn_grass_avg)./Rn_grass_avg

LE_grass_avg = mean(df{:,22},'omitnan');
LE_mix_avg = mean(df{:,21},'omitnan');
LE_var = (LE_mix_avg - LE_grass_avg)/LE_grass_avg

H_grass_avg = mean(df{:,24},'omitnan');
H_mix_avg = mean(df{:,23},'omitnan');
H_var = (H_mix_avg - H_grass_avg)/H_grass_avg

G_grass_avg = mean(df{:,26},'omitnan');
G_mix_avg = mean(df{:,25},'omitnan');
G_var = (G_mix_avg - G_grass_avg)/G_grass_avg

GPP_grass_avg = mean(df{:,30},'omitnan');
GPP_mix_avg = mean(df{:,29},'omitnan');
GPP_var = (GPP_mix_avg - GPP_grass_avg)/GPP_grass_avg

E_grass_avg = mean(df{:,34},'omitnan');
E_mix_avg = mean(df{:,33},'omitnan');
E_var = (E_mix_avg - E_grass_avg)/E_grass_avg

T_grass_avg = mean(df{:,32},'omitnan');
T_mix_avg = mean(df{:,31},'omitnan');
T_var = (T_mix_avg - T_grass_avg)/T_grass_avg
