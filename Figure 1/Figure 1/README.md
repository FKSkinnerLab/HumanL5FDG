To produce Frequency Dependent Gain (FDG) curves in the model of human layer 5 cortical pyramidal neurons, run the following codes in this order:

1. Use the 30 noisefiles (".csv" and ".dat") produced from first running makeNoise.m and then run_makeNoise_042.m 

2. Run the noise files using makeNoise_run.py (specific to Ih and blockIh) which uses "noiserun()" function in DefineProcs.hoc file in NEURON to output voltage and current plots (excel spreadsheets referred to as NoiseData_voltage/current/time). This will additionally generate corresponding currentscape plots via Python interface.

3. Use run_freqDepGain, import the output voltage and current plots specific to each of the 30 noise files. This will run the Frequency Fependent Gain measure generating a Frequency Fependent plot for each individual noise profile and an average profile. Prior to using "run_freqDepGain", first run these codes in the following order:

	One. "sl_sync_params.m" as a directory for parameters 
	Two. "freqDepGain.m" as the function for FDG
	Three. Using the "freqDepGain.m" function, run "run_freqDepGain_0924.m" using the noise files
	
4. To obtain the normalized FDG plots, as in relation to the maximum value in the curves, use  use the following files in this order: Normalized_values0_30.m file, run_freqDepGain_0924_normalized.m, and Normalized_values_combined_FDG.m

5. Run "FDG_traceplot_0808.m" to obtain graphs for the corresponding input current and output voltage trace associated with FDG specific to a noise file.
