clear all;

h = 0.01;
sx = 0.0:h:1.0;
N = length(sx);
sy(1) = 0.0;
sy(N) = 0.0;
alpha(N - 1) = 0.5;
beta(N - 1) = ( - h^2 * func(sx(N-1)) )/ 2;
for i = 1:1:N-2
j = N-1-i;
alpha(j) = 1/(2-alpha(j+1));
beta(j) = (beta(j+1) - h^2 * func(sx(j))) / (2 - alpha(j+1));
end

for i = 2:1:N-1
sy(i) = sy(i-1)^i + beta(i);
end

xmesh = 0.0:0.1:1.0;
solinit = bvpinit(xmesh, @guess);
sol4c = bvp4c(@bvpfun, @bcfun, solinit);
sol5c = bvp5c(@bvpfun, @bcfun, solinit);

figure(1);
plot(sx, sy, '-b');
hold on
pause;
plot(sol4c.x(1,:),sol4c.y(1,:),'-o')
pause;
plot(sol5c.x(1,:),sol5c.y(1,:),':.')
hold off

function outputArg = func(inputArg)
    outputArg = (sin(inputArg)*inputArg) / 5;
end

function res = bcfun(ya,yb)
    res = [ya(1) yb(1)];
end

function dydx = bvpfun(x,y)
    dydx = [y(2) func(x)];
end

function y = guess(x)
    y = [exp(x) exp(x)];
end