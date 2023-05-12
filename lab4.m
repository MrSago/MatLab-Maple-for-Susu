clear all;

x=0.1:0.1:0.9;
N=length(x);
h=0.1;
for ix=1:1:N
    y(ix)=integral(@xff,0,x(ix));
    y2(ix)=integral(@xf2,0,x(ix));
    y3(ix)=integral(@xf3,0,x(ix));
    sum=0.0;
    for jx=1:1:ix-1
        sum=sum+1./(1-jx*h)*h;
    end
    y1(ix)=sum;
end

figure(1)

plot(x,y,'-r')
hold on
plot(x,y1,'-k')
hold off
hold on
plot(x,y2,'-b')
hold off;
hold on;
plot(x,y3,'-m')
hold off;

function y=xff(x)
    sum=0.0;
    for ix=0:10
        sum=sum+x.^ix;
    end
    y=sum;
end

function y=xf2(x)
    sum=0.0;
    for ix=0:6
        sum=sum+x.^ix;
    end
    y=sum;
end

function y=xf3(x)
    sum=0.0;
    for ix=0:4
        sum=sum+x.^ix;
    end
    y=sum;
end