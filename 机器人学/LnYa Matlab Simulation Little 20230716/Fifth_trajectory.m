% ths��ʼ�Ƕ�   the�ն˽Ƕ�  v���ת���ؽ����ٽ׶ε��ٶ�  a���ٶ�
% Mÿ���ؽڽǶȵļ�¼����
function theta=Fifth_trajectory(ths,the,vmax,amax)

th=the-ths;
[m,no]=max(abs(th)); %�������Ƕȼ���λ��

[s,v,a,T]=Trj_poly5th(ths(no),the(no),vmax,amax,0);  %�˶��滮ʱ��

theta=[];
for i=1:length(ths)
    [s,v,a,Ti]=Trj_poly5th(ths(i),the(i),vmax,amax,T);
    theta=[theta,s];
end
  
