omega_n = [2 4 6 8 10];
zeta = 0.7;
figure; hold on;
for i = 1:length(omega_n)
    num = omega_n(i)^2;
    den = [1, 2*zeta*omega_n(i), omega_n(i)^2];
    g = tf(num, den);
    step(g);
end
legend('omega_n=2', 'omega_n=4', 'omega_n=6', 'omega_n=8', 'omega_n=10');
grid on; 