clear all;

x=8.0:0.1:9.0;
y1=xf(x);
figure(1)
plot(x,y1,'-xblack');
hold on;

function y=xf(x)
    y=x.^3-9*x.^2+5*x-6;
end