clc;
y=imread('googlemap.jpg'); %读取该图
imshow(y); %显示该图
set(gcf,'outerposition',get(0,'screensize')); %使该图显示最大化，便于取点
[x0,y0] = ginput; %利用鼠标取点，按回车键结束。
%这个时候可以顺序点取图中坐标轴的，左下，左上，右上，右下四个点。
%存取角点坐标信息
save corner.mat x0 y0
%开始撷取其中一条实线上的点，按你需要的精度，点取任意多的点，回车结束
[x1,y1] = ginput;
%重画
%因为屏幕坐标是从左上角为坐标原点开始的，需要做些变换
%四个角点对应的坐标为（0，0） （0，4），（8，4），（8，0）
% x1 = (x1-min(x0))*8.0/(max(x0)-min(x0));
% y1 = (y1-max(y0))*4.0/(min(y0)-max(y0));

hold on
plot(x1,y1,'*','Markersize',10);
axis equal;