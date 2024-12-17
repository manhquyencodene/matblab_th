clc ;
clear;
n = 20 ; 
p = 0.1 ; 
x = binornd(1,p*ones(n,1));
xp = reshape([x(1:2:n-1) x(2:2:n)],n/2,2);
t = bi2de(xp,'left-msb');
sig = t + 1 ; 
symbols = [1 2 3 4];
prob = [(1-p)*(1-p), p*(1-p), (1-p)*p, p*p];
dict = huffmandict(symbols, prob);
hcode = huffmanenco(sig,dict);
dhsig = huffmandeco(hcode,dict);
th = dhsig - 1 ; 
sph = de2bi(th,2,'left-msb');
xh = zeros(1,n);
for i = 1:1:n/2 
    xh(2*i-1) = sph(i,1);
    xh(2*i) = sph(i,2);
end
xh 