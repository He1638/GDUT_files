% %Build Robot by D_H methods


ToDeg = 180/pi;
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';

Link= struct('name','Body' , 'th',  0, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);     % az 
Link(1)= struct('name','Earth' , 'th',  0, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);     % Earth 
Link(2) = struct('name','V1' , 'th',   0*ToRad, 'dz', 0, 'dx', 0, 'alf',30*ToRad,'az',UZ);       %Earth TO V1
Link(3) = struct('name','V2' , 'th',   0*ToRad, 'dz', 0, 'dx', 0, 'alf',-30*ToRad,'az',UZ);       %V1 TO V2
Link(4) = struct('name','Tiangong' , 'th',   0*ToRad, 'dz', 000, 'dx', -200, 'alf',0*ToRad,'az',UZ);       %V2 TO Tiangong

Link(5) = struct('name','E1' , 'th',   0*ToRad, 'dz', 0, 'dx', 100, 'alf',0*ToRad,'az',UZ);       %Tiangong TO  E1
Link(6) = struct('name','E2' , 'th',  0*ToRad, 'dz', 100, 'dx', -100, 'alf',0*ToRad,'az',UZ);          %E1 TO E2
Link(7) = struct('name','E3' , 'th',  90*ToRad, 'dz', -100, 'dx', 100, 'alf',0,'az',UZ);          %E2 TO E3
