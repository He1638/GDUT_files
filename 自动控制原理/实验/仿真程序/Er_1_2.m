num = 1;
T = [0.1 0.5 1 2 5 10];

figure; 
for i = 1:length(T)
    subplot(2, 3, i);
    den = [T(i) T(i) 0];
    g = tf(num, den);
    nyquist(g);
    title(['T = ', num2str(T(i))]);
    grid on;
end
