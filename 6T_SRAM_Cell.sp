******************* Bulk 6T *****************************
.options list node
.option post=1
.prot
.lib 'finfet.lib' ptm20hp
.unprot
.TEMP 25 100
.param vdd2=0.5
*.param Wb=48nm
.param  Lb='lg'
*Bulk FinFET 
*************************************************************
xm1 BL 	WL  	Q  			0		nfet        L='Lg'    nfin=1
xm2 BLB WL    	QB 			0		nfet        L='Lg'    nfin=1
xm3 Q 	QB 		0   		0		nfet        L='Lg'    nfin=1
xm4 QB 	Q 		0			0		nfet        L='Lg'    nfin=1
xm5 Q 	QB 	 	vdd2 		vdd2	Pfet        L='Lg'    nfin=1
xm6 QB 	Q 	 	vdd2 		vdd2	Pfet        L='Lg'    nfin=1
************************* DC SOURCES ********************************
vdd2  vdd2 	0 	vdd2
VBLB BLB 	0 	0
VBL  BL 	0 	vdd2
Vwl  wl 	0 	0
*VQ   Q 		0 	vdd2	
*VQB  QB 	0 	vdd2
.nodeset v(QB)=vdd2
***********************************************************
*.dc vqb 0 vdd2 0.01
************************************************************
.dc vwl 0 vdd2 0.0001
*=============================  TRANSIENT ====================
*.measure tran T2 when v(q)=v(qb) CROSS=2
*.MEASURE TRAN T1 WHEN V(WL)='0.5*VDD2' RISE=2
*.measure tran write_time param=('T2-T1')
*.IC QB=1
*.Tran .1n 350n 
*.VEC 'SRAM6.DVI'
.measure dc vw when v(Q)=v(QB) cross=1
.measure  WM param='vdd2-vw'
.op
 *=========================== Alters =========================
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





