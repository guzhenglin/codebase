l=0.5;      %针的长度
a=1;        %平行线间距
N=1000;     %投针总次数
n=0;        %针与平行线相交的次数
%绘制平行线
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
    angel=rand(1)*pi;
    x2=x1+0.5*l*cos(angel);
    y2=y1+0.5*l*sin(angel);
    x3=x1-0.5*l*cos(angel);
    y3=y1-0.5*l*sin(angel);
    plot([x2,x3],[y2,y3],'red');
    hold on;
    center=(y2+y3)/2;
    d=rem(center,a);
    if(d<=0.5*a)
        if(d<0.5*sin(angel))
            n=n+1;
        end
    else
        d=a-d;
        if(d<0.5*sin(angel))
            n=n+1;
        end
    end
end
pisimul=2*l*N/a/n;

