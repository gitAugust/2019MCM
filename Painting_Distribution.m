clc,clear

load str
location = [18.33,18.22,18.44,18.40,18.47;
           -65.65,-66.03,-66.07,-66.16,-66.73];

%使用正轴墨卡托投影和WGS84坐标系把经纬度投影到xy坐标系
mstruct=defaultm('mercator');
%定义地球坐标系
mstruct.geoid=almanac('earth','wgs84','meters');
mstruct=defaultm(mstruct);
%坐标系变换
[x,y] =projfwd(mstruct,location(1,:),location(2,:));

figure(1)
% str={'M1*1 M3*3';'M1*2 M3*1';'M1*1 M2*1';'M1*2 M2*1 M3*2';'M1*1'};
hold on;
plot(x,y,'pr','Markersize',15)
for i=1:5
text(x(i),y(i),cellstr(str(i)))
end

plot(-7.461e6,2.048e6,'.k','Markersize',25)
 plot(-7.401e6,2.047e6,'.k','Markersize',25)
 plot(-7.335e6,2.045e6,'.k','Markersize',25)
 x1=[-7.461e6,-7.401e6,-7.335e6];
 y1=[2.048e6,2.047e6,2.045e6,];
 container={'A Container','B Container','C Container'};
for i=1:3
text(x1(i)-50,y1(i)-20,cellstr(container(i)))
end
% plot0(x,y,3.5e+4);
% axis equal