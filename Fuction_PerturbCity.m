function [A,B,C]=perturb(A,B,C)
%UNTITLED 此处显示有关此函数的摘要
xa=A(1)+1*randn();
xb=B(1)+1*randn();
xc=C(1)+1*randn();
ya=A(2)+1*randn();
yb=B(2)+1*randn();
yc=C(2)+1*randn();

if xa<-7.37e02&&xa>-7.45e02
else xa = -7.45e02 + (-7.37e02+7.45e02).*rand();
end
A(1)=xa;A(2)=ya;


if xb<-7.32e02&&xb>-7.37e02
else xb = -7.37e02 + (-7.32e02+7.37e02).*rand();
end
B(1)=xb;B(2)=yb;

if xc<-7.27e02&&xc>-7.3202
else xc = -7.32e02 + (-7.27e02+7.32e02).*rand();
end
C(1)=xc;C(2)=yc;

end

