******************* FinFET 7T ***
.options list node
.option post=1  
*.option probe
.prot
.lib 'finfet.lib' ptm20hp
.lib 'finfet.lib' ptm20lstp
.unprot
.TEMP 25 100
.param vdd2=0.5
.param  Lb='lg'
.param vwwl=0.5
*========== DVI parameters ======
.param vardelay=0
.param slp=1e-5
.param vh=0.9*vdd2
.param vl=0.1*vdd2
.param per=15
********************************************************************************
*Bulk FinFET
********************************************************************************
xm1 	Q 		QB  	vgnd		0			nfet_hp   		L='Lg'    nfin=1
xm2 	BL 		WWL    	Q 			0			nfet_lstp       L='Lg'    nfin=1
xm3 	Q 		QB 		vdd2   		vdd2		pfet_lstp       L='Lg'    nfin=1
xm4 	BLb 	WWL 	QB			vdd2		nfet_hp       	L='Lg'    nfin=2
xm5 	QB 		Q 		vdd2		vdd2		Pfet_lstp       L='Lg'    nfin=1
xm6 	vgnd 	WWL		0			0			nfet_lstp       L='Lg'    nfin=1
xm7		bl		WWL		q			0			nfet_hp     	L='Lg'    nfin=1
********************************************************************************
****** DC SOURCES ***
vdd2  vdd2 	0 	vdd2
VBLB BLB 	0 	0
VBL  BL 	0 	vdd2
Vwwl  WWL 	0 	VWWL
*VQ   Q 	0 	VQ	
*VQB  QB 	0 	VQB
.NODESET V(Q)=0
************************
.dc VWWL 0 VDD2 .0001 
*****************************************
*.PRINT ISUB(XM1.D)
.measure dc VW WHEN v(q)=v(qb) CROSS=1
.measure  WMARGIN	PARAM='VDD2-VW'
*****************************************
*=============================  TRANSIENT ====================
*.MEASURE TRAN T0_1 WHEN V(WWL)='0.5*VDD2' RISE=1
*.measure tran T0_2 when v(q)=v(qb) CROSS=2
*.measure tran write_time_zero param=('T0_2-T0_1')
*.MEASURE TRAN T1_1 WHEN V(WWL)='0.5*VDD2' RISE=2
*.measure tran T1_2 when v(q)=v(qb) CROSS=3
*.measure tran write_time_one param=('T1_2-T1_1')
*.measure tran I_vdd	find i(vdd2) at=25n
*.measure tran I_vbl find i(vbl) at=55n
*.IC QB=vdd2


*VRWL RWl 0 pulse(VDD2 0 1p 1p 1p 100n 125n)
*VWWL WWL 0 pulse(VDD2 0 1p 1p 1p 100n 125n)		
*VBLB BLB 0 pulse(VDD2 0 140n 1f 1f 100n 150n)
*VBL BL 0 pulse(VDD2 0 1f 1f 1f 45n 150n)
*.Tran .1n 350n 
*.VEC 'SRAM7.DVI'
.op
.print dc power	
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