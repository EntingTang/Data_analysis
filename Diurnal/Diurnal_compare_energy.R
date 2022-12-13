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
  "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85/16_19_Diurnal_final.xlsx")
class(t)
str(t)
t$Date=as.POSIXct(t$Date,format="%m/%d/%Y %H:%M") #convert into POSIXct format

t <- t %>% mutate(
  month = format(strptime(Date, "%Y-%m-%d %H:%M:%S"), "%b"),
  hour=format(strptime(Date, "%Y-%m-%d %H:%M:%S"), "%H"))
neworder <- c("May","Jun","Jul","Aug","Sep")


# Plot Rn
Rn_mix <- t %>% group_by(month, hour) %>% 
  summarize(Rn_mix_mean=mean(Rn_mix, na.rm=T))
Rn_grass <- t %>% group_by(month, hour) %>% 
  summarize(Rn_grass_mean=mean(Rn_grass, na.rm=T))

Rn_mix$hour=as.numeric(Rn_mix$hour) #convert into POSIXct format
Rn_grass$hour=as.numeric(Rn_grass$hour) #convert into POSIXct format


Rn_mix$month <- factor(Rn_mix$month,      # Reordering group factor levels
                       levels = neworder)
Rn_grass$month <- factor(Rn_grass$month,      # Reordering group factor levels
                         levels = neworder)

Rn_diff <-  Rn_mix
Rn_diff$Rn_mix_mean <- Rn_mix$Rn_mix_mean - Rn_grass$Rn_grass_mean


Rn <- ggplot()+
  geom_line(data = Rn_mix, aes(hour,Rn_mix_mean, colour = "Rn_mix"))+
  geom_line(data = Rn_grass, aes(hour,Rn_grass_mean, colour = "Rn_grass"))+
  scale_color_manual(name=" ",values=c("blue", "black"))+
  labs(y=expression(bold(Rn~(W~m^{2})))) +
  theme_bw()+
  xlab("\nTime of day (hour, LST = GMT + 8)") +
  ylim(-100,600)+
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
Rn

ggsave("Rn.png", Rn, width = 20, height = 4, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85")

# Plot G
G_mix <- t %>% group_by(month, hour) %>% 
  summarize(G_mix_mean=mean(G_mix, na.rm=T))
G_grass <- t %>% group_by(month, hour) %>% 
  summarize(G_grass_mean=mean(G_grass, na.rm=T))

G_mix$hour=as.numeric(G_mix$hour) #convert into POSIXct format
G_grass$hour=as.numeric(G_grass$hour) #convert into POSIXct format


G_mix$month <- factor(G_mix$month,      # Reordering group factor levels
                       levels = neworder)
G_grass$month <- factor(G_grass$month,      # Reordering group factor levels
                         levels = neworder)

G <- ggplot()+
  geom_line(data = G_mix, aes(hour,G_mix_mean, colour = "G_mix"))+
  geom_line(data = G_grass, aes(hour,G_grass_mean, colour = "G_grass"))+
  scale_color_manual(name=" ",values=c("blue", "black"))+
  labs(y=expression(bold(G~(W~m^{2})))) +
  theme_bw()+
  xlab("\nTime of day (hour, LST = GMT + 8)") +
  ylim(-150,200)+
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
G
ggsave("G.png", G, width = 20, height = 4, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85")

# Plot H
H_mix <- t %>% group_by(month, hour) %>% 
  summarize(H_mix_mean=mean(H_mix, na.rm=T))
H_grass <- t %>% group_by(month, hour) %>% 
  summarize(H_grass_mean=mean(H_grass, na.rm=T))

H_mix$hour=as.numeric(H_mix$hour) #convert into POSIXct format
H_grass$hour=as.numeric(H_grass$hour) #convert into POSIXct format


H_mix$month <- factor(H_mix$month,      # Reordering group factor levels
                      levels = neworder)
H_grass$month <- factor(H_grass$month,      # Reordering group factor levels
                        levels = neworder)

H_diff <-  H_mix
H_diff$H_mix_mean <- H_mix$H_mix_mean - H_grass$H_grass_mean


H <- ggplot()+
  geom_line(data = H_mix, aes(hour,H_mix_mean, colour = "H_mix"))+
  geom_line(data = H_grass, aes(hour,H_grass_mean, colour = "H_grass"))+
  scale_color_manual(name=" ",values=c("blue", "black"))+
  labs(y=expression(bold(H~(W~m^{2})))) +
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
H

ggsave("H.png", H, width = 20, height = 4, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85")

# Plot LE
LE_mix <- t %>% group_by(month, hour) %>% 
  summarize(LE_mix_mean=mean(LE_mix, na.rm=T))
LE_grass <- t %>% group_by(month, hour) %>% 
  summarize(LE_grass_mean=mean(LE_grass, na.rm=T))

LE_mix$hour=as.numeric(LE_mix$hour) #convert into POSIXct format
LE_grass$hour=as.numeric(LE_grass$hour) #convert into POSIXct format

LE_diff <-  LE_mix
LE_diff$LE_mix_mean <- LE_mix$LE_mix_mean - LE_grass$LE_grass_mean
write_xlsx(LE_diff,"C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85/LE_diff.xlsx")


LE_mix$month <- factor(LE_mix$month,      # Reordering group factor levels
                           levels = neworder)
LE_grass$month <- factor(LE_grass$month,      # Reordering group factor levels
                       levels = neworder)


# ggplot(LE_mix, aes(x=hour, y=LE_mix_mean)) + geom_line() + facet_wrap(~ month, ncol = 5) 
# write_xlsx(tm,"C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85/Diurnal_2018.xlsx")


LE <- ggplot()+
  geom_line(data = LE_mix, aes(hour,LE_mix_mean, colour = "LE_mix"))+
  geom_line(data = LE_grass, aes(hour,LE_grass_mean, colour = "LE_grass"))+
  scale_color_manual(name=" ",values=c("blue", "black"))+
  labs(y=expression(bold(LE~(W~m^{2})))) +
  theme_bw()+
  xlab("\nTime of day (hour, LST = GMT + 8)") +
  ylim(0,175)+
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
LE

ggsave("LE.png", LE, width = 20, height = 4, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85")


figure1 <- ggarrange(Rn,  G, H, LE,
                     #labels = c("A", "B"),
                     ncol = 1, nrow = 4)
figure1
ggsave("Energy.png", figure1, width = 20, height = 16, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85")


# Plot ET 
ET_mix <- LE_mix
ET_mix$LE_mix_mean <- ET_mix$LE_mix_mean*1800/2454000
ET_grass <- LE_grass
ET_grass$LE_grass_mean <- ET_grass$LE_grass_mean*1800/2454000

ET <- ggplot()+
  geom_line(data = ET_mix, aes(hour,LE_mix_mean, colour = "ET_mix"))+
  geom_line(data = ET_grass, aes(hour,LE_grass_mean, colour = "ET_grass"))+
  scale_color_manual(name=" ",values=c("blue", "black"))+
  labs(y=expression(bold(ET~(mm~30~min^{-1})))) +
  theme_bw()+
  xlab("\nTime of day (hour, LST = GMT + 8)") +
  # ylim(0,175)+
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
ET

ggsave("ET.png", ET, width = 20, height = 4, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85")

# Plot GPP
GPP_mix <- t %>% group_by(month, hour) %>% 
  summarize(GPP_mix_mean=mean(GPP_shrub, na.rm=T))
GPP_grass <- t %>% group_by(month, hour) %>% 
  summarize(GPP_grass_mean=mean(GPP_grass, na.rm=T))

GPP_mix$hour=as.numeric(GPP_mix$hour) #convert into POSIXct format
GPP_grass$hour=as.numeric(GPP_grass$hour) #convert into POSIXct format


GPP_mix$month <- factor(GPP_mix$month,      # Reordering group factor levels
                      levels = neworder)
GPP_grass$month <- factor(GPP_grass$month,      # Reordering group factor levels
                        levels = neworder)
GPP_diff <-  GPP_mix
GPP_diff$GPP_mix_mean <- GPP_mix$GPP_mix_mean - GPP_grass$GPP_grass_mean
write_xlsx(GPP_diff,"C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/Final/SA85/GPP_diff.xlsx")

GPP <- ggplot()+
  geom_line(data = GPP_mix, aes(hour,GPP_mix_mean, colour = "GPP_mix"))+
  geom_line(data = GPP_grass, aes(hour,GPP_grass_mean, colour = "GPP_grass"))+
  scale_color_manual(name=" ",values=c("blue", "black"))+
  labs(y=expression(bold(GPP~(g~C~m^{-2}~d^{-1}))))+
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

ggsave("GPP.png", GPP, width = 20, height = 4, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85")


# Plot 4 avg energy fluxes of 2016 and 2019 in same plot for shrub-grassland and shrub respectively 
# Shrub-grassland plot
Rn_mix_avg <- Rn_mix %>% group_by(hour) %>% 
  summarize(Rn_mix_avg=mean(Rn_mix_mean, na.rm=T))
G_mix_avg <- G_mix %>% group_by(hour) %>% 
  summarize(G_mix_avg=mean(G_mix_mean, na.rm=T))
H_mix_avg <- H_mix %>% group_by(hour) %>% 
  summarize(H_mix_avg=mean(H_mix_mean, na.rm=T))
LE_mix_avg <- LE_mix %>% group_by(hour) %>% 
  summarize(LE_mix_avg=mean(LE_mix_mean, na.rm=T))


Mix <- ggplot() +
  geom_line(data = Rn_mix_avg, aes(hour,Rn_mix_avg, colour = "Rn"))+ 
  #geom_point(data = Rn_mix_avg, aes(hour,Rn_mix_avg,shape = "Rn_mix"), size = 2.5) +
  geom_line(data = G_mix_avg, aes(hour,G_mix_avg, colour = "G"), linetype="longdash",)+ 
  #geom_point(data = G_mix_avg,aes(hour, G_mix_avg, shape = "G_mix"), size = 2.5) +
  geom_line(data = LE_mix_avg, aes(hour,LE_mix_avg,colour = "LE"))+ 
  #geom_point(data = LE_mix_avg,aes(hour, LE_mix_avg, shape = "LE_mix"), size = 2.5) +
  geom_line(data = H_mix_avg, aes(hour,H_mix_avg, colour = "H"))+ 
  #geom_point(data = H_mix_avg,aes(hour, H_mix_avg, shape = "H_mix"), size = 2.5) +
  # scale_color_manual(name=" ",values=c("black", "black", "black", "black"))+
  labs(y=expression(bold(Energy~flux~(W~m^{-2})))) +
  theme_bw()+
  xlab("\nTime of day (hour, LST = GMT + 8)") +
  ylim(-150,500)+
  # scale_x_time(breaks=seq(0,24,6), labels=c("0","6","12","18","24"))+
  theme(axis.text=element_text(size=20),
        axis.title=element_text(size=20,face="bold"))+
  # theme(axis.title.x=element_blank())+ # remove the xlable("hour")
  theme(legend.text=element_text(size=18))+
  theme(strip.text.x = element_text(size = 20))+ # adjust the size of title (May etc)
  theme(
    legend.title = element_text(size = 19),
    legend.position = c(0, 0.95),
    legend.justification = c(0, 1),
    legend.background = element_rect(fill = NA))
#  facet_wrap(~ month, ncol = 5)

Mix$labels$colour <- "Shrubs-grassland"
Mix

ggsave("Mix_energy.png", Mix, width = 8, height = 6, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85")


# Grassland plot
Rn_grass_avg <- Rn_grass %>% group_by(hour) %>% 
  summarize(Rn_grass_avg=mean(Rn_grass_mean, na.rm=T))
G_grass_avg <- G_grass %>% group_by(hour) %>% 
  summarize(G_grass_avg=mean(G_grass_mean, na.rm=T))
H_grass_avg <- H_grass %>% group_by(hour) %>% 
  summarize(H_grass_avg=mean(H_grass_mean, na.rm=T))
LE_grass_avg <- LE_grass %>% group_by(hour) %>% 
  summarize(LE_grass_avg=mean(LE_grass_mean, na.rm=T))

grass <- ggplot() +
  geom_line(data = Rn_grass_avg, aes(hour,Rn_grass_avg, colour = "Rn"))+ 
  #geom_point(data = Rn_grass_avg, aes(hour,Rn_grass_avg,shape = "Rn_grass"), size = 2.5, colour = "blue") +
  geom_line(data = G_grass_avg, aes(hour,G_grass_avg,colour = "G"),linetype="longdash")+ 
  #geom_point(data = G_grass_avg,aes(hour, G_grass_avg, shape = "G_grass"), size = 2.5, colour = "blue") +
  geom_line(data = LE_grass_avg, aes(hour,LE_grass_avg, colour = "LE"))+ 
  #geom_point(data = LE_grass_avg,aes(hour, LE_grass_avg, shape = "LE_grass"), size = 2.5, colour = "blue") +
  geom_line(data = H_grass_avg, aes(hour,H_grass_avg, colour = "H"))+ 
  #geom_point(data = H_grass_avg,aes(hour, H_grass_avg, shape = "H_grass"), size = 2.5, colour = "blue") +
  #scale_color_manual(name=" ",values=c("blue", "blue", "blue", "blue"))+
  labs(y=expression(bold(Energy~flux~(W~m^{2})))) +
  theme_bw()+
  xlab("\nTime of day (hour, LST = GMT + 8)") +
  ylim(-150,500)+
  # scale_x_time(breaks=seq(0,24,6), labels=c("0","6","12","18","24"))+
  theme(axis.text=element_text(size=20),
        axis.title=element_text(size=20,face="bold"))+
  # theme(axis.title.x=element_blank())+ # remove the xlable("hour")
  theme(legend.text=element_text(size=18))+
  theme(strip.text.x = element_text(size = 20))+ # adjust the size of title (May etc)
  theme(
    legend.title = element_text(size = 19),
    legend.position = c(0, 0.95),
    legend.justification = c(0, 1),
    legend.background = element_rect(fill = NA))
#  facet_wrap(~ month, ncol = 5)

grass$labels$colour <- "Grassland"
grass

ggsave("Grass_energy.png", grass, width = 8, height = 6, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85")

# Export data to excel for analysis 
write_xlsx(Rn_grass,"C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85/Rn_grass.xlsx")
write_xlsx(Rn_mix,"C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85/Rn_mix.xlsx")
write_xlsx(G_mix,"C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85/G_mix.xlsx")
write_xlsx(G_grass,"C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85/G_grass.xlsx")
write_xlsx(LE_grass,"C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85/LE_grass.xlsx")
write_xlsx(H_grass,"C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85/H_grass.xlsx")
write_xlsx(H_diff,"C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85/H_diff.xlsx")


# # Plot the 4 energy fluxes values in same plot for each month, for shrub-grassland and shrub respectively
# Mix <- ggplot() +
#   geom_line(data = Rn_mix, aes(hour,Rn_mix_mean, colour = "Rn"))+ 
#   # geom_point(data = Rn_mix, aes(hour,Rn_mix_mean,shape = "Rn_mix"), size = 2.5) +
#   geom_line(data = G_mix, aes(hour,G_mix_mean,colour = "G") ,linetype="longdash")+ 
#   # geom_point(data = G_mix,aes(hour, G_mix_mean, shape = "G_mix"), size = 2.5) 
#   geom_line(data = LE_mix, aes(hour,LE_mix_mean,colour = "LE"))+ 
#   #geom_point(data = LE_mix,aes(hour, LE_mix_mean, shape = "LE_mix"), size = 1.8) +
#   geom_line(data = H_mix, aes(hour,H_mix_mean,colour = "H"))+ 
#   #geom_point(data = H_mix,aes(hour, H_mix_mean, shape = "H_mix"), size = 1.8) +
#   #scale_color_manual(name=" ",values=c("black", "black", "black", "black"))+
#   labs(y=expression(bold(Energy~flux~(W~m^{2})))) +
#   theme_bw()+
#   xlab("Time of day (hour, LST = GMT + 8)") +
#   #ylim(-150,500)+
#   # scale_x_time(breaks=seq(0,24,6), labels=c("0","6","12","18","24"))+
#   theme(axis.text=element_text(size=20),
#         axis.title=element_text(size=20,face="bold"))+
#   # theme(axis.title.x=element_blank())+ # remove the xlable("hour")
#   theme(legend.text=element_text(size=22))+
#   theme(strip.text.x = element_text(size = 20))+ # adjust the size of title (May etc)
#   theme(
#     legend.title = element_text(size = 20),
#     legend.position = "bottom", legend.box = "horizontal")+
#     #legend.justification = c(0, 1),
#     #legend.background = element_rect(fill = NA))+
#   facet_wrap(~ month, ncol = 5)
# Mix$labels$colour <- "(a) Shrubs-Grassland"
# Mix
# 
# ggsave("SG_energy.png", Mix, width = 18, height = 5, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85")
# 
# Grass_may <- ggplot() +
#   geom_line(data = Rn_grass, aes(hour,Rn_grass_mean, colour = "Rn"))+ 
#   # geom_point(data = Rn_mix, aes(hour,Rn_mix_mean,shape = "Rn_mix"), size = 2.5) +
#   geom_line(data = G_grass, aes(hour,G_grass_mean,colour = "G") ,linetype="longdash")+ 
#   # geom_point(data = G_mix,aes(hour, G_mix_mean, shape = "G_mix"), size = 2.5) 
#   geom_line(data = LE_grass, aes(hour,LE_grass_mean,colour = "LE"))+ 
#   #geom_point(data = LE_mix,aes(hour, LE_mix_mean, shape = "LE_mix"), size = 1.8) +
#   geom_line(data = H_grass, aes(hour,H_grass_mean,colour = "H"))+ 
#   #geom_point(data = H_mix,aes(hour, H_mix_mean, shape = "H_mix"), size = 1.8) +
#   #scale_color_manual(name=" ",values=c("black", "black", "black", "black"))+
#   labs(y=expression(bold(Energy~flux~(W~m^{2})))) +
#   theme_bw()+
#   xlab("Time of day (hour, LST = GMT + 8)") +
#   #ylim(-150,500)+
#   # scale_x_time(breaks=seq(0,24,6), labels=c("0","6","12","18","24"))+
#   theme(axis.text=element_text(size=20),
#         axis.title=element_text(size=20,face="bold"))+
#   # theme(axis.title.x=element_blank())+ # remove the xlable("hour")
#   theme(legend.text=element_text(size=22))+
#   theme(strip.text.x = element_text(size = 20))+ # adjust the size of title (May etc)
#   theme(
#     legend.title = element_text(size = 20),
#     legend.position = "bottom", legend.box = "horizontal")+
#   #legend.justification = c(0, 1),
#   #legend.background = element_rect(fill = NA))+
#   facet_wrap(~ month, ncol = 5)
# Grass_may$labels$colour <- "(b) Grassland"
# 
# Grass_may
# ggsave("Gra_energy.png", Grass_may, width = 18, height = 5, dpi = 300, path = "C:/Users/etang/OneDrive - Universiteit Twente/Desktop/MSc Research/3_Thesis/Diurnal/SA85")

