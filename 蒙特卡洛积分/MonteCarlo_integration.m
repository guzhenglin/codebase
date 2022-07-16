a=0;  %积分下限
b=5;  %积分上限
x = [a:0.001:b];
y = -power(x,2) + 2*x; %函数
MAX=ceil(max(y)); %计算可能值的上限 
if MAX < 0      %函数全负的特例
    MAX = 0;
end
MIN=floor(min(y)); %计算可能值的下限
if MIN > 0      %函数全正的特例
    MIN = 0;
end
hold on
N=10000; %随机采样总数
freq1=0; 
freq2=0; 
N1=0;
N2=0;
for i=1:N
    u=unifrnd(a,b); %产生[a,b]区间的随机数
    v=unifrnd(MIN,MAX); %产生[MIN，MAX]区间的随机数
    if v >= 0
        N1=N1+1;
        if (-power(u,2) + 2*u) >= v %判断随机点是否落在函数内
            freq1=freq1+1;
            scatter(u,v,8,'red','filled');
        else
            scatter(u,v,8,'blue','filled');
        end
    else
        N2=N2+1;
        if (-power(u,2) + 2*u) <= v %判断随机点是否落在函数内
            freq2=freq2+1;
            scatter(u,v,8,'red','filled');
        else
            scatter(u,v,8,'blue','filled');
        end
    end                                                                               
end
plot(x,y,'-k.');
plot(x,0,'k.');
p1=freq1/N1; %计算落在函数区域内部的概率
p2=freq2/N2;
res = p1*(b-a)*abs(MAX) + p2*(b-a)*-abs(MIN)    %求出积分值