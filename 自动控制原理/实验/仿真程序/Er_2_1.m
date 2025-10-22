s = tf('s');
g = 31.6/(s*(0.01*s+1)*(0.1*s+1));


[Gm,Pm] = margin(g);