function [s,v,a,T]=Trj_poly5th(th0,tht,vmax,amax,T)
%输入单位为弧度，弧度/s，弧度/ss
%如果T==0，则使用最大速度和最大加速度计算T
%如果T！=0，则使用T进行轨迹规划

k=0.97;   %安全系数,最大速度时间出现在T/2的位置，最大加速度出现在约1/5的位置
dtime=0.004; %时间间隔设置为4ms，与AR机器人采样一致

%按照最大速度和最大加速度约束求解时间
Tv_min=1.875/abs(vmax*k)*abs(tht-th0);
Ta_min=sqrt(5.76/abs(amax*k)*abs(tht-th0));
Tmin=max(Tv_min,Ta_min);

if T==0
    T=Tmin;
else
    if T<Tmin
        T=Tmin;  %时间T不能小于加速度和速度约束下的最小时间
    end
end

a3=10/(T^3);
a4=-15/(T^4);
a5=6/(T^5);

a3v=30/(T^3);
a4v=-60/(T^4);
a5v=30/(T^5);

a3a=60/(T^3);
a4a=-180/(T^4);
a5a=120/(T^5);

s=[];
v=[];
a=[];
for t=0:dtime:T
    sx=a3*t^3+a4*t^4+a5*t^5;     %位移
    vx=a3v*t^2+a4v*t^3+a5v*t^4;  %速度
    ax=a3a*t+a4a*t^2+a5a*t^3;    %加速度
    v=[v;vx];
    s=[s;sx];
    a=[a;ax];
end

s=th0+(tht-th0)*s;
v=(tht-th0)*v;
a=(tht-th0)*a;