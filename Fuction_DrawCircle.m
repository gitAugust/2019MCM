function [] = plot0( x,y,r )
hold on
r=r*[ones(size(x))];
theta=0:pi/100:200*pi;
for i=1:length(x)
X=x(i)+r(i)*cos(theta);
Y=y(i)+r(i)*sin(theta);
plot(X,Y,'-',x(i),y(i),'.');
hold on;
axis square;    
end
end
