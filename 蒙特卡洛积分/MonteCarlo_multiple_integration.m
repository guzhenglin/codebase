a=1;        %选定维度的下限
b=5;        %上限
 
x=a:0.001:b;
 
c=floor(min(g(x)));          
d=ceil(max(h(x)));          %次变量的上下限
n=1000000;                    
sum=0;      %总面积

for i = 1:n
    X=unifrnd(a,b);
    Y=unifrnd(c,d);
    if Y >= g(X) && Y <= h(X)
        sum=sum+f(X,Y);
    end
end
s=sum/n;    %平均面积
result=(b-a)*(d-c)*s       %积分结果
 

 
function g=g(x)   %第二变量下限
g=sqrt(x);
end

function h=h(x)     %y第二变量上限
h=x;
end

function f=f(x,y)   %被积函数
f=x*y; 
end

