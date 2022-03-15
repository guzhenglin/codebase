l=0.5;      
a=1;        
N=1000;     
n=0;        

x=[0:2];
for i=[0,1,2]
    y=a*i*ones(1,3);
    plot(x,y,'black','LineWidth',2);
    hold on;
end
axis([-1,3,-1,2*a+1]);

for j=1:N
    x1=rand(1)*2;
    y1=rand(1)*2;  
    x0=rand(1)*l-l/2;
    x2=x1+x0;
    y2=y1+sqrt((l/2)*(l/2)-x0*x0);
    x3=x1-x0;
    y3=y1-sqrt((l/2)*(l/2)-x0*x0);
    plot([x2,x3],[y2,y3],'red');
    hold on;
    d=rem(y1,a);
    if(d<=0.5*a)                 
        if(d<sqrt((l/2)*(l/2)-x0*x0))
            n=n+1;
        end
    else
        d=a-d;
        if(d<sqrt((l/2)*(l/2)-x0*x0))
            n=n+1;
        end
    end
end
pisimul=4*a*n/(l*N)            
