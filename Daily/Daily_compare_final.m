%% Import SWC and then copy to Daily_.xlsx
clear all; clc;
Sim_sm_16=readtable('Sim_Theta_shrub_2016.csv');
Sim_sm_19 = readtable('Sim_Theta_shrub_2019.csv');
Sim_sm_16_g=readtable('Sim_Theta_grass_2016.csv');
Sim_sm_19_g = readtable('Sim_Theta_grass_2019.csv');

Sim_sm(:,1)=Sim_sm_16(:,6);
Sim_sm(:,2)=Sim_sm_19(:,6);
Sim_sm(:,3)=Sim_sm_16_g(:,6);
Sim_sm(:,4)=Sim_sm_19_g(:,6);

% writetable(Sim_sm, 'Sim_sm_10cm.xlsx');


%% Read files
output_dir = 'D:\2018_Mixture';
df = readtable('Daily_5_9_final.xlsx','Sheet','2019');
times = [122:1/48:274.999];
df.DoY = repelem([121:273],48)';
Obs = readtable('2019_5_9_Observe.xlsx');
Obs.DoY = repelem([121:273],48)';

% Rn_obs = groupsummary(df,'DoY','mean',{'Rn'});
% LE_obs = groupsummary(df,'DoY','mean',{'LE'});
% H_obs = groupsummary(df,'DoY','mean',{'H'});
% G_obs = groupsummary(df,'DoY','mean',{'G'});
% GPP_obs = groupsummary(df,'DoY','mean',{'GPP'});
% ET_obs = groupsummary(Obs,'DoY','sum',{'ET'});
% SM_obs = groupsummary(df,'DoY','mean',{'SM'});
% Ts_obs = groupsummary(df,'DoY','mean',{'Ts'});
Obs_rain = groupsummary(Obs,'DoY','sum',{'Rainfall'});
GPP_obs = groupsummary(Obs,'DoY','mean',{'GPP'});
ET_obs = groupsummary(Obs,'DoY','sum',{'ET'});
Rn_obs = groupsummary(Obs,'DoY','mean',{'Rn'});

Rn_grass = groupsummary(df,'DoY','mean',{'Rn_grass'});
Rn_shrub = groupsummary(df,'DoY','mean',{'Rn_mix'});
Rn_shrub_sum = sum(df{:,27})

LE_grass = groupsummary(df,'DoY','mean',{'LE_grass'});
LE_shrub = groupsummary(df,'DoY','mean',{'LE_mix'});

H_grass = groupsummary(df,'DoY','mean',{'H_grass'});
H_shrub = groupsummary(df,'DoY','mean',{'H_mix'});

G_grass = groupsummary(df,'DoY','mean',{'G_grass'});
G_shrub = groupsummary(df,'DoY','mean',{'G_mix'});

GPP_grass = groupsummary(df,'DoY','mean',{'Actot_grass'});
% GPP_grass = table2array(GPP_grass);
GPP_grass{:,3} = GPP_grass{:,3}.*12/1000000*86400; %change the unit to g C d-1
GPP_shrub = groupsummary(df,'DoY','mean',{'Actot_mix'});
GPP_shrub{:,3} = GPP_shrub{:,3}.*12/1000000*86400;


Evap_grass = groupsummary(df,'DoY','sum',{'Evap_grass'});
Evap_shrub = groupsummary(df,'DoY','sum',{'Evap_mix'});

Trap_grass = groupsummary(df,'DoY','sum',{'Trap_grass'});
Trap_shrub = groupsummary(df,'DoY','sum',{'Trap_mix'});

ET_grass(:,3) = Evap_grass{:,3} + Trap_grass{:,3};
ET_shrub = Evap_shrub{:,3} + Trap_shrub{:,3};
ET_diff_times = (sum(ET_shrub) - sum(ET_grass(:,3)))/sum(ET_grass(:,3))

SM_grass = groupsummary(df,'DoY','mean',{'SM_grass'});
SM_shrub = groupsummary(df,'DoY','mean',{'SM_shrub'});
SM100_grass = groupsummary(df,'DoY','mean',{'SM100_grass'});
SM100_shrub = groupsummary(df,'DoY','mean',{'SM100_shrub'});

d1 = datetime('05/01/2016','InputFormat','MM/dd/uuuu');
d2 = datetime('09/30/2016','InputFormat','MM/dd/uuuu');
d3 = datetime('10/01/2016','InputFormat','MM/dd/uuuu');
days = d1:1:d2; % Creates your x-axis, 90 dates from Jan 1st to March 30
days = days';
%% Statistic analysis in annual variations
df9 = readtable('Daily_5_9_final.xlsx','Sheet','2019');
times = [122:1/48:274.999];
df9.DoY = repelem([121:273],48)';
Obs9 = readtable('2019_5_9_Observe.xlsx');
Obs9.DoY = repelem([121:273],48)';
ET_obs9 = groupsummary(Obs9,'DoY','sum',{'ET'});
ET_obs_diff = sum(ET_obs9{:,3}) - sum(ET_obs{:,3})

SM_grass9 = groupsummary(df9,'DoY','mean',{'SM_grass'});
SM_shrub9 = groupsummary(df9,'DoY','mean',{'SM_shrub'});
SM100_grass9 = groupsummary(df9,'DoY','mean',{'SM100_grass'});
SM100_shrub9 = groupsummary(df9,'DoY','mean',{'SM100_shrub'});
Evap_grass9 = groupsummary(df9,'DoY','sum',{'Evap_grass'});
Evap_shrub9 = groupsummary(df9,'DoY','sum',{'Evap_mix'});
Trap_grass9 = groupsummary(df9,'DoY','sum',{'Trap_grass'});
Trap_shrub9 = groupsummary(df9,'DoY','sum',{'Trap_mix'});
ET_grass9(:,3) = Evap_grass9{:,3} + Trap_grass9{:,3};
ET_shrub9 = Evap_shrub9{:,3} + Trap_shrub9{:,3};

GPP_grass9 = groupsummary(df9,'DoY','mean',{'Actot_grass'});
GPP_grass9{:,3} = GPP_grass9{:,3}.*12/1000000*86400; %change the unit to g C d-1
GPP_shrub9 = groupsummary(df9,'DoY','mean',{'Actot_mix'});
GPP_shrub9{:,3} = GPP_shrub9{:,3}.*12/1000000*86400;


%% Statistic analysis in Daily variation result
Rain_sum = sum(Obs_rain{:,3})
SM_avg_grass = mean(SM_grass{:,3})
SM_avg_shrub = mean(SM_shrub{:,3})
SM_grass_std = std(SM_grass{:,3})
SM_shrub_std = std(SM_shrub{:,3})
SM100_avg_grass = mean(SM100_grass{:,3})
SM100_avg_shrub = mean(SM100_shrub{:,3})
SM100_grass_std = std(SM100_grass{:,3})
SM100_shrub_std = std(SM100_shrub{:,3})

diff_SM = mean(SM_grass{:,3}-SM_shrub{:,3})
std_diff_SM = std(SM_grass{:,3}-SM_shrub{:,3})
diff_SM100 = mean(SM100_grass{:,3}-SM100_shrub{:,3})
std_diff_100SM = std(SM100_grass{:,3}-SM100_shrub{:,3})


Evap_avg_grass = sum(Evap_grass{:,3})
Evap_avg_grass9 = sum(Evap_grass9{:,3})
Evap_avg_shrub = sum(Evap_shrub{:,3})
Evap_avg_shrub9 = sum(Evap_shrub9{:,3})
Evap_std_grass = std(Evap_grass{:,3})*153
Evap_std_shrub = std(Evap_shrub{:,3})*153
Evap_std_grass9 = std(Evap_grass9{:,3})*153
Evap_std_shrub9 = std(Evap_shrub9{:,3})*153
diff_Evap = (Evap_avg_shrub-Evap_avg_grass)
std_diff_Evap = std((Evap_shrub{:,3}-Evap_grass{:,3}))*153
diff_Evap_times = (Evap_avg_shrub - Evap_avg_grass)/Evap_avg_grass

diff_Evap9 = (Evap_avg_shrub9-Evap_avg_grass9)
std_diff_Evap9 = std((Evap_shrub9{:,3}-Evap_grass9{:,3}))*153
diff_Evap_times9 = (Evap_avg_shrub9 - Evap_avg_grass9)/Evap_avg_grass9


diff_grass_Evap = Evap_avg_grass9 - Evap_avg_grass
diff_grass_Evap_times = diff_grass_Evap/Evap_avg_grass
diff_shrub_Evap = Evap_avg_shrub9 - Evap_avg_shrub
diff_shrub_Evap_times = diff_shrub_Evap/Evap_avg_shrub


Trap_avg_grass = sum(Trap_grass{:,3})
Trap_avg_grass9 = sum(Trap_grass9{:,3})
Trap_avg_shrub = sum(Trap_shrub{:,3})
Trap_avg_shrub9 = sum(Trap_shrub9{:,3})
Trap_std_grass = std(Trap_grass{:,3})*153
Trap_std_shrub = std(Trap_shrub{:,3})*153
Trap_std_grass9 = std(Trap_grass9{:,3})*153
Trap_std_shrub9 = std(Trap_shrub9{:,3})*153

diff_Trap = (Trap_avg_shrub - Trap_avg_grass)
std_diff_Trap = std(Trap_shrub{:,3}-Trap_grass{:,3})*153
diff_Trap_times = (Trap_avg_shrub - Trap_avg_grass)/Trap_avg_grass
diff_Trap9 = (Trap_avg_shrub9 - Trap_avg_grass9)
std_diff_Trap9 = std(Trap_shrub9{:,3}-Trap_grass9{:,3})*153
diff_Trap_times9 = (Trap_avg_shrub9 - Trap_avg_grass9)/Trap_avg_grass9

% Between two years
diff_grass_Trap = Trap_avg_grass9 - Trap_avg_grass
diff_grass_Trap_times = diff_grass_Trap/Trap_avg_grass
diff_shrub_Trap = Trap_avg_shrub9 - Trap_avg_shrub
diff_shrub_Trap_times = diff_shrub_Trap/Trap_avg_shrub


ET_avg_grass = sum(ET_grass(:,3))
ET_avg_shrub = sum(ET_shrub(:))
ET_std_grass = std(ET_grass(:,3))*153
ET_std_shrub = std(ET_shrub(:))*153
diff_ET = (ET_avg_shrub - ET_avg_grass)
std_diff_ET = std(ET_shrub(:)-ET_grass(:,3))*153
diff_ET_times = (ET_avg_shrub - ET_avg_grass)/ET_avg_grass

ET_avg_grass9 = sum(ET_grass9(:,3))
ET_avg_shrub9 = sum(ET_shrub9(:))
ET_std_grass9 = std(ET_grass9(:,3))*153
ET_std_shrub9 = std(ET_shrub9(:))*153
diff_ET9 = (ET_avg_shrub9 - ET_avg_grass9)
std_diff_ET9 = std(ET_shrub9(:)-ET_grass9(:,3))*153
diff_ET_times9 = (ET_avg_shrub9 - ET_avg_grass9)/ET_avg_grass9

% E and T fraction
Trap_fraction_shrub = Trap_avg_shrub/ET_avg_shrub
Trap_fraction_grass = Trap_avg_grass/ET_avg_grass
Evap_fraction_grass = 1 - Trap_fraction_grass


GPP_avg_grass = sum(GPP_grass{:,3})
GPP_avg_shrub = sum(GPP_shrub{:,3})
GPP_std_grass = std(GPP_grass{:,3})*153
GPP_std_shrub = std(GPP_shrub{:,3})*153
diff_GPP = (GPP_avg_shrub - GPP_avg_grass)
std_diff_GPP = std(GPP_shrub{:,3}-GPP_grass{:,3})*153
diff_GPP_times = (GPP_avg_shrub - GPP_avg_grass)/GPP_avg_grass

GPP_avg_grass9 = sum(GPP_grass9{:,3})
GPP_avg_shrub9 = sum(GPP_shrub9{:,3})
GPP_std_grass9 = std(GPP_grass9{:,3})*153
GPP_std_shrub9 = std(GPP_shrub9{:,3})*153
diff_GPP9 = (GPP_avg_shrub9 - GPP_avg_grass9)
std_diff_GPP9 = std(GPP_shrub9{:,3}-GPP_grass9{:,3})*153
diff_GPP_times9 = (GPP_avg_shrub9 - GPP_avg_grass9)/GPP_avg_grass9

% Between two years
diff_grass_GPP = GPP_avg_grass9 - GPP_avg_grass
diff_grass_GPP_times = diff_grass_GPP/GPP_avg_grass
diff_shrub_GPP = GPP_avg_shrub9 - GPP_avg_shrub
diff_shrub_GPP_times = diff_shrub_GPP/GPP_avg_shrub
%% Plot rainfall and ET
% Cumulative rainfall
Cum_rain = cumsum(Obs_rain{:,3});
Cum_ET_obs = cumsum(ET_obs{:,3});
Cum_ET_shrub = cumsum(Evap_shrub{:,3} + Trap_shrub{:,3});
Cum_ET_grass = cumsum(Evap_grass{:,3} + Trap_grass{:,3});
ET_shrub_rain = (Cum_ET_shrub(end,:)-Cum_rain(end,:))/Cum_rain(end,:)
ET_shrub_over = (Cum_ET_shrub(end,:)-Cum_ET_obs(end,:))/Cum_ET_obs(end,:)

f10 = figure (10)
plot(Obs_rain{:,1},Cum_rain(:,1),'-o','LineWidth',1,'MarkerSize',3,...
    'MarkerFaceColor','#D95319',...
    'Color','#D95319');
axis([120 280 0 350])
xlabel('DoY')
ylabel('Cumulative ET (mm)');
hold on;
yyaxis right
plot(Obs_rain{:,1},Cum_ET_shrub(:,1) ,'k');
axis([120 280 0 350])
ylabel('Cumulative precipitation (mm)');
hold on;
plot(Obs_rain{:,1},Cum_ET_grass(:,1),'LineStyle','-','Color','#0072BD');
axis([120 280 0 350])
hold on;
plot(Obs_rain{:,1},Cum_ET_obs(:,1),'-o','LineWidth',1,'MarkerSize',3,...
    'MarkerFaceColor','k',...
    'Color','k');
axis([120 280 0 350])
legend('Precipitation','ET\_Mix (Sim)','ET\_Grass (Sim)','ET\_Mix (Obs)','Location','northwest');
legend boxoff  
ax = gca;
% ax.YAxis(1).Color = 'k';
% ax.YAxis(2).Color = 'k';
set(f10,'Position',[100 100 750 500]);
set(gca,'FontSize',16);
% 
max_dif_shrub = max(Cum_rain-Cum_ET_shrub)*0.001;
soil_depth_shrub = abs(max_dif_shrub)/0.15
diff_final_shrub = Cum_rain(end,:) - Cum_ET_shrub(end, :)
diff_final_grass = Cum_rain(end,:) - Cum_ET_grass(end, :)


max_dif_grass = max(Cum_rain-Cum_ET_grass)*0.001;
soil_depth_grass = abs(max_dif_grass)/0.15


%% Daily validation 

% mdl_GPP = fitlm(GPP_obs{:,3}, GPP_shrub{:,3})
% plot(GPP_obs{:,1},GPP_obs{:,3});
% hold on;
% plot(GPP_shrub{:,1},GPP_shrub{:,3});
% legend('GPP\_obs','GPP\_mix');
% 
% mdl_ET = fitlm(ET_obs{:,3}, ET_shrub(:,1))
% plot(ET_obs{:,1},ET_obs{:,3});
% hold on;
% plot(ET_obs{:,1},ET_shrub(:,1));
% legend('ET\_obs','ET\_mix');


%% Plot SM_10 cm
f1 = figure (1);
yyaxis left
plot(Obs_rain{:,1},SM_shrub{:,3},'k'); 
hold on;
plot(Obs_rain{:,1},SM_grass{:,3},'LineStyle','-');
%title(sprintf('%s', index));
xlabel('DoY');
% datetick('x','mmm')
% xlim([d1 d3])
ylim([0 0.15])
yticks(0:0.025:0.15)
% xticks(120:5:245)
set(gca, 'TickDir', 'out') 
hold on;
yyaxis right
bar(Obs_rain{:,1},Obs_rain{:,3});
% set(gca, 'YDir','reverse')
yyaxis left
ylabel('Soil water content (m^3 m^{-3})');
yyaxis right
ylabel('Rainfall (mm d^{-1})');
% datetick('x','mmm')
xlim([120 280])
ylim([0 55])
yticks(0:10:55)
xticks(120:20:280)
legend('SWC\_Shrub (10 cm)','SWC\_Grass (10 cm)','Rainfall','Location','northwest');
%legend('Simulated SM (10 cm)','Measured SM (10 cm)','Rainfall','Position',[0.75 0.8 0.15 0.0869]);
legend boxoff  
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
set(f1,'Position',[100 100 750 500]);
set(gca,'FontSize',16);
% saveas(f1,[output_dir '\Daily_compare\SM_10cm.png']);

f9 = figure (9);
yyaxis left
plot(SM100_shrub{:,1},SM100_shrub{:,3},'k'); 
hold on;
plot(SM100_grass{:,1},SM100_grass{:,3},'LineStyle','-');
%title(sprintf('%s', index));
xlabel('DoY');
% datetick('x','mmm')
xlim([120 280])
ylim([0 0.15])
yticks(0:0.025:0.15)
% xticks(120:5:245)
set(gca, 'TickDir', 'out') 
hold on;
yyaxis right
bar(Obs_rain{:,1},Obs_rain{:,3});
% set(gca, 'YDir','reverse')
yyaxis left
ylabel('Soil water content (m^3 m^{-3})');
yyaxis right
ylabel('Rainfall (mm d^{-1})');
% datetick('x','mmm')
% xlim([d1 d3])
ylim([0 55])
yticks(0:10:55)
legend('SWC\_Shrub (100 cm)','SWC\_Grass (100 cm)','Rainfall','Location','northwest');
%legend('Simulated SM (10 cm)','Measured SM (10 cm)','Rainfall','Position',[0.75 0.8 0.15 0.0869]);
legend boxoff  
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
set(f9,'Position',[100 100 750 500]);
set(gca,'FontSize',16);
%% Plot LE
% f2 = figure (2);
% plot(days(:,1),LE_shrub{:,3},'k'); 
% hold on;
% plot(days(:,1),LE_grass{:,3},'LineStyle','-');
% xlabel('Month');
% ylabel('LE (W m^{-2})');
% datetick('x','mmm')
% xlim([d1 d3])
% ylim([0 150])
% set(gca, 'TickDir', 'out') 
% % set(gca,'box','off') % the tick mark and border disappear togther
% legend('LE\_Mix','LE\_Grass','Location','northwest');
% legend boxoff  
% set(f2,'Position',[100 100 750 500]);
% set(gca,'FontSize',16);

%% Plot ET
% f3 = figure (3);
% plot(days(:,1),Evap_shrub{:,3} + Trap_shrub{:,3},'k'); 
% hold on;
% plot(days(:,1),Evap_grass{:,3} + Trap_grass{:,3},'LineStyle','-');
% xlabel('Month');
% ylabel('ET (mm d^{-1})');
% datetick('x','mmm')
% xlim([d1 d3])
% ylim([0 5])
% set(gca, 'TickDir', 'out') 
% % set(gca,'box','off') % the tick mark and border disappear togther
% legend('ET\_Mix','ET\_Grass','Location','northwest');
% legend boxoff  
% set(f3,'Position',[100 100 750 500]);
% set(gca,'FontSize',16);

%% Plot H
% f4 = figure (4);
% plot(days(:,1),H_shrub{:,3},'k'); 
% hold on;
% plot(days(:,1),H_grass{:,3},'LineStyle','-');
% xlabel('Month');
% ylabel('H (W m^{-2})');
% datetick('x','mmm')
% xlim([d1 d3])
% ylim([-25 120])
% set(gca, 'TickDir', 'out') 
% % set(gca,'box','off') % the tick mark and border disappear togther
% legend('H\_Mix','H\_Grass','Location','northwest');
% legend boxoff  
% set(f4,'Position',[100 100 750 500]);
% set(gca,'FontSize',16);

%% 
% Plot Rn and G (G is similar)
% Plot Evap
f5 = figure (5);
plot(Obs_rain{:,1},Evap_shrub{:,3},'k'); 
hold on;
plot(Obs_rain{:,1},Evap_grass{:,3},'LineStyle','-');
xlabel('DoY');
ylabel('Evaporation (mm d^{-1})');
% datetick('x','mmm')
% xlim([d1 d3])
ylim([0 4.5])
set(gca, 'TickDir', 'out') 
% set(gca,'box','off') % the tick mark and border disappear togther
legend('Evap\_Mix','Evap\_Grass','Location','northwest');
legend boxoff 
set(f5,'Position',[100 100 750 500]);
set(gca,'FontSize',16);

% Plot Trap
f6 = figure (6);
plot(Obs_rain{:,1},Trap_shrub{:,3},'k'); 
hold on;
plot(Obs_rain{:,1},Trap_grass{:,3},'LineStyle','-');
xlabel('DoY');
ylabel('Transpiration (mm d^{-1})');
% datetick('x','mmm')
% xlim([d1 d3])
ylim([ 0 3.5])
set(gca, 'TickDir', 'out') 
% set(gca,'box','off') % the tick mark and border disappear togther
legend('Trap\_Mix','Trap\_Grass','Location','northwest');
legend boxoff  
set(f6,'Position',[100 100 750 500]);
set(gca,'FontSize',16);


%% Plot Ac
f7 = figure (7);
yyaxis left
plot(Obs_rain{:,1}, GPP_shrub{:,3},'k','LineWidth',1); 
hold on;
plot(Obs_rain{:,1},GPP_grass{:,3},'LineStyle','-','LineWidth',1);
xlabel('DoY');
% axis([120 280 0 7])
% xticks(120:20:280)
% datetick('x','mmm')
% xlim([d1 d3])
ylim([0 7])
set(gca, 'TickDir', 'out') 
hold on;
yyaxis right
bar(Obs_rain{:,1},Obs_rain{:,3});
set(gca, 'YDir','reverse')
yyaxis left
ylabel('GPP (g C m^{-2} d^{-1})');
yyaxis right
ylabel('Rainfall (mm d^{-1})');
% datetick('x','mmm')
% xlim([d1 d3])
ylim([0 55])
yticks(0:10:55)
% legend('GPP\_Mix','GPP\_Grass','Rainfall','Location','northwest');
legend('GPP\_Mix','GPP\_Grass','Rainfall','Position',[0.18 0.6 0.15 0.0869]);
legend boxoff  
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
set(f7,'Position',[100 100 750 500]);
set(gca,'FontSize',16);

%%  Plot G (Two senario is very similar)
% % Plot Rn, the mix senario large than the grass, but not meaningful by
% % daily comparision, better to see the difference in duirual variation
f8 = figure (8);
plot(Rn_shrub{:,1},Rn_shrub{:,3},'k'); 
hold on;
plot(Rn_grass{:,1},Rn_grass{:,3},'LineStyle','-');
hold on;
plot(Rn_obs{:,1},Rn_obs{:,3},'red','LineStyle','--');
xlabel('DoY');
ylabel('Rn (W m^{-2})');
ylim([-10 180])
set(gca, 'TickDir', 'out') 
% set(gca,'box','off') % the tick mark and border disappear togther
legend('Rn\_Mix','Rn\_Grass','Rn\_Obs','Location','northwest');
legend boxoff  
set(f8,'Position',[100 100 750 500]);
set(gca,'FontSize',16);
