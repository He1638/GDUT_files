num = 25;
den = [1, 4, 0];
sys1 = tf(num, den);
sys = feedback(sys1,1);

t = 0:0.01:10;  
u = 1 + 0.2*sin(4*t);
lsim(sys, u, t);