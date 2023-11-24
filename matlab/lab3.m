clear all;

x=0.1:0.1:0.9;

y1=1./(1-x);
y2=xf(x,2);
y4=xf(x,4);
y8=xf(x,8);

figure(1)

plot(x,y1,'black');
hold on;
plot(x,y2,'-r')
hold off;
hold on;
plot(x,y4,'-g')
hold off;
hold on;
plot(x,y8,'-m')
hold off;
legend('Сумма числового ряда','Первое схождение', 'Второе схождение', 'Третье схождение', 'Location','northwest')
