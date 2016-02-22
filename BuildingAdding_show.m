A = [ 0 0 1 0 0 0;
      0 0 1 1 1 0;
      0 1 1 0 1 1;
      1 1 1 1 1 0;
      0 0 1 1 1 0;
      0 1 0 1 0 0];
 B = [0 0 0 0 0;
      0 0 1 0 0;
      0 1 1 1 0;
      0 1 1 1 1;
      0 1 1 0 0];

sm = 15;  
a = zeros(sm);
d = a;
a(3:8,3:8) = A;

d(10:14, 10:14) = B;
c = ones(sm);
b = zeros(sm);

figure(1)
image(cat(3, a+d, b, c));
axis square off; 
text(6,6.6, 'A');
text(11.5,13, 'B');

x=2:sm-1;
y=x;

sum = zeros(size(a));
sum(x,y) = a(x, y-1) + a(x, y+1) + ...
           a(x-1, y) + a(x+1, y) + ...
           a(x-1, y-1) + a(x-1, y+1) + ... 
           a(x+1, y-1) + a(x+1, y+1);

b_idx = (sum>0 & not(a>0));
c(b_idx) = 0;
b(b_idx) = 1;
a(b_idx) = 1;



figure(2)
image(cat(3, a+d, b, c));

[idx_r, idx_c, v] = find(b_idx);
for i=1:length(idx_r)
    text(idx_c(i)-0.1,idx_r(i), num2str(sum(idx_r(i),idx_c(i))));
end
text(6,6.6, 'A');
text(11.5,13, 'B');

axis square off; 
       
       