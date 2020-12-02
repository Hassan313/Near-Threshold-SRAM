function MySNM = run_FinFET_Monte(fnameq, fnameqb)
 fid = fopen('sram_result.txt', 'w');
 x = loadsig(fnameq);
 vq = evalsig(x,'v_q');
 y = loadsig(fnameqb);
 vqb = evalsig(y,'v_qb');
 vdd = evalsig(x,'v_qb');

 for i = 1:100,
	vqbb = vqb(:,i);
	vqq = vqbb;
	vddd = vdd(:,i)
	[xout, yout] = intersections(vddd,vqbb,vqq,vddd,1);
	NumberofIntersections = size(xout,1);
	if(NumberofIntersections == 3)
		MySNM = 1000 * snm(vddd, vqq, vqbb);
	else 
		disp('There is no HSNM (No Intersections)');
		MySNM = -1;    
	fprintf(fid, '%f\n', MySNM)
end
 fclose(fid);
 quit;
