To obtain the STA plots for the inward and outward currents, with standard deviation indicated as shading in the plots, do the following:
	1. Utilize the 30 noise files (from makeNoise.m and run_makeNoise_0425.m) when running theta_normal_Ih_STA.py to generate the output voltage and individual ionic channel currents throughout the simulation.
	
	2. Running STA_analysis_code_Part1 to Part 3 series to determine the individual ion channel currents values 200ms prior to a spike with standard deviation as an average of the 30 noise files. This is the Spike Triggered Average plots. 
	
	3. Utilizing the average individual ion channel currents values 200ms prior to a spike with standard deviation as an average of the 30 noise, create outward and inward current specific graphs via Shading_of_std_for_STA_ms_out_inward.m for 30ms/100ms/200ms prior to a spike with shading to represent the standard deviation. 
		One. Using distinguishable_colors.m and stdshade.m files 
