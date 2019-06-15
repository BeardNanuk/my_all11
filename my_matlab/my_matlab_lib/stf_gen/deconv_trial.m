b = [2 7 4 9];
a = [1 0 1];
[q,r] = deconv(b,a)

cqa=conv(q,a)

cqr=conv(q,a) + r 

% x = [1 8 3 2 5]
% 
% h = [3 5 2]

r = [q zeros(1,length(a)-1)]
c = [q(1) zeros(1,length(a)-1)]

xConv = toeplitz(c,r)
adotxConv=a*xConv