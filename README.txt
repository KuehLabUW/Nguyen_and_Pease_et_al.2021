This document gives instruction on how to generate data and create plots for the publication ‘Scalable control of developmental timetables by epigenetic switching networks’ by Nguyen and Pease et al., 2021. Running these scripts requires the Tellurium software package https://tellurium.readthedocs.io/en/latest/installation.html and MATLAB https://www.mathworks.com/products/get-matlab.html?s_tid=gn_getml 
Figure 2:
 
Figure 2B classic activation:
•	 Run the script ‘simulate.ipynb’ in directory ‘figure 2/classic activation/’ to generate simulation data. Data saving directory must be set to a local drive.
•	 Run the scripts ‘plot_example.m’ to generate tracks of gene expression values. Input data directory must be set to a local drive.

Figure 2C classic activation:
•	Run the script ‘simulate_S_sweep.ipynb’ in directory ‘figure 2/classic activation/’ to generate simulation data. Data saving directory must be set to a local drive.
•	Run the scripts ‘plot_S_sweep.m’ to generate tracks of gene expression values. Input data directory must be set to a local drive.

Figure 2B classic repression:
•	Run the script ‘simulate.ipynb’ in directory ‘figure 2/classic repression/’ to generate simulation data. Data saving directory must be set to a local drive.
•	 Run the scripts ‘plot_example.m’ to generate tracks of gene expression values. Input data directory must be set to a local drive.

Figure 2C classic repression:
•	Run the script ‘simulate_S_sweep.ipynb’ in directory ‘figure 2/classic repression/’ to generate simulation data. Data saving directory must be set to a local drive.
•	Run the scripts ‘plot_S_sweep.m’ to generate tracks of gene expression values. Input data directory must be set to a local drive.

Figure 2B classic positive feedback:
•	Run the script ‘simulate.ipynb’ in directory ‘figure 2/classic positive feedback/’ to generate simulation data. Data saving directory must be set to a local drive.
•	 Run the scripts ‘plot_example.m’ to generate tracks of gene expression values. Input data directory must be set to a local drive.

Figure 2C classic positive feedback:
•	Run the script ‘simulate_S_sweep.ipynb’ in directory ‘figure 2/classic positive feedback/’ to generate simulation data. Data saving directory must be set to a local drive.
•	Run the scripts ‘plot_S_sweep.m’ to generate tracks of gene expression values. Input data directory must be set to a local drive.

Figure 2B epigenetic activation:
•	Run the script ‘simulate.ipynb’ in directory ‘figure 2/epigenetic activation/’ to generate simulation data. Data saving directory must be set to a local drive.
•	 Run the scripts ‘plot_example.m’ to generate tracks of gene expression values. Input data directory must be set to a local drive.

Figure 2C epigenetic activation:
•	Run the script ‘simulate_S_sweep.ipynb’ in directory ‘figure 2/epigenetic activation/’ to generate simulation data. Data saving directory must be set to a local drive.
•	 Run the scripts ‘plot_S_sweep.m’ to generate tracks of gene expression values. Input data directory must be set to a local drive.

Figure 2B epigenetic repression:
•	Run the script ‘simulate.ipynb’ in directory ‘figure 2/epigenetic repression/’ to generate simulation data. Data saving directory must be set to a local drive.
•	Run the scripts ‘plot_example.m’ to generate tracks of gene expression values. Input data directory must be set to a local drive.

Figure 2C epigenetic repression:
•	Run the script ‘simulate_S_sweep.ipynb’ in directory ‘figure 2/epigenetic repression/’ to generate simulation data. Data saving directory must be set to a local drive.
•	Run the scripts ‘plot_S_sweep.m’ to generate tracks of gene expression values. Input data directory must be set to a local drive.

Figure 3:

Figures 3A-B Negative Feedback Loop:
•	Run the script ‘simulate.ipynb’ in directory ‘figure 3/negative feedback loop/’ to generate simulation data. Data saving directory must be set to a local drive.
•	Run the scripts ‘plot_example.m’ and ‘calculate_schedule.m’ to generate tracks of gene expression values for genes X1, X2, and expression schedule bar. Input data directory must be set to a local drive.

Figure 3C Negative Feedback Loop Scan:
•	Run the first two cells of the script ‘simulate_parameter_scan-NF.ipynb’ in directory ‘figure 3/negative feedback loop/’ to generate simulation data. Data saving directory must be set to a local drive. If memory errors occurs during the  simulation, consider lowering the repeats or simulating a lower number of parameters at a time.
•	Run cells 3 and 4 of the above script to generate the scan figures.

Figures 3D-E Mutual Inhibitory Loop:
•	Run the script ‘simulate.ipynb’ in directory ‘figure 3/mutual inhibition/’ to generate simulation data. Data saving directory must be set to a local drive.
•	Run the scripts ‘plot_example.m’ and ‘calculate_schedule.m’ to generate tracks of gene expression values for genes X1, X2, and expression schedule bar. Input data directory must be set to a local drive.

Figure 3F Mutual Inhibitory Loop Scan:
•	Run the first two cells of the script ‘simulate_parameter_scan-MIL.ipynb’ in directory ‘figure 3/mutual inhibition/’ to generate simulation data. Data saving directory must be set to a local drive. If memory errors occurs during the simulation, consider lowering the repeats or simulating a lower number of parameters at a time.
•	Run cells 3 and 4 of the above script to generate the scan figures.

Figure 5:

Figure 5D
•	Run the script ‘hox-network.ipynb’ in directory ‘figure5/hox-network/’ to generate simulation data. Data saving directory must be set to a local drive.
•	Run the scripts ‘hox_example.m’ to generate tracks of gene expression values for genes XA, XP. Input data directory must be set to a local drive.

Figure 5E
•	Run the scripts ‘hox_areaplot.m’ to generate stack area plots of the different cell types. Input data directory must be set to a local drive.

αA and αP Parameter Scan
•	Run the the script ‘hox-network-parameter-scan.ipynb’ in directory ‘figure3/mutual inhibitory loop/’ to generate simulation data. Data saving directory must be set to a local drive. If memory errors occurs during the simulation, consider lowering the repeats or simulating a lower number of parameters at a time.
•	Run the scripts ‘hox_CellNumberPlot.m’ to extract number of anterior and posterior cells generated from simulation data at different parameter values. Input and output data directories must be set to a local drive.
•	Run the scripts ‘plot_heatmap_Hox.ipynb’ to plot the total number of cells and the fraction contribution plots for anterior cell population. Input and output data directories must be set to a local drive.


