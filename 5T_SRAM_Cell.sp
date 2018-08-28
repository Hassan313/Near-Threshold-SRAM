******************* Bulk 5T *****************************
.options list node
.option post=1 
.prot
.lib 'finfet.lib' ptm20hp
.lib 'finfet.lib' ptm20lstp
.unprot
.TEMP 25 100
*========== DVI parameters =====================
.param vdd2=0.5
.param  Lb='lg'
.param vardelay=1n
.param slp=0
.param vh=0.9*vdd2
.param vl=0.1*vdd2
.param per=15
*===============================================
*Bulk FinFET
*=============================================== 
*****************************************************************************
xm1 	Q 		QB  	0  			0			nfet_hp    		L='Lg'    nfin=1
xm2 	BL 		RWL    	Q 			0			nfet_hp       	L='Lg'    nfin=1
xm3 	Q 		QB 		vdd2   		vdd2		pfet_lstp       L='Lg'    nfin=1
xm4 	BLb 	WWL 	QB			0			nfet_hp        	L='Lg'    nfin=2
xm5 	QB 		Q 		vdd2		vdd2		Pfet_lstp       L='Lg'    nfin=1
*****************************************************************************
************************* DC SOURCES ****************************************
vdd2  	vdd2 	0 	vdd2
VBLB 	BLB 	0 	0
VBL  	BL 		0 	0
Vwl  	WWL 	0 	0
VRWL	RWL		0	v0
*VQ   	Q 		0 	vdd2	
*VQB  	QB 		0 	vdd2
.nodeset v(QB)=vdd2
.IC V(Q)=vdd2
.TRAN  1E-10 1E-8 start=0
*******************************************
*.dc  VQ		0 	vdd2 	0.01
*******************************************
.dc vwl 0 vdd2 0.0001 
*=============================  TRANSIENT ====================
*.MEASURE TRAN T0_1 WHEN V(WWL)='0.5*VDD2' RISE=1
*.measure tran T0_2 when v(q)=v(qb) CROSS=2
*.measure tran write_time_zero param=('T0_2-T0_1')
*.MEASURE TRAN T1_1 WHEN V(WWL)='0.5*VDD2' RISE=2
*.measure tran T1_2 when v(q)=v(qb) CROSS=3
*.measure tran write_time_one param=('T1_2-T1_1')
*.IC QB=0.5
*.Tran .1n 350n 
*.VEC 'SRAM6.DVI'
*.measure dc vw when v(Q)=v(QB) cross=1
*.measure  WM param='vdd2-vw'

*=========================== Alters =========================
*******************************************
.prot
.alter lstp_hp 16
.del lib 'finfet.lib' ptm20HP
.del lib 'finfet.lib' ptm20lstp
.lib 'finfet.lib' ptm16hp
.lib 'finfet.lib' ptm16lstp
.unprot
*******************************************
.prot
.alter lstp_hp 14
.del lib 'finfet.lib' ptm16HP
.del lib 'finfet.lib' ptm16lstp
.lib 'finfet.lib' ptm14hp
.lib 'finfet.lib' ptm14lstp
.unprot
*******************************************
.prot
.alter lstp_hp 10
.del lib 'finfet.lib' ptm14HP
.del lib 'finfet.lib' ptm14lstp
.lib 'finfet.lib' ptm10hp
.lib 'finfet.lib' ptm10lstp
.unprot
*******************************************
.prot
.alter lstp_hp 7
.del lib 'finfet.lib' ptm10HP
.del lib 'finfet.lib' ptm10lstp
.lib 'finfet.lib' ptm7hp
.lib 'finfet.lib' ptm7lstp
.unprot
*******************************************
.end