# Preliminary data analysis and data visulization for fertilization results of pairwise crosses of Staghorn coral (<i>Acropora cervicornis</i>).
Semester project for BIOL 502 

# Objective of the project

The data used here was collected over two nights for fertilization crosses between 10 genetically distinct colonies of Staghorn coral (<i>Acropora cervicornis</i>), to eventually test for an effect of genetic relatedness or kinship on the fertilization rates. 
With this data, this project has two goals; the first is to run some preliminary statistical analysis on the data in order to identify any additional predictor variables before testing for an effect of genetic relatedness (data have not been collected for this yet). The second goal of this project is to generate good figures for better visual representation and presentation of the data prior to genetic relatedness analysis. 


The first goal will be completed by testing for statistically significant differences of rates of fertilization between the two nights of the crossing experiments, and then a test for directionality (sperm or ova first) of the cross performed as a predictor variable for fertilization rate will be carried out using a linear model. The data for this analysis can be found in data > data for statistical analysis and the script is called directionality tests. 

The second goal of generating a better visual representation for the data will be done by creating a heatmap in r of each night, showing the crosses and the fertilization rate. The data for this analysis can be found in data > data for heatmap and the r script under scripts > heatmap_work. the finished heatmaps are saved in the folder labeled figs. 

# Stucture of code base

All code used in this project is located in the "scripts" folder. The folder contains two scripts; the script titled "preliminary_stats" is the code used to run the preliminary stats on the data. The other script titled "data_visualization" contains the code used to generate two heat maps for the data. All data used in this project is located in the "data" folder. Within this folder are two subfolders - the first is labeled 'data for heatmap'. This folder contains two .csv files; acer_all_split contains all the data for the crosses over nights 1 and 2, and was used to generate the three seperate heatmaps. The second subfolder in the 'data' folder is titled 'data fo statistical analysis'. This folder contains three .csv files, all formatted differently to accurately carry out several different statistical tests. "acer_all_together" was used to test for a significant difference of fertilization rates over both nights, "all_dir_both" was used to test for an effect of directionality on the rates of fertilization. "all_dir_night" was used for the same analysis, only arranging the data so that only the genets are looked at. The heatmaps genetated from the code in the "data_visualization" script can be found in the "figs" folder, along with several boxplots generated prior to the statistical analysis done using the code in the "preliminary_stats" script.


# How to recreate results 

Code to recreate these results can be found in the "scripts" folder. The code for the statistical analysis can be found in the script "preliminary_stats" and the code for the heat maps can be found in "data_visualization". These scripts contain any nessecary R packages that will be needed at the top of the script, and contain line-by-line descriptions of the purpose of each line of code. 

# Acknowledgements 

I would like to thank Dr. Dan McGlinn for all of his help and suggestions on preliminary tests to run on my data, and for patiently teaching me more about R. I would also like to thank Kayla Pehl for looking over my code and offering many helpful suggestions and edits. 
