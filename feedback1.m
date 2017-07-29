clear;
clc;
K=113.34;
a=67.10;
num=[0 0 100*K];
den=[1 25+a  25*a+100*K];
sys=tf(num,den);
t=0:0.001:0.2;
y=step(sys,t);
plot(t,y);
yss = dcgain(sys);
Mp = (max(y) - yss)*100;
% Finding maximum overshoot
msg_overshoot = sprintf('Max overshoot = %3.2f%%', Mp);
% Finding settling time
ys = find((y<yss*1.011)&(y>yss*1.009));
ts =max(t(ys));
xlabel('Time(sec)');
ylabel('y(t)');
msg_title = sprintf('Step Response with K=%3.2f,a=%3.2f',K,a);
title(msg_title);
grid on;