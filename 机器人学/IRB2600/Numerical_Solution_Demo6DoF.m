clc;
clear all;
close all;

global Link
num=1;
learning_rate = 0.8;
ToDeg = 180/pi;
ToRad = pi/180;


%������ʼ���ؽ�λ��
th1=0;
th2=90;
th3=0;
th4=0;
th5=180;
th6=0;

%% ����Ŀ��ĩ��λ�ü���ת����
Tpos=[1000,500,300]';     %����λ��1
% Tpos=[-1500,850,1120]';     %����λ��2
% Tpos=[870,-1000,700]';     %����λ��3
% Tpos=[-1100,-1000,700]';     %����λ��4
% Tpos=[2000,2000,-1000]';     %���������ռ�λ��5


%% ���ƻ�е�۳�ʼλ�˼�ĩ����̬
DHfk6Dof_Lnya(th1,th2,th3,th4,th5,th6,0); %���ƻ�е��
plot3(Tpos(1),Tpos(2),Tpos(3),'kX'); hold on;
view(-21,12);
pause; cla;

%%
tic
while (1)
    %% FK���㲢���ƻ����ˣ���Ŀ���
    plot3(Tpos(1),Tpos(2),Tpos(3),'kX'); hold on;
    DHfk6Dof_Lnya(th1,th2,th3,th4,th5,th6,1);
    
    %��ȡ��е��ĩ�˵�ǰλ��
    ex=Link(7).p(1);
    ey=Link(7).p(2);
    ez=Link(7).p(3);
     
    %% �������
    p_err =[Tpos(1)-ex, Tpos(2)-ey, Tpos(3)-ez]' ;%����λ�����
    w_err=[0,0,0]'; % 3DoF��������̬��������̬�������
    Loss = norm(p_err) + norm(w_err)  %�������
    
    %% С������������������
    if Loss<1e-5
        break;
    end
    
    %��������ſɱȾ��󲢼���Ƕ�������
    J=Jacobian6DoF_Ln(th1,th2,th3,th4,th5,th6);    %�����ſɱȾ���
    %     %%�ж�����
    %     D = det(J);
    %     if D == 0
    %         fprintf('D= %2.4f ',D); fprintf('\n');
    %         fprintf('Pass the singilarity !'); fprintf('\n');
    %         pause;
    %     end
    
    dth = learning_rate * inv(J) * [p_err; w_err];  %�������������˴���λΪ����
    th1=th1+dth(1)*ToDeg;
    th2=th2+dth(2)*ToDeg;
    th3=th3+dth(3)*ToDeg;
    th4=th4+dth(4)*ToDeg;
    th5=th5+dth(5)*ToDeg;
    th6=th6+dth(6)*ToDeg;

    x(num)=ex;
    y(num)=ey;
    z(num)=ez;
    num=num+1;
    plot3(x,y,z,'r.');grid on;
    hold on;    
end
toc
%%�ٴλ��ƻ����˱���ͼ��
fprintf("th1=%d\n",th1);
fprintf("th2=%d\n",th2);
fprintf("th3=%d\n",th3);
fprintf("th4=%d\n",th4);
fprintf("th5=%d\n",th5);
fprintf("th6=%d\n",th6);
plot3(x,y,z,'r.');grid on;
DHfk6Dof_Lnya(th1,th2,th3,th4,th5,th6,0);
plot3(Tpos(1),Tpos(2),Tpos(3),'kX'); hold on;






