%хуй знает что это мб метод наименьших квадратов (лаба 9)

clear all;
%x = [0.1 0.3 0.45 0.5 0.79 1.1 1.89 2.4 2.45];
%y = [-3 -1 0.9 2.4 2.5 1.9 0.1 -1.3 -2.6];
x0 = 0;
xl = 2.45;
h = 0.1;
sx = x0:h:xl;
n = length(sx);
sy = 0.5 * sx + 0.2;
%sy2 = 0:0.1:2.45;
for i = 1:1:n
    sy2(i) = sy(i) + (0.5-rand()*0.4);
end

sx2 = sx.^2;

sxsy = sx.*sy;

b = (sum(sxsy) - (sum(sy) / sum(sx)) * sum(sx2)) / (-n/sum(sx)*sum(sx2) + sum(sx));

k = sum(sy) / sum(sx) - b * n / sum(sx);