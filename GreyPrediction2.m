%function GreyPrediction2
clear

y=[1,0.500000000000000,0.333333333333333,0.400000000000000,0.285714285714286,0.222222222222222,0.307692307692308,0.133333333333333,0.0625000000000000,0.111111111111111,0.0526315789473684,0.136363636363636,0.0833333333333333,0.111111111111111,0.0689655172413793];
n=length(y); 
yy=ones(n,1); 
yy(1)=y(1); 
for i=2:n  
    yy(i)=yy(i-1)+y(i) 
end
B=ones(n-1,2); 
for i=1:(n-1)  
    B(i,1)=-(yy(i)+yy(i+1))/2; 
    B(i,2)=1; 
end
BT=B';  
for j=1:(n-1) 
    YN(j)=y(j+1); 
end
YN=YN';  
A=inv(BT*B)*BT*YN; 
a=A(1); 
u=A(2); 
t=u/a;  
t_test=2;
i=0:t_test+n;  
yys(i+1)=(y(1)-t).*exp(-a.*i)+t; 
%yys(1)=y(1);  
for j=n+t_test+1:-1:2
    ys(j-1)=yys(j)-yys(j-1); 
end
%ys(1)=y(1);
x=1:n;
xs=1:n+t_test; 
yn=ys(1:n+t_test); 
figure
plot(x,y,'r',xs,yn,'*-b'); 
det=0; 
for i=2:n  
    det=det+abs(yn(i)-y(i)); 
end
det=det/(n-1);  
disp(['百分绝对误差为：',num2str(det),'%']); 
disp(['预测值为：',num2str(ys(n+1:n+t_test))]);