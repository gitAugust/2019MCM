clc,clear

location = [18.33,18.22,18.44,18.40,18.47;
           -65.65,-66.03,-66.07,-66.16,-66.73;
           9,8,4,11,3];
%使用正轴墨卡托投影和WGS84坐标系把经纬度投影到xy坐标系
mstruct=defaultm('mercator');
%定义地球坐标系
mstruct.geoid=almanac('earth','wgs84','meters');
mstruct=defaultm(mstruct);
%坐标系变换
[location(1,:),location(2,:)] =projfwd(mstruct,location(1,:),location(2,:));
x=location(1,:)*1e-4;
y=location(2,:)*1e-4;

xa = -7.45e02 + (-7.40e02+7.45e02).*rand();
xb = -7.40e02 + (-7.32e02+7.40e02).*rand();
xc = -7.32e02 + (-7.27e02+7.32e02).*rand();
ya= 2.1e02 + (2.05e02-2.1e02).*rand();
yb= 2.1e02 + (2.02e02-2.1e02).*rand();
yc= 2.1e02 + (2.02e02-2.1e02).*rand();
a=3000;b=3000;c=3000;
A=[xa,ya,a]; B=[xb,yb,b]; C=[xc,yc,c];

hold on
plot(xa,ya,'*');
plot(xb,yb,'*');
plot(xc,yc,'*');

iter=100;               %内部蒙特卡洛循环迭代次数
temperature=1;      %初始温度
len(1)=day(A,B,C,x,y); 
l=1;%统计迭代次数
% fD(1)=day(A,B,C);%每次迭代后的路线长度 

while temperature>0.001     %停止迭代温度
    
    for i=1:iter     %多次迭代扰动，一种蒙特卡洛方法，温度降低之前多次实验
        len1=day(A,B,C,x,y);         %计算原路线总距离
        [tA,tB,tC]=perturb(A,B,C);      %产生随机扰动
        len2=day(tA,tB,tC,x,y);     %计算新路线总距离
        
        delta_e=len2-len1;  %新老距离的差值，相当于能量
        if delta_e>0       %新路线好于旧路线，用新路线代替旧路线
           A=tA;B=tB;C=tC;
         
        else                        %温度越低，越不太可能接受新解；新老距离差值越大，越不太可能接受新解
            if exp(-delta_e/temperature)>rand() %以概率选择是否接受新解
                   A=tA;B=tB;C=tC;     %可能得到较差的解
           
            end
        end        
    end
    l=l+1;
    len(l)=day(A,B,C,x,y);   %计算新路线距离
    temperature=temperature*0.99;   %温度不断下降
end  
y=size(len);

figure(2);
plot(1:y(2),len,'*');
figure(3)
load str;
plot(x,y,'*');
for i=1:5
text(x(i),y(i),cellstr(str(i)))
end

hold on

axy=projinv(mstruct,-7.40e6,2.069e6);
bxy=projinv(mstruct,-7.343e6,2.067e6);
cxy=projinv(mstruct,-7.316e6,2.056e6);
plot(axy(1),axy(2),'p','Markersize',15)
plot(bxy(1),bxy(2),'p','Markersize',15)
plot(cxy(1),cxy(2),'p','Markersize',15)

plot(xa,ya,'.','Markersize',25);
plot(xb,yb,'.','Markersize',25);
plot(xc,yc,'.','Markersize',25);

