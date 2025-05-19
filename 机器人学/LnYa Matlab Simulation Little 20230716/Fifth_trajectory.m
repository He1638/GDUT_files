% ths初始角度   the终端角度  v最大转动关节匀速阶段的速度  a加速度
% M每个关节角度的记录点数
function theta=Fifth_trajectory(ths,the,vmax,amax)

th=the-ths;
[m,no]=max(abs(th)); %返回最大角度及其位置

[s,v,a,T]=Trj_poly5th(ths(no),the(no),vmax,amax,0);  %运动规划时间

theta=[];
for i=1:length(ths)
    [s,v,a,Ti]=Trj_poly5th(ths(i),the(i),vmax,amax,T);
    theta=[theta,s];
end
  
