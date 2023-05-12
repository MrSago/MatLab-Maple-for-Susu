clear all;
syms x;
f = sin(x.^2+1) - (3*x)/(1+x.^2);
c=0.0;
h=0.02;
ix=-100:1:100
sx=c+ix*h;
sy=double(subs(f,x,sx));

figure(1);
plot(sx,sy);
hold on;

df = diff(f,x,1);
b=20;
while abs(b) > 1.0e-6
    k=double(subs(df,x,c));
    b=double(subs(f,x,c))
    yLin=k*(x-c)+b;
    yL=double(subs(yLin,x,sx));
    c=c-b/k

    hold on
    plot(sx,yL, '-g');
    hold off
end
