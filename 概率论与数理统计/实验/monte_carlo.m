function s = monte_carlo(a, b, n)
t=rand(1,n);
x=a+(b-a)*t;
s=sum(monte_carlo_f(x));
s=s*(b-a)/n;
end

