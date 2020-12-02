* Temporary parameter list file for ITRS 2011 ver2 models
.lib 20nm
.param vdd=0.9
.param vddp=-0.9
.param fin_height=28n
.param fin_width=15n
.param lg=24n
.param fin_width_loc=gauss(fin_width,0.1,3)
.param fin_width_glob=fin_width_loc
.param lg_loc=gauss(lg,0.1,3)
.param lg_glob=lg_loc
.endl

.lib 16nm
.param vdd=0.85
.param vddp=-0.85
.param fin_height=26n
.param fin_width=12n
.param lg=20n
.param fin_width_loc=gauss(fin_width,0.1,3)
.param fin_width_glob=fin_width_loc
.param lg_loc=gauss(lg,0.1,3)
.param lg_glob=lg_loc
.endl

.lib 14nm
.param vdd = 0.8
.param vddp = -0.8
.param fin_height = 23n
.param fin_width = 10n
.param Oxi_thick = 1.3n
.param lg = 18n
.param fin_width_loc = gauss(fin_width,0.5,3)
.param fin_width_glob = fin_width_loc
.param fin_height_loc = gauss(fin_height,0.5,3)
.param fin_height_glob = fin_height_loc
.param Oxi_thick_loc = gauss(Oxi_thick,0.5,3)
.param Oxi_height_glob = Oxi_thick_loc
.param lg_loc = gauss(lg,0.15,3)
.param lg_glob = lg_loc


.endl

.lib 10nm
.param vdd=0.75
.param vddp=-0.75
.param fin_height=21n
.param fin_width=9n
.param lg=14n
.param fin_width_loc=gauss(fin_width,0.1,3)
.param fin_width_glob=fin_width_loc
.param lg_loc=gauss(lg,0.1,3)
.param lg_glob=lg_loc
.endl

.lib 7nm
.param vdd=0.7
.param vddp=-0.7
.param fin_height=18n
.param fin_width=7n
.param lg=11n
.param fin_width_loc=gauss(fin_width,0.1,3)
.param fin_width_glob=fin_width_loc
.param lg_loc=gauss(lg,0.1,3)
.param lg_glob=lg_loc
.endl

