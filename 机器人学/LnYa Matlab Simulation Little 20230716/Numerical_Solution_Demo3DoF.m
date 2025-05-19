clc;
clear all;
close all;

global Link 
num=1;
learning_rate =0.8;
ToDeg = 180/pi;
ToRad = pi/180;


%������ʼ���ؽ�λ��
th1=30;
th2=-120;
th3=-70;
th4=0;
th5=0;
th6=0;

%% ����Ŀ��ĩ��λ�ü���ת����
Tpos=[-140,10,60]';     %����λ��

%% ���ƻ�е�۳�ʼλ�˼�ĩ����̬
DHfk_3DoF2_Lnya(th1,th2,th3,0); %���ƻ�е��
plot3(Tpos(1),Tpos(2),Tpos(3),'kX'); hold on;
view(-21,12);
pause; cla;

%%
tic
while (1)
    %% FK���㲢���ƻ����ˣ���Ŀ���
    plot3(Tpos(1),Tpos(2),Tpos(3),'kX'); hold on;
    DHfk_3DoF2_Lnya(th1,th2,th3,1);
    
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

    x(num)=ex;
    y(num)=ey;
    z(num)=ez;
    num=num+1;
    plot3(x,y,z,'r.');grid on;
    hold on;    
end
toc
%%�ٴλ��ƻ����˱���ͼ��
plot3(x,y,z,'r.');grid on;
DHfk_3DoF2_Lnya(th1,th2,th3,0);
plot3(Tpos(1),Tpos(2),Tpos(3),'kX'); hold on;






