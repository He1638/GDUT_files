s=tf('s');
g=316/(s*(0.2*s+1));
% g=316*(3.456*s+1)/(s*(0.2*s+1)*(384*s+1));
figure;
bode(g);
grid on;