% тоже хуй знает 10 или 11 лаба

clear all;
x0 = 1;
xend = 5;
n = 125;
h = (xend - x0) / n;
%fnc(1) = 1.0;
sx(1) = x0;
Yexplict = 1.0;
Yimplict = 1.0;
for i = 2:n
    x = x0 + h * (i-1);
    Yexplict(i) = Yexplict(i-1) + ( (x * h) / (1 + x * Yexplict(i-1)) );
    z = Yimplict(i-1);
    Xnext = x0 + h * i;
    for j=1:10
        z = Yimplict(i-1) + h * (Xnext/(1 + Xnext * z));
    end
    Yimplict(i) = z;
    sx(i)=x;
end

figure(1);
plot(sx, Yexplict, '.r', sx, Yimplict, '.m');
legend ('Явное', 'Неявное');