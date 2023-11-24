clear all;

syms x y;

f1 = x^2 + y - x^3 - y^2 + 4;
f2 = exp(x) + y - y^2*y;

figure(1);
fc1 = ezplot(f1);
set(fc1,'Color','g')
hold on;
fc2 = ezplot(f2);
set(fc2,'Color','y')
hold off;

xc = 2;
xy = 2;

J = [[diff(f1,x) diff(f1,y)]; [diff(f2,x) diff(f2,y)]];
B = [f1 f2];

Xc(1) = xc;
Xc(2) = xy;
eps=10000000;

while eps>1.0e-6
    Xc=Xc-double(subs(inv(J)*B', [x y], Xc))'
    eps1=double(subs(B, [x y], Xc));
    eps=sqrt(eps1*eps1')
end