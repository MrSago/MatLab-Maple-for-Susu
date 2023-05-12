clear all;

func=@(x) x;
kInt=@(x,s) 1/(3*x+s.^2+eps(x.^2));

a=0.0;
b=5.0;
h=0.01;
sx=a:h:b;

N=length(sx);
sy=func(sx);
ssy=sy;

figure(1);
eps=0.001;
teps=10.0;
while teps>eps
    for ix=1:1:N
        sy(ix)=func(sx(ix));
        for is=ix:1:N
            sy(ix)=sy(ix)-h*kInt(sx(ix),sx(is))*ssy(is);
        end
    end

    hold on
    plot(sx,sy,'-r');
    hold off;

    teps=norm(sy-ssy);
    ssy=sy;
end

hold on;
plot(sx,sy,'-b');
hold off;
