clear all;
close all;
clc
%%%%%%%%%%%%%%%%   A   %%%%%%%%%%%%%%%%%%
N=128;
fs1 = 1000;
dt = 1/fs1; 
t = [-0.1:dt:0.1-dt];
x=10.*cos(2.*pi.*20.*t)-4.*sin(2.*pi.*40.*t+5);

figure(1);
hold on;
title('X(t)');
plot(t,x);
xlabel('time (second)');
ylabel('amplitude of signal');

%Sampling of x
fs = 128;
ts = 1/fs;
td= -ts*N/2:ts:ts*N/2-ts;
x1=10.*cos(2.*pi.*20.*td)-4.*sin(2.*pi.*40.*td+5);
figure(2);
plot(td,x1) 


%Fourier of X
NFFT=(length(x));
X=fftshift((fft(x))*dt);
F=[-fs1/2:fs1/NFFT:fs1/2-fs1/NFFT];
figure(3);

plot(F,abs(X));
xlabel('Frequency(Hz)');
ylabel('Amplitude of X');
title('Spectrum of X');


%%%%%%%%%%%%%%%%%%%%%%%%%%  B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs=8000;
ts=1/fs;

phi=30;
N=1000;

%100,225,350,475
n=(0:N).*ts;
figure(4);
k=1;
for f0=100:125:475
    subplot(2,2,(k));
    
    y1=sin(2*pi*f0.*n+phi); 
    NFFT =length(y1);

    Y1=fftshift(fft(y1)*ts);
    
    F1=[-fs/2:fs/NFFT:fs/2-fs/NFFT];
    
    plot(F1,abs(Y1));
    title(['f0 = ',num2str(f0),' Hz']);
    xlabel('Frequency(Hz)');
    ylabel('Amplitude of X');
    k=k+1;
end 


%7525,7650,7775,7900
figure(5);
k=1;
for f0=7525:125:7900
    subplot(2,2,(k));
    
    y1=sin(2*pi*f0.*n+phi); 
    NFFT =(length(y1));

    Y1=fftshift(fft(y1,NFFT)*ts);
    
    F1=[-fs/2:fs/NFFT:fs/2-fs/NFFT];
    
    plot(F1,abs(Y1));
    title(['f0 = ',num2str(f0),' Hz']);
    xlabel('Frequency(Hz)');
    ylabel('Amplitude of X');
    k=k+1;
end 
