******************* Bulk 5T *****************************
.options list node
.option post=1
*.option probe
.prot
.lib 'finfet.lib' ptm20hp
.unprot
.TEMP 25 100
.param vdd2=0.4
.param  Lb='lg'
.param vardelay=1n
.param slp=0
.param vh=0.9*vdd2
.param vl=0.1*vdd2
.param per=15
*Bulk FinFET
*========== DVI parameters =====================
*.param	PER=5	*5 ns PERIOD
*.param	PER=50	*50 ns PERIOD for 350mV
*+		supplyVoltage='vdd2'
*+		SLP='PER/16'
*+		VH = 'VDD2*0.9'
*+		VL = 'VDD2*0.1'
*+		VARDELAY = 'PER*0.9'
*+		ACSS_DEL = 'SLP'
*=============================================== 
*****************************************************************************
xm1 	Q 		QB  	0  			0			nfet    	L='Lg'    nfin=1
xm2 	QB 		Q    	0 			0			nfet       	L='Lg'    nfin=1
xm3 	Q 		QB 		vdd2   		vdd2		pfet       	L='Lg'    nfin=1
xm4 	QB 		Q 		vdd2		vdd2		pfet       	L='Lg'    nfin=1
xm5 	BL 		WWL 	Q			0			nfet       	L='Lg'    nfin=1
xm6		BLB		WWL		QB			0			nfet		L='Lg'    nfin=1		
xm7 	X		QB		0			0 			nfet		L='Lg'    nfin=1
xm8		RDBL	RWL		X			0			nfet		L='Lg'    nfin=1
*****************************************************************************
************************* DC SOURCES ****************************************
vdd2  	vdd2 	0 	vdd2
vBL  	BL 		0 	vdd2
vBLB 	BLB 	0 	vdd2
vWL  	WWL 	0 	0
vRWL	RWL		0	0
vRDBL	RDBL	0	vdd2
vQ   	Q 		0 	0	
*vQB  	QB 		0 	vdd2
*.nodeset v(Q)=0
*******************************************
.dc  vQ		0 	vdd2 	0.01
*.dc vwl 0 vdd2 0.01 
*******************************************
*=============================  TRANSIENT ====================
*.MEASURE TRAN T0_1 WHEN V(WWL)='0.5*VDD2' RISE=1
*.measure tran T0_2 when v(q)=v(qb) CROSS=1
*.measure tran write_time_zero param=('T0_2-T0_1')
*.MEASURE TRAN T1_1 WHEN V(WWL)='0.5*VDD2' RISE=2
*.measure tran T1_2 when v(q)=v(qb) CROSS=2
*.measure tran write_time_one param=('T1_2-T1_1')
*.measure tran I_vdd	find i(vdd2) at=25n
*.measure tran I_vbl find i(vbl) at=55n
*.IC QB=vdd2

*.measure dc vw when v(Q)=v(QB) cross=1
*.measure  WM param='vdd2-vw'
*VRWL RWl 0 pulse(VDD2 0 1p 1p 1p 100n 125n)
*VWWL WWL 0 pulse(VDD2 0 1p 1p 1p 100n 125n)		
*VBLB BLB 0 pulse(VDD2 0 140n 1f 1f 100n 150n)
*VBL BL 0 pulse(VDD2 0 1f 1f 1f 45n 150n)
*.Tran .1n 350n 
*.VEC 'SRAM61.DVI'
.op
*.print dc power	
 *=========================== Alters =========================
*******************************************
 .prot
 .alter lstp20
 .del lib 'finfet.lib' ptm20hp
 .lib 'finfet.lib' ptm20lstp
 .unprot
 *============================================================
 *============================================================
 .prot
 .alter hp16
 .del lib 'finfet.lib' ptm20lstp
 .lib 'finfet.lib' ptm16hp
 .unprot
 *============================================================
  .prot
 .alter lstp16
 .del lib 'finfet.lib' ptm16hp
 .lib 'finfet.lib' ptm16lstp
 .unprot
 *============================================================
 *============================================================
  .prot
 .alter hp14
 .del lib 'finfet.lib' ptm16lstp
 .lib 'finfet.lib' ptm14hp
 .unprot
 *============================================================
  .prot
 .alter lstp14
 .del lib 'finfet.lib' ptm14hp
 .lib 'finfet.lib' ptm14lstp
 .unprot
 *============================================================
 *============================================================
 .prot
 .alter hp10
 .del lib 'finfet.lib' ptm14lstp
 .lib 'finfet.lib' ptm10hp
 .unprot
 *============================================================
  .prot
 .alter lstp10
 .del lib 'finfet.lib' ptm10hp
 .lib 'finfet.lib' ptm10lstp
 .unprot
 *============================================================
  *============================================================
 .prot
 .alter hp7
 .del lib 'finfet.lib' ptm10lstp
 .lib 'finfet.lib' ptm7hp
 .unprot
 *============================================================
 .prot
 .alter lstp7
 .del lib 'finfet.lib' ptm7hp
 .lib 'finfet.lib' ptm7lstp
 .unprot
 *============================================================
.end
