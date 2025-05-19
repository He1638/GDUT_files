% %Build Robot by D_H methods


ToDeg = 180/pi;
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';

Link= struct('name','Body' , 'th',  0, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);     % az 
Link(1)= struct('name','Body' , 'th',  0, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);     % Body 
Link(2)= struct('name','TianGong' , 'th',  0*ToRad, 'dz', 100, 'dx', 0, 'alf',0*ToRad,'az',UZ);        %Body To TianGong
Link(3) = struct('name','TianZhou' , 'th',   0*ToRad, 'dz', 0, 'dx', 0, 'alf',90*ToRad,'az',UZ);       %TianGong TO V1
Link(4) = struct('name','TianZhou' , 'th',   0*ToRad, 'dz', 0, 'dx', 0, 'alf',-90*ToRad,'az',UZ);       %V1 TO V2
Link(5) = struct('name','TianZhou' , 'th',   0*ToRad, 'dz', 100, 'dx', 0, 'alf',0*ToRad,'az',UZ);       %TianGong TO TianZhou
Link(6) = struct('name','TianZhou' , 'th',   0*ToRad, 'dz', 100, 'dx', 0, 'alf',0*ToRad,'az',UZ);       %TianZhou TO  E
