syms nx ny nz ox oy oz ax ay az Px Py Pz dx dy dz
syms Cphi Sphi Cthe Sthe Cpsi Spsi %R P Y

RotR=[1 0 0;
      0 Cphi -Sphi;
      0 Sphi Cphi;]
RotP=[Cthe 0 Sthe;
      0  1 0;
      -Sthe 0 Cthe;]
RotY=[Cpsi -Spsi 0;
      Spsi Cpsi 0;
      0 0 1;]
  
  
 Rpy=RotY*RotP*RotR
  
  Rpy_x=RotR*RotP*RotY





A=[nx ox ax Px;
   ny oy ay Py;
   nz oz az Pz;
   0 0 0 1]

At=[nx ny nz -(nx*Px+ny*Py+nz*Pz);
   ox oy oz -(ox*Px+oy*Py+oz*Pz);
   ax ay az -(ax*Px+ay*Py+az*Pz);
   0 0 0 1]

C=[nx ox ax (Px+dx);
   ny oy ay (Py+dy);
   nz oz az (Pz+dz);
   0 0 0 1]

B=simplify(At*C)

Bs=[1 0 0 dx*nx + dy*ny + dz*nz;
   0 1 0 dx*ox + dy*oy + dz*oz;
   0 0 1 ax*dx + ay*dy + az*dz;
   0 0 0 1]

x=simplify(C-A*Bs)
