function mysnm = run_finfet_6T(fnameq, fnameqb)

fid = fopen('sram_result.txt', 'w');

x = loadsig(fnameq);
vq = x(5).data;

y = loadsig(fnameqb);
vqb = y(6).data;

vdd = y(5).data;

%plot(vdd, vq);
%hold on;
%plot(vqb, vdd);
mysnm = snm(vdd,vq,vqb);
fprintf(fid, '%.4f\n', mysnm);
fclose(fid);
quit;