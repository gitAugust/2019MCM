clc,clear

location = [18.33,18.22,18.44,18.40,18.47;
           -65.65,-66.03,-66.07,-66.16,-66.73;
           9,8,4,11,3];
%ʹ������ī����ͶӰ��WGS84����ϵ�Ѿ�γ��ͶӰ��xy����ϵ
mstruct=defaultm('mercator');
%�����������ϵ
mstruct.geoid=almanac('earth','wgs84','meters');
mstruct=defaultm(mstruct);
%����ϵ�任
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

iter=100;               %�ڲ����ؿ���ѭ����������
temperature=1;      %��ʼ�¶�
len(1)=day(A,B,C,x,y); 
l=1;%ͳ�Ƶ�������
% fD(1)=day(A,B,C);%ÿ�ε������·�߳��� 

while temperature>0.001     %ֹͣ�����¶�
    
    for i=1:iter     %��ε����Ŷ���һ�����ؿ��巽�����¶Ƚ���֮ǰ���ʵ��
        len1=day(A,B,C,x,y);         %����ԭ·���ܾ���
        [tA,tB,tC]=perturb(A,B,C);      %��������Ŷ�
        len2=day(tA,tB,tC,x,y);     %������·���ܾ���
        
        delta_e=len2-len1;  %���Ͼ���Ĳ�ֵ���൱������
        if delta_e>0       %��·�ߺ��ھ�·�ߣ�����·�ߴ����·��
           A=tA;B=tB;C=tC;
         
        else                        %�¶�Խ�ͣ�Խ��̫���ܽ����½⣻���Ͼ����ֵԽ��Խ��̫���ܽ����½�
            if exp(-delta_e/temperature)>rand() %�Ը���ѡ���Ƿ�����½�
                   A=tA;B=tB;C=tC;     %���ܵõ��ϲ�Ľ�
           
            end
        end        
    end
    l=l+1;
    len(l)=day(A,B,C,x,y);   %������·�߾���
    temperature=temperature*0.99;   %�¶Ȳ����½�
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

