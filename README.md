# STEMMUS-SCOPE at Yanchi Site

**This repository includes:** Input, output and source codes of the STEMMUS-SCOPE model in MATLAB environmnet that applied in Yanchi County, Ningxia Province, Northwest China. The structure of the this repository is as follows:

**0_Data** 

Forcings: Input variables for STEMMUS-SCOPE

Validation: Field observations for model validation

**1_STEMMUS-SCOPE** 

Shrub_STEMMUS-SCOPE and Grass_STEMMUS-SCOPE: the input, STEMMUS_SCOPE_1.0.0 (i.e., source code), and output for shrubland and grassland, respectively. 

**2_Cal_Val**

Calibration_Data: model output from May-August in 2018 and scripts for calculation and plots.

Validation_Data: scatter plot and time-series plot of simulation against field observations in 2016, 2017 and 2019.

</br>

**The manual for running the STEMMUS-SCOPE in Yanchi County is described as following. Before running the *STEMMUS-SOCPE.m*, you need to prepare:**

**1. Driving Forcings in "\STEMMUS-SCOPE_Yanchi\Shrub_STEMMUS-SCOPE\Input\"**

In this study, if you want to run the model for 2016-2019, you need to copy the files from the corresponding folders (e.g. folder *"\Input\2016"* has the drving forces for the growing season in 2016). If you want to prepare the data for your site, then just put your forcings under *"Input"* folder. 

**2. Input paramters in "\STEMMUS-SCOPE_Yanchi\Shrub_STEMMUS-SCOPE\Input\input_data.xlsx"**

   User-defined: Vcamx, m, BallBerry0, Type, Rdparam, hc, LIDFa, LIDFb, leafwidth, LAT, LON, timezn in the *"inputdata"* sheet

**3. Main function needed to be checked in "\STEMMUS-SCOPE_Yanchi\Shrub_STEMMUS-SCOPE\STEMMUS_SCOPE_1.0.0\src\"**
   
   (1) ***filesread_single.m***: sitename, startyear, endyear, Dur_tot (i.e., timesteps, VIP).
   
   (2) ***soilpropertyread_single.m***: either extract values from **.nc* file or enter the values by users
  
   (3) ***Constants.m***: InitT* and  is the initial Ts and InitX* is the initial SM at specific layer, and BtmTs is Ts at the bottom which is usually using the long-term averaged air temperature (line 482- line 549). RTB (initial root total biomass, g m-2), rroot (radius of root).
   
   (4) ***Max_Rootdepth.m***: R_depth (rooting depth),  Elmn_Lnth<=Tot_Depth-1 (i.e., eliminating the root at the surface 1cm depth, where the 1 can be varied across different site).
   
   (5) ***Root_properties.m***: root_den (Root density), R_C (Ratio Carbon-Dry Matter in root). This function is called only when the root growth module is activated in the *STEMMUS-SOCPE.m*.
   
</br>

Same rules are applied in **"\STEMMUS-SCOPE_Yanchi\Grass_STEMMUS-SCOPE\"**. The output fluxes from shrubland and grassland scenarios are aggregated in folder **2_Cal_Val**.

