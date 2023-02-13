To obtain the STA analysis specific to the three Ih scenarios (double, normal, and half Ih). For each of the three Ih scenarios, do the following:
	1. Utilize the 30 noise files (from makeNoise.m and run_makeNoise_0425.m) when running theta_STA.py (specific to the Ih scenario) to generate the output voltage and individual ionic channel currents throughout the simulation.
	
	2. Running STA_analysis_code_Part1 to Part 3 series to determine the individual ion channel currents values 200ms prior to a spike with standard deviation as an average of the 30 noise files.
	
	3. Utilizing the 3 Ih scenarios average individual ion channel currents values 200ms prior to a spike with standard deviation as an average of the 30 noise, create graphs via Shading_of_std_for_STA_200ms_Ihscenarios.m prior to a spike with shading to represent the standard deviation.
	
		One. Using distinguishable_colors.m and stdshade.m files 

To obtain the FDG plots for each of the three Ih scenarios:
	1. Use the noisefiles (".csv" and ".dat") produced from first running makeNoise.m and then run_makeNoise_042.m.
	
	2. Run the noise files using theta_STA.py (specific to the Ih scenario) which uses "noiserun()" function in DefineProcs.hoc file in NEURON to output voltage and current plots (excel spreadsheets referred to as NoiseData_voltage/current/time). This will additionally generate corresponding currentscape plots via Python interface.
	
	3. Use run_freqDepGain, import the output voltage and current plots specific to each of the 30 noise files. This will run the frequency dependent gain measure generating a frequency dependent plot for each individual noise profile and the average profile. Prior to using "run_freqDepGain", first run in the following order:
	
		One. "sl_sync_params.m" as a directory for parameters 
		Two. "freqDepGain.m" as the function for FDG
		Three. Using the "freqDepGain.m" function, run "run_freqDepGain_0924.m" using noise files
		
	4. To obtain the normalized FDG plots, as in relation to the maximum value in the curves, use the Normalized_values0_30.m file for the first 30 Hz of data.
	
	5. Rename the average FDG excel spreadsheets that are non-normalized as FrequencyDependentGain_AVG60_double/normal/halfIh0_30.csv depending on the Ih scenario.
	
	6. Run Values_combined_FDG.m and Normalized_values_combined_FDG.m to get the FDG plots of the three Ih scenarios on the same graph.
