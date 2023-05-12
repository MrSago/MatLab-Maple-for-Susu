clear all;

for ix=1:1:31
    sx(ix)=(ix-1)*0.1;
    sy(ix)=f(sx(ix));
end

figure(1)
plot(sx, sy, ':sk', 'LineWidth', 2, 'MarkerFaceColor', 'r')

a=sx(1);
b=sx(31);
fa=f(a);
fb=f(b);
c = 1.0*(b*fa-a*fb)/(fa-fb);
fc = f(c);
epsilon = 0.00001;
counter = 0;
while (abs(fc)>epsilon)
   c=1.0*(b*fa-a*fb)/(fa-fb);
   fc=f(c);
   if fa*fc<0
       b=c;
       fb=fc;
   else
       a=c;
       fa=fc;
   end
   counter = counter + 1;
end

function y=f(x)
y=x.^5.-x-2;
end
