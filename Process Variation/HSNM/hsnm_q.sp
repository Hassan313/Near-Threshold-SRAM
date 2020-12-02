******************* Bulk 6T *****************************
.options list node
.option post=2
.prot
.lib '/home/home2/students/afzalikusha/SRAM/Model/FinFET_PTM_PV/finfet_monte_new2.lib' ptm14hp
.unprot
.TEMP 25
.param vdd2=0.2
.param  Lb='lg' 
*************************************************************
xm1 Q 	QB 		0   		0		nfet     L='Lg_loc+Lg_glob-Lg'    nfin=1 hfin='fin_height' tfin='fin_width_glob+fin_width_loc-fin_width'
xm2 QB 	Q 		0			0		nfet     L='Lg_loc+Lg_glob-Lg'    nfin=1 hfin='fin_height' tfin='fin_width_glob+fin_width_loc-fin_width'
xm3 Q 	QB 	 	vdd2 		vdd2	Pfet     L='Lg_loc+Lg_glob-Lg'    nfin=1 hfin='fin_height' tfin='fin_width_glob+fin_width_loc-fin_width'
xm4 QB 	Q 	 	vdd2 		vdd2	Pfet     L='Lg_loc+Lg_glob-Lg'    nfin=1 hfin='fin_height' tfin='fin_width_glob+fin_width_loc-fin_width'
xm5 BL 	WL  	Q  			0		nfet     L='Lg_loc+Lg_glob-Lg'    nfin=1 hfin='fin_height' tfin='fin_width_glob+fin_width_loc-fin_width'
xm6 BLB WL    	QB 			0		nfet     L='Lg_loc+Lg_glob-Lg'    nfin=1 hfin='fin_height' tfin='fin_width_glob+fin_width_loc-fin_width'

************************* DC SOURCES ********************************
vdd2  vdd2 	0 	vdd2
VBLB BLB 	0 	vdd2
VBL  BL 	0 	vdd2
Vwl  wl 	0 	0
VQ   Q 		0 	vdd2	
*VQB  QB 	0 	vdd2
***********************************************************
.dc vq 0 vdd2 0.01 sweep monte=10000
*.measure dc itest max isub(xm6.d)
************************************************************
.op
.OPTION POST POST_VERSION=9601
.end






