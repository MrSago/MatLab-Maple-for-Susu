function y=xf(x,n)
    sum=0.0;
    for ix=0:n
        sum=sum+x.^ix;
    end
    y=sum;
end