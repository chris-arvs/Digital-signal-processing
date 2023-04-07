
clc
clear all
close all

%Askhsh1

%A

nx = -10:10;

ny = -2:5;

x = (nx>0);

y = (1/2).^exp(ny);

figure;
stem(nx, x, 'r');
hold on
stem(ny, y, 'b');
title('red -> x[n], blue -> y[n]');
hold off


nh = nx(1)+ny(1):nx(end)+ny(end);
lenH = length(nh);
lenX = length(x);
lenY = length(y);

x0 = [zeros(1, lenY-1) x zeros(1, lenY-1)];

nx0 = nx(1)-(lenY-1):nx(end)+(lenY-1);

y_rev = y(end:-1:1);

for i=1:lenH
    y_rev0 = [zeros(1,(i-1)) y_rev zeros(1, (lenH-i))];
    h1(i) = sum(x0.*y_rev0);
end

figure;
stem(nh, h1);
title('Convolution without conv');

a = double(x);
h2 = conv(a, y);
figure;
stem(nh ,h2);
title('With conv');

%B

n = -10:10;
puls = (n<2)+(n>-2)-1;

figure;
stem(n, puls);
title('A pulse');

pulse_conv = conv(puls, puls);

figure;
stem(pulse_conv);
title('Convolution in time domain');


N = length(nh);
lamda = fft(puls, N);

f_lamda = lamda.*lamda;

lamda = ifft(f_lamda, N);

figure;
stem(lamda);
title('Multiplication in frequency domain');









