clear all;
close all;

dt=0.001;%a very small step
t=[0:dt:0.5];%0<t<500ms =>0<t<0.5 from 0 to 0.5 with dt step

x=5*cos(24*pi*t)-2*sin(1.5*pi*t);%x(t)

f1=figure(1);%figure(n) finds a figure in which the Number property is equal to n, and makes it the current figure. If no figure exists with that property value, MATLAB® creates a new figure and sets its Number property to n.
plot(t,x)%creates a 2-D line plot of the data in t versus the corresponding values in x.
title('x(t)');%Add a title to the chart by using the title function
xlabel('time');%Add axis labels to the chart by using the xlabel function.
ylabel('value');%Add axis labels to the chart by using the ylabel function.

Fs=24;
Ts=1/Fs;

N=2^nextpow2(length(x));%Use the nextpow2 function to increase the performance of fft when the length of a signal is not a power of 2.
%fft allows you to pad the input with trailing zeros. In this case, pad each row of X with zeros so that the length of each row is the next higher power of 2 from the current length. Define the new length using the nextpow2 function

X=(fft(x,N)*Ts);%returns the n-point DFT. If no value is specified, X is the same size as x.
F=[-Fs/2:Fs/N:Fs/2-Fs/N];%-12<=Fs<=12

f2=figure(2);
plot(F,abs(X));
title('X(F)');
xlabel('frequency');
ylabel('value');

%a)Ts=1/48sec
Ts=1/48;
Fs=1/Ts;
tmin=0;
tmax=0.5;
nmin=ceil(tmin/Ts);%ceil round toward positive infinity
nmax=floor(tmax/Ts);%floor round toward negative infinity
n=nmin:nmax;%Create a unit-spaced vector of numbers between nmin and nmax.**The colon operator uses a default increment of +1.**

xa=5*cos(24*pi*n*Ts)-2*sin(1.5*pi*n*Ts);
f3=figure(3);
plot(t,x);
hold on;%hold on retains plots in the current axes so that new plots added to the axes do not delete existing plots
plot(n*Ts,xa,'.r');
hold off;%resets the hold state to off
title('a)Ts=1/48');
xlabel('time');
ylabel('value');

%b)Ts=1/24sec
Ts=1/24;
Fs=1/Ts;
tmin=0;
tmax=0.5;
nmin=ceil(tmin/Ts);%ceil round toward positive infinity
nmax=floor(tmax/Ts);%floor round toward negative infinity
n=nmin:nmax;

xb=5*cos(24*pi*n*Ts)-2*sin(1.5*pi*n*Ts);
f4=figure(4);
plot(t,x);
hold on;%hold on retains plots in the current axes so that new plots added to the axes do not delete existing plots
plot(n*Ts,xb,'.r');
hold off;%resets the hold state to off
title('b)Ts=1/24');
xlabel('time');
ylabel('value');

%c)Ts=1/12
Ts=1/12;
Fs=1/Ts;
tmin=0;
tmax=0.5;
nmin=ceil(tmin/Ts);%ceil round toward positive infinity
nmax=floor(tmax/Ts);%floor round toward negative infinity
n=nmin:nmax;

xc=5*cos(24*pi*n*Ts)-2*sin(1.5*pi*n*Ts);
f5=figure(5);
plot(t,x);
hold on;%hold on retains plots in the current axes so that new plots added to the axes do not delete existing plots
plot(n*Ts,xc,'.r');
hold off;%resets the hold state to off
title('c)Ts=1/12');
xlabel('time');
ylabel('value');

%Ts=1/As where As is the code number of our team in eclass,in our case As=30
Ts=1/30;
Fs=1/Ts;
tmin=0;
tmax=0.5;
nmin=ceil(tmin/Ts);%ceil round toward positive infinity
nmax=floor(tmax/Ts);%floor round toward negative infinity
n=nmin:nmax;

xas=5*cos(24*pi*n*Ts)-2*sin(1.5*pi*n*Ts);
f6=figure(6);
plot(t,x);
hold on;%hold on retains plots in the current axes so that new plots added to the axes do not delete existing plots
plot(n*Ts,xas,'.r');
hold off;%resets the hold state to off
title('Ts=1/30,As=30');
xlabel('time');
ylabel('value');

%theory : the minimus  F to obtain the full signal is Fnyquist = 24Hz in
%a)where Fs=48Hz>Fnyquist is ok in b)where Fs=24Hz=Fnyquist minimum frequency c)we can not obtain the full
%signal
