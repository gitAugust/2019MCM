function [D] = day(A,B,C,x,y)
%�����ڴ�abc���ܼ�ֵ������
location = [x;
           y;
           9,8,4,11,3];

% %ʹ������ī����ͶӰ��WGS84����ϵ�Ѿ�γ��ͶӰ��xy����ϵ
% mstruct=defaultm('mercator');
% %�����������ϵ
% mstruct.geoid=almanac('earth','wgs84','meters');
% mstruct=defaultm(mstruct);
% %����ϵ�任
% [location(1,:),location(2,:)] =projfwd(mstruct,location(1,:),location(2,:));
% location(1,:)=location(1,:)*1e-4;
% location(2,:)=location(2,:)*1e-4;
a=A(3);b=B(3);c=C(3);




D=0;
flightdis=35;
flag=1;
% while ((a>0&&b>0)&&c>0)&&flag~=0
while flag~=0
    flag=0;
    if (a>0&&b>0)&&c>0
%     global De;
%     De=0;
    for i=1:5
        flag(i)=0;
        a1=distance([location(1,i),location(2,i)],A);
        b1=distance([location(1,i),location(2,i)],B);
        c1=distance([location(1,i),location(2,i)],C);
        if a<b||a1>flightdis
            if b<c&&c1<flightdis
                c=c-location(3,i);
                flag(i)=1;
            elseif b1<flightdis
                b=b-location(3,i);
                flag(i)=1;
            elseif a1<flightdis
                a=a-location(3,1);
                flag(i)=1;
            else
                break
            end
        else 
            a=a-location(3,1);
            flag(i)=1;
        end
    end
    if flag==1
    D=D+1;
    end
end
% D=De;
end

