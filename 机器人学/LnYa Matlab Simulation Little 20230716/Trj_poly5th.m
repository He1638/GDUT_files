function [s,v,a,T]=Trj_poly5th(th0,tht,vmax,amax,T)
%���뵥λΪ���ȣ�����/s������/ss
%���T==0����ʹ������ٶȺ������ٶȼ���T
%���T��=0����ʹ��T���й켣�滮

k=0.97;   %��ȫϵ��,����ٶ�ʱ�������T/2��λ�ã������ٶȳ�����Լ1/5��λ��
dtime=0.004; %ʱ��������Ϊ4ms����AR�����˲���һ��

%��������ٶȺ������ٶ�Լ�����ʱ��
Tv_min=1.875/abs(vmax*k)*abs(tht-th0);
Ta_min=sqrt(5.76/abs(amax*k)*abs(tht-th0));
Tmin=max(Tv_min,Ta_min);

if T==0
    T=Tmin;
else
    if T<Tmin
        T=Tmin;  %ʱ��T����С�ڼ��ٶȺ��ٶ�Լ���µ���Сʱ��
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
    sx=a3*t^3+a4*t^4+a5*t^5;     %λ��
    vx=a3v*t^2+a4v*t^3+a5v*t^4;  %�ٶ�
    ax=a3a*t+a4a*t^2+a5a*t^3;    %���ٶ�
    v=[v;vx];
    s=[s;sx];
    a=[a;ax];
end

s=th0+(tht-th0)*s;
v=(tht-th0)*v;
a=(tht-th0)*a;