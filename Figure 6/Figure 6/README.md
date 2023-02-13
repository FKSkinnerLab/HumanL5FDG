To produce Frequency Dependent Gain (FDG) curves in the model of rodent layer 5 cortical pyramidal neurons, use the following codes:
	1. Use the noisefiles (".csv" and ".dat") produced from first running makeNoise.m and then run_makeNoise_042.m.
	
	2. Run the noise files using Hay_STA.py (for block Ih, go to models folder, open L5PCbiophys3.hoc, go to line 34 and switch the gIhbar_Ih conductance value to 0 instead of 0.0002) which uses "noiserun()" function in Hay_setup.hoc file (specific to Ih scenario) in NEURON to output voltage and current plots (excel spreadsheets referred to as NoiseData_voltage/current/time). This will additionally generate corresponding currentscape plots via Python interface.
	
	3. Limitations - since this was done on a personal laptop with limited memory, the dt for "noiserun()" used was 0.03 instead of the default 0.01.
	
	4. Use run_freqDepGain, import the output voltage and current plots specific to each of the 30 noise files. This will run the frequency dependent gain measure generating a frequency dependent plot for each individual noise profile and the average profile. Prior to using "run_freqDepGain", first run in the following order:
	
		One. "sl_sync_params.m" as a directory for parameters 
		Two. "freqDepGain.m" as the function for FDG
		Three. Using the "freqDepGain.m" function, run "run_freqDepGain_0924.m" using noise files
		
	5. To obtain the normalized FDG plots for each Ih scenario, as in relation to the maximum value in the curves,  use the following files in this order: Normalized_values0_30.m file and run_freqDepGain_0924_normalized.m. 
	
	6. Rename the average FDG excel spreadsheets that are non-normalized as FrequencyDependentGain_AVG60Hay__normal/zeroIh0_30.csv depending on the Ih scenario.
	
	7. Run "FDG_traceplot_0808.m" to obtain graphs for the corresponding input current and output voltage trace associated with FDG specific to a noise file.
	
To obtain the STA plots for the inward currents, with standard deviation indicated as shading in the plots, do the following:
	1. Utilize the 30 noise files (from makeNoise.m and run_makeNoise_0425.m) when running Hay_STA_normalIh.py to generate the output voltage and individual ionic channel currents throughout the simulation.
	
	2. Running STA_analysis_code_Part1 to Part 2 series to determine the individual ion channel currents values 200ms prior to a spike with standard deviation as an average of the 30 noise files.
	
	3. Utilizing the average individual ion channel currents values 200ms prior to a spike with standard deviation as an average of the 30 noise, create inward current graphs via Shading_of_std_for_STA_200ms_out_inward.m for 200ms prior to a spike with shading to represent the standard deviation.
	
		One. Using distinguishable_colors.m and stdshade.m files
