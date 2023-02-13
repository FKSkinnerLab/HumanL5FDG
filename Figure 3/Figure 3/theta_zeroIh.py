import pandas as pd
import numpy
import neuron
from neuron import h, gui
import matplotlib.pyplot as plt
from currents_visualization_STA import plotCurrentscape, CurrentValues


### Instantiate Model ###

# Add code for instantiation the model here if not already instantiated 
h.load_file("init_final.hoc")


# Note that cvode cannot be active if running currentscape plots, since these assume a fixed timestep 
h.cvode_active(0)


#If cvode was previously active, set h.dt and h.steps_per_ms to the desired values 
h.dt = 0.1 
h.steps_per_ms = 10 


#If you need to input a function, for instance from DefineProcs.hoc file, this is where you can add it 
h.block_Ih()

### Setup Recordings and Distance Vector ###
# Note that some VGCs are only found in the dendrites and not the soma, so pick a compartment that includes all channel mechanisms if possible
# For example, here I chose the first dendritic compartment branching off the soma (i.e. "h.dend[0](0)"), since that compartment includes all VGCs
# Note that "_ref_CURRENTTYPE_CURRENTNAME" specifies which current to record from, where CURRENTTYPE is either ina, ik, ica, i, or ih, and CURRENTNAME is the name of the current - these names can be found in the .mod files.

t_vec = h.Vector()  
t_vec.record(h._ref_t)

v_vec = h.Vector()
v_vec.record(h.filament_100000042[0](0.5)._ref_v)

pas = h.Vector()
pas.record(h.filament_100000042[0](0.5)._ref_i_pas)

Ca_HVA = h.Vector()
Ca_HVA.record(h.filament_100000042[0](0.5)._ref_ica_Ca_HVA)

Ca_LVAst = h.Vector()
Ca_LVAst.record(h.filament_100000042[0](0.5)._ref_ica_Ca_LVAst)

Ih = h.Vector()
Ih.record(h.filament_100000042[0](0.5)._ref_ihcn_Ih)

K_Pst = h.Vector()
K_Pst.record(h.filament_100000042[0](0.5)._ref_ik_K_Pst)

K_Tst = h.Vector()
K_Tst.record(h.filament_100000042[0](0.5)._ref_ik_K_Tst)

SK_E2 = h.Vector()
SK_E2.record(h.filament_100000042[0](0.5)._ref_ik_SK_E2)

SKv3_1 = h.Vector()
SKv3_1.record(h.filament_100000042[0](0.5)._ref_ik_SKv3_1)

NaTa_t = h.Vector()
NaTa_t.record(h.filament_100000042[0](0.5)._ref_ina_NaTa_t)

Nap_Et2 = h.Vector()
Nap_Et2.record(h.filament_100000042[0](0.5)._ref_ina_Nap_Et2)

Im = h.Vector()
Im.record(h.filament_100000042[0](0.5)._ref_ik_Im)

labels = ('gpas','gCa_HVa','gCa_LVAst','gIh','gK_Pst','gK_Tst','gSK_E2','gSKv3_1','gNaTa_t','gNap_Et2','gIm')

noisenamebasis='_2andahalfmsNoise_4.000000e-02_3'

for i in range(1,31): 

	noisenames = str(i)+ noisenamebasis
	namefornoise = 'zeroIh_0.073' + str(i)+ noisenamebasis
	
	h.noiserun(noisenames, .01, 2500, 0.073)	
	
	vvec0 = numpy.array(v_vec)
	tvec0 = numpy.array(t_vec)

	ppas = numpy.array(pas)
	pCa_HVA = numpy.array(Ca_HVA)
	pCa_LVAst = numpy.array(Ca_LVAst)
	pIh = numpy.array(Ih)
	pK_Pst = numpy.array(K_Pst)
	pK_Tst = numpy.array(K_Tst)
	pSK_E2 = numpy.array(SK_E2)
	pSKv3_1 = numpy.array(SKv3_1)
	pNaTa_t = numpy.array(NaTa_t)
	pNap_Et2 = numpy.array(Nap_Et2)
	pIm = numpy.array(Im)

	r0 = [pK_Pst,pK_Tst, pSK_E2, pSKv3_1, pIm, ppas, pCa_HVA, pCa_LVAst,pNaTa_t,pNap_Et2,pIh] #r0 = [outward currents (+), leak current(+/-), inward current(-)]

	###Note: r0 determines the order of color scheme (from currents_visualization.py) for the currents. For instance, first color in color scheme is assigned to pK_Pst

	
	#fig0.savefig('PLOTfiles/Currentscape.pdf',dpi=1500) 
	fig0.savefig('PLOTfiles/Currentscape.png', dpi=1500) #1000
	fig0.clf()
	plt.close(fig0)


	#For horizontal legend to be included in plot
	import PIL
	from PIL import Image
	image = Image.open('PLOTfiles/Currentscape.png')
	logo = Image.open('PLOTfiles/HorizontalLegend.png')
	image_copy = image.copy()
	#position = ((image_copy.width - logo.width), (image_copy.height - logo.height))
	position = (65,5530)
	image_copy.paste(logo, position)
	#print((image_copy.width-logo.width),(image_copy.height - logo.height)) 
	
	image_copy.save('PLOTfiles/Currentscape_{}.png'.format(namefornoise))	




