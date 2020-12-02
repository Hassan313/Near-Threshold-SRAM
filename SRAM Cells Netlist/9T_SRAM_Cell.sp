******************* Bulk 9T ****
.options list node
.OPTION ACCURATE
.prot
.lib 'finfet.lib' ptm20hp
.unprot
.TEMP 25 100
.param vdd2=0.5
.param  Lb='lg'
.param vbl=0
*========== DVI parameters ==============
*.param	PER=5	*5 ns PERIOD
.param	PER=50	*50 ns PERIOD for 350mV
+		supplyVoltage='vdd2'
+		SLP='1E-5'
+		VH = 'VDD2*0.8'
+		VL = 'VDD2*0.1'
+		VARDELAY = 'PER*0.9'

+		ACSS_DEL = 'PER/16'
********************************************************************
xm1  WBL 	WWL  	Q  			0		nfet        L='Lg'    nfin=1
xm2  Q 		QB 		0   		0		nfet        L='Lg'    nfin=1
xm4  QB 	Q 		0			0		nfet        L='Lg'    nfin=1
xm3  Q 		QB 	 	vvdd2 		vdd2	Pfet        L='Lg'    nfin=1
xm5  WBLB 	WWL     QB 			0		nfet        L='Lg'    nfin=1
xm6  QB 	Q 	 	vvdd2 		vdd2	Pfet        L='Lg'    nfin=1
xm7	 d78	QB		0			0		NFET		L='lg'	  nfin=1
xm8	 RBL	RWL		D78			0		NFET		L='lg'	  nfin=1
xm9	 vvdd2	Q		VDD2		VDD2	PFET		L='lg'	  nfin=1

************************* DC SOURCES ********************************
vdd2  vdd2 	0 	vdd2
*VBLB BLB 	0 	vdd2
*VBL  BL 	0 	vbl
*Vwl  wl 	0 	vdd2
*VQ   Q 	0 	vdd2	
*VQB  QB 	0 	vdd2
***********************************************************
*=============================  TRANSIENT ====================
.measure tran T2 when v(q)=v(qb) CROSS=2
.MEASURE TRAN T1 WHEN V(WWL)='0.5*VDD2' RISE=2
.measure tran write_time1 param=('T2-T1')
.measure tran T4 when v(q)=v(qb) CROSS=1
.MEASURE TRAN T3 WHEN V(WWL)='0.5*VDD2' RISE=1
.measure tran write_time0 param=('T4-T3')
.PARAM T01='PER*3E-9+SLP*4E-9'
.PARAM T02='PER*4E-9'
.PARAM T11='PER*6E-9+SLP*4E-9'
.PARAM T12='PER*7E-9'
.IC QB=vdd2
.Tran 1p 'PER*9E-9'
.VEC 'SRAM9.DVI'
 *========Alters=============== 
 .prot
 .alter lstp20
 .del lib 'finfet.lib' ptm20hp
 .lib 'finfet.lib' ptm20lstp
 .unprot
 *==============================
 .prot
 .alter hp16
 .del lib 'finfet.lib' ptm20lstp
 .lib 'finfet.lib' ptm16hp
 .unprot
 *===============================
 .prot
 .alter lstp16
 .del lib 'finfet.lib' ptm16hp
 .lib 'finfet.lib' ptm16lstp
 .unprot
 *================================
  .prot
 .alter hp14
 .del lib 'finfet.lib' ptm16lstp
 .lib 'finfet.lib' ptm14hp
 .unprot
 *=================================
  .prot
 .alter lstp14
 .del lib 'finfet.lib' ptm14hp
 .lib 'finfet.lib' ptm14lstp
 .unprot
 *=================================
 .prot
 .alter hp10
 .del lib 'finfet.lib' ptm14lstp
 .lib 'finfet.lib' ptm10hp
 .unprot
 *=================================
  .prot
 .alter lstp10
 .del lib 'finfet.lib' ptm10hp
 .lib 'finfet.lib' ptm10lstp
 .unprot
 *=================================
 .prot
 .alter hp7
 .del lib 'finfet.lib' ptm10lstp
 .lib 'finfet.lib' ptm7hp
 .unprot
 *=================================
 .prot
 .alter lstp7
 .del lib 'finfet.lib' ptm7hp
 .lib 'finfet.lib' ptm7lstp
 .unprot
 *================================
.end





