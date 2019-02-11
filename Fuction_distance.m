function [dis] = distance(A,B)
%count the distance between A and B
DX=(A(1)-B(1));
DY=(A(2)-B(2));
dis=sqrt(DX^2+DY^2);
end

