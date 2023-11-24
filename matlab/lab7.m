clear all;

xS = [0 1 2 3 4];

yS = log(xS + 1);
xR = xS(1):0.01:xS(5);
yR = exp(xR - 3);
yRinterp = spline(xS, yS, xR);

figure(1)
plot(xS, yS, 's', 'MarkerSize', 10)

hold on
plot(xR, yR, '-b')
hold off

hold on
plot(xR, yRinterp, ':.')
hold off

for i=1:5
    for j=1:5
        X(i,j) = xS(i)^(j-1);
    end
end

A = inv(X)*yS';
yZ = A(1) + xR.^1*A(2) + xR.^2*A(3) + xR.^3*A(4) + xR.^4*A(5);

hold on
plot(xR, yZ, '-g')
hold off