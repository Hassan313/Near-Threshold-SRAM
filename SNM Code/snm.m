function snm=snm(x,y,z)
% x is the swept node from 0 to vdd ad y and z are q and qb
u1=1/sqrt(2)*(y-x);
u2=1/sqrt(2)*(x-z);
v1=1/sqrt(2)*(y+x);
v2=1/sqrt(2)*(z+x);
u=(-1/sqrt(2):0.001:1/sqrt(2));
v11=spline(u1,v1,u);
v22=spline(u2,v2,u);
vd=(v11-v22)/sqrt(2);
d=abs(diff(vd)./diff(u));
d=[d,d(length(d))];
% plot(u,[d],u,vd)
% %initial guess
% % m1=max(x);
% % m2=m1; 
% for i = 707 :1414
%     if abs(d(i))<0.01
%         m1=vd(i);
%         break;
%     end
% end
% 
% for j = 706 :-1:1
%     if abs(d(j))<0.01
%         m2=vd(j);
%         break;
%     end
% end
utable=sortrows([u',vd',d'],3); % find the minimums of derivation
utable=utable(1:7,:);%select 7 point of the minimums
extermums=utable(:,2);
us=utable(:,1);
% extermums=vd(d<3e-2*min(mean(d))); %find y of extermums
% us=u(d<3e-2*min(mean(d))); %find x of extermums

ep=extermums(us>0); %right side extermums
em=extermums(us<0);%left side extermums
[C1,us_min_ind1]= min(us(us>0)); % the nearest right side extermum
[C2,us_min_ind2]= min(-us(us<0)); % the nearest left side extermum
if(~isempty(us_min_ind1))
    snm1=abs(ep(us_min_ind1));
else
    snm1=inf;
end
if(~isempty(us_min_ind2))
    snm0=abs(em(us_min_ind2));
else
    snm0=inf;
end


snm=min(snm1,snm0);



% snm=min(abs(m1),abs(m2));
