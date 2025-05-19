close all;
clear;


ToDeg = 180/pi;
ToRad = pi/180;
 

th1=0;
th2=90;
th3=0;
th4=0;
th5=180;
th6=0;
DHfk6Dof_Lnya(th1,th2,th3,th4,th5,th6,0);
view(134,12);
pause;
stp=30;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint1
for i=0:stp:180
   DHfk6Dof_Lnya(th1+i,th2,th3,th4,th5,th6,1); 
end
for i=180:-stp:-180
   DHfk6Dof_Lnya(th1+i,th2,th3,th4,th5,th6,1); 
end
for i=-180:stp:0
    if i==0
      DHfk6Dof_Lnya(th1+i,th2,th3,th4,th5,th6,0);  
    else
      DHfk6Dof_Lnya(th1+i,th2,th3,th4,th5,th6,1);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint2


for i=0:-stp:-155
   DHfk6Dof_Lnya(th1,th2+i,th3,th4,th5,th6,1); 
end
for i=-155:stp:95
   DHfk6Dof_Lnya(th1,th2+i,th3,th4,th5,th6,1); 
end
for i=95:-stp:0
    if i==0
      DHfk6Dof_Lnya(th1,th2+i,th3,th4,th5,th6,0);  
    else
      DHfk6Dof_Lnya(th1,th2+i,th3,th4,th5,th6,1); 
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint3


for i=0:-stp:-75
  DHfk6Dof_Lnya(th1,th2,th3+i,th4,th5,th6,1); 
end
for i=-75:stp:180
  DHfk6Dof_Lnya(th1,th2,th3+i,th4,th5,th6,1); 
end
for i=180:-stp:0
    if i==0
      DHfk6Dof_Lnya(th1,th2,th3+i,th4,th5,th6,0);  
      
    else
      DHfk6Dof_Lnya(th1,th2,th3+i,th4,th5,th6,1); 
    end 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint4


for i=0:stp:175
  DHfk6Dof_Lnya(th1,th2,th3,th4+i,th5,th6,1); 
end
for i=175:-stp:-175
  DHfk6Dof_Lnya(th1,th2,th3,th4+i,th5,th6,1); 
end
for i=-175:stp:0
    if i==0
      DHfk6Dof_Lnya(th1,th2,th3,th4+i,th5,th6,0);  
      
    else
      DHfk6Dof_Lnya(th1,th2,th3,th4+i,th5,th6,1); 
    end 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint5


for i=0:stp:120
  DHfk6Dof_Lnya(th1,th2,th3,th4,th5+i,th6,1); 
end
for i=120:-stp:-120
  DHfk6Dof_Lnya(th1,th2,th3,th4,th5+i,th6,1); 
end
for i=-120:stp:0
    if i==0
      DHfk6Dof_Lnya(th1,th2,th3,th4,th5+i,th6,0);  
      
    else
      DHfk6Dof_Lnya(th1,th2,th3,th4,th5+i,th6,1); 
    end 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint6


for i=0:stp:400
  DHfk6Dof_Lnya(th1,th2,th3,th4,th5,th6+i,1); 
end
for i=400:-stp:-400
  DHfk6Dof_Lnya(th1,th2,th3,th4,th5,th6+i,1); 
end
for i=-400:stp:0
    if i==0
      DHfk6Dof_Lnya(th1,th2,th3,th4,th5,th6+i,0);  
      
    else
      DHfk6Dof_Lnya(th1,th2,th3,th4,th5,th6+i,1); 
    end 
end
