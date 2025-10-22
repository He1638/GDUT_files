omega_n = 1;
zeta = [0.1 0.3 0.5 0.7 0.9 1 2 10];
num = omega_n^2;
figure; hold on;
for i = 1:length(zeta)
    den = [1, 2*zeta(i)*omega_n, omega_n^2];
    g = tf(num, den);
    step(g);
end
legend('ζ=0.1', 'ζ=0.3', 'ζ=0.5', 'ζ=0.7', 'ζ=0.9', 'ζ=1', 'ζ=2', 'ζ=10');
grid on; 