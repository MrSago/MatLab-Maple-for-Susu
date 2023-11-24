clear all;

xs=[-4 -1 -0.5 -0.3 0 0.1 2 ];
ys=exp(-xs.^2)
xx=linspace(xs(1),xs(length(xs)),100);
yy=lagrange(xs,ys,xx);
plot(xs,ys,'or',xx,yy,'b')
grid on

function [L_n P]=lagrange(x,y,xx)
    L_n=zeros(size(xx));
    for k=1:length(x)
        P=ones(length(x),length(xx));
        for i=1:length(x)
            if k~=i
                P(k,:)=P(k,:).*(xx-x(i))./(x(k)-x(i));
            end
        end
        L_n=L_n+y(k)*P(k,:);
    end
end