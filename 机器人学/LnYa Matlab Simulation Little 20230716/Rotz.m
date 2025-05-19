function A=Rotz(th)

% ToRad=pi/180;
% ToDeg=180/pi;
% thr=th*ToRad;

A=[ cos(th), -sin(th), 0;
        sin(th), cos(th),0;
         0,0,1];