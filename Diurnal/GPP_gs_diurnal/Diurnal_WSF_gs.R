# This code is writing to create diurnal analysis for averaging the year 2016 and 2019

library(dplyr)  # for subsetting by season
library(lubridate) # for working with dates
library(ggplot2)  # for creating graphs
library(readxl)
library(writexl)
# install.packages("ggpubr")
library("ggpubr")

# read raw data
t <- read_excel(
  "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/GPP/SA85/sfactot_gs_final.xlsx")
class(t)
str(t)
t$Date=as.POSIXct(t$Date,format="%m/%d/%Y %H:%M") #convert into POSIXct format

t <- t %>% mutate(
  month = format(strptime(Date, "%Y-%m-%d %H:%M:%S"), "%b"),
  hour=format(strptime(Date, "%Y-%m-%d %H:%M:%S"), "%H"))
neworder <- c("May","Jun","Jul","Aug","Sep")



# Plot the observed GPP 
GPP_df <- read_excel(
  "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/GPP/SA85/16_19_GPP_obs.xlsx")
GPP_df$Date = as.POSIXct(GPP_df$Date,format="%m/%d/%Y %H:%M") #convert into POSIXct format
GPP_df <- GPP_df %>% mutate(
  month = format(strptime(Date, "%Y-%m-%d %H:%M:%S"), "%b"),
  hour=format(strptime(Date, "%Y-%m-%d %H:%M:%S"), "%H"))
GPP_obs <- GPP_df %>% group_by(month, hour) %>% 
  summarize(GPP_obs_mean=mean(Actot_obs, na.rm=T))
GPP_obs$hour=as.numeric(GPP_obs$hour) #convert into number format
GPP_obs$month <- factor(GPP_obs$month,      # Reordering group factor levels
                        levels = neworder)


GPP_mix <- GPP_df %>% group_by(month, hour) %>% 
  summarize(GPP_mix_mean=mean(Actot_mix, na.rm=T))
GPP_grass <- GPP_df %>% group_by(month, hour) %>% 
  summarize(GPP_grass_mean=mean(Actot_grass, na.rm=T))

GPP_mix$hour=as.numeric(GPP_mix$hour) #convert into number format
GPP_grass$hour=as.numeric(GPP_grass$hour) #convert into number format


GPP_mix$month <- factor(GPP_mix$month,      # Reordering group factor levels
                        levels = neworder)
GPP_grass$month <- factor(GPP_grass$month,      # Reordering group factor levels
                          levels = neworder)


GPP_diff <- GPP_mix$month
GPP_diff <- as.data.frame(GPP_diff)
GPP_diff$hour <- GPP_mix$hour
GPP_diff$diff <- GPP_mix$GPP_mix_mean-GPP_grass$GPP_grass_mean
write_xlsx(GPP_mix,"C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/GPP/SA85/Diurnal_GPP_mix.xlsx")



GPP <- ggplot()+
  geom_line(data = GPP_mix, aes(hour,GPP_mix_mean, colour = "GPP_mix"))+
  geom_line(data = GPP_grass, aes(hour,GPP_grass_mean, colour = "GPP_grass"))+
  #geom_line(data = GPP_obs, aes(hour,GPP_obs_mean, colour = "GPP_obs"))+
  #scale_color_manual(name=" ",values=c("blue", "black","red"))+
  scale_color_manual(name=" ",values=c("blue", "black"))+
  labs(y=expression(bold(GPP~(umol~m^{-2}~s^{-1}))))+
  theme_bw()+
  xlab("\nTime of day (hour, LST = GMT + 8)") +
  # ylim(-150,200)+
  # scale_x_time(breaks=seq(0,24,6), labels=c("0","6","12","18","24"))+
  theme(axis.text=element_text(size=20),
        axis.title=element_text(size=20,face="bold"))+
  # theme(axis.title.x=element_blank())+ # remove the xlable("hour")
  theme(legend.text=element_text(size=18))+
  theme(strip.text.x = element_text(size = 20))+ # adjust the size of title (May etc)
  theme(
    legend.position = c(0, 1.05),
    legend.justification = c(0, 1),
    legend.background = element_rect(fill = NA))+
  facet_wrap(~ month, ncol = 5)
GPP

ggsave("GPP_no_obs.png", GPP, width = 20, height = 4, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/GPP/SA85")


# Plot WSF
WSF_mix <- t %>% group_by(month, hour) %>% 
  summarize(WSF_mix_mean=mean(WSF_shrub, na.rm=T))
WSF_grass <- t %>% group_by(month, hour) %>% 
  summarize(WSF_grass_mean=mean(WSF_grass, na.rm=T))

WSF_mix$hour=as.numeric(WSF_mix$hour) #convert into POSIXct format
WSF_grass$hour=as.numeric(WSF_grass$hour) #convert into POSIXct format


WSF_mix$month <- factor(WSF_mix$month,      # Reordering group factor levels
                       levels = neworder)
WSF_grass$month <- factor(WSF_grass$month,      # Reordering group factor levels
                         levels = neworder)
WSF <- ggplot()+
  geom_line(data = WSF_mix, aes(hour,WSF_mix_mean, colour = "WSF_shrub"))+
  geom_line(data = WSF_grass, aes(hour,WSF_grass_mean, colour = "WSF_grass"))+
  scale_color_manual(name=" ",values=c("blue", "black"))+
  labs(y=expression(bold(WSF)))+
  theme_bw()+
  xlab("\nTime of day (hour, LST = GMT + 8)") +
  # ylim(-150,200)+
  # scale_x_time(breaks=seq(0,24,6), labels=c("0","6","12","18","24"))+
  theme(axis.text=element_text(size=20),
        axis.title=element_text(size=20,face="bold"))+
  # theme(axis.title.x=element_blank())+ # remove the xlable("hour")
  theme(legend.text=element_text(size=18))+
  theme(strip.text.x = element_text(size = 20))+ # adjust the size of title (May etc)
  theme(
    legend.position = c(0, 0.35),
    legend.justification = c(0, 1),
    legend.background = element_rect(fill = NA))+
  facet_wrap(~ month, ncol = 5)
WSF

ggsave("WSF.png", WSF, width = 20, height = 4, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/GPP")


# Plot gs
gs_mix <- t %>% group_by(month, hour) %>% 
  summarize(gs_mix_mean=mean(gs_shrub, na.rm=T))
gs_grass <- t %>% group_by(month, hour) %>% 
  summarize(gs_grass_mean=mean(gs_grass, na.rm=T))

gs_mix$hour=as.numeric(gs_mix$hour) #convert into POSIXct format
gs_grass$hour=as.numeric(gs_grass$hour) #convert into POSIXct format


gs_mix$month <- factor(gs_mix$month,      # Reordering group factor levels
                      levels = neworder)
gs_grass$month <- factor(gs_grass$month,      # Reordering group factor levels
                        levels = neworder)
gs <- ggplot()+
  geom_line(data = gs_mix, aes(hour,gs_mix_mean, colour = "gs_shrub"))+
  geom_line(data = gs_grass, aes(hour,gs_grass_mean, colour = "gs_grass"))+
  scale_color_manual(name=" ",values=c("blue", "black"))+
  labs(y=expression(bold(gs~(umol~m^{-2}~s^{-1}))))+
  theme_bw()+
  xlab("\nTime of day (hour, LST = GMT + 8)") +
  # ylim(-150,200)+
  # scale_x_time(breaks=seq(0,24,6), labels=c("0","6","12","18","24"))+
  theme(axis.text=element_text(size=20),
        axis.title=element_text(size=20,face="bold"))+
  # theme(axis.title.x=element_blank())+ # remove the xlable("hour")
  theme(legend.text=element_text(size=18))+
  theme(strip.text.x = element_text(size = 20))+ # adjust the size of title (May etc)
  theme(
    legend.position = c(0, 1.05),
    legend.justification = c(0, 1),
    legend.background = element_rect(fill = NA))+
  facet_wrap(~ month, ncol = 5)
gs

ggsave("gs.png", gs, width = 20, height = 4, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/GPP/SA85")


