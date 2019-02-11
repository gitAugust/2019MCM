y=imread('googlemap.jpg'); %¶ÁÈ¡¸ÃÍ¼

for i=1:1228
    for j=1:3284
        if (y(i,j,1)>=230&&y(i,j,2)>=200)&&y(i,j,3)<=180
           y(i,j,:)=0;
           y(i,j,1)=247;
       y(i,j,2)=242;
       y(i,j,3)=115;
        else
            y(i,j,:)=255;
        end
    end
end

imshow(y);
hold on
load matlab
% load y1
% load x2
% load y2
hold on
plot(x1,y1,'.k','Markersize',25);
plot(x2,y2,'pr','Markersize',15);
load str;
for i=1:5
text(x2(i)-50,y2(i)-20,cellstr(str(i)))
end
container={'A Container','B Container','C Container'};
for i=1:3
text(x1(i)-50,y1(i)-20,cellstr(container(i)))
end
title('road networks ','FontSize',14,'FontWeight','Bold')
axis equal;