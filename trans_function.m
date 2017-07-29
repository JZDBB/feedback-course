clear;
close all
s = tf('s');
kp = 19;
kI = 0.5;
kD = 4/19;
GP = kp/((s+1)*(5*s+1));
GPD = (kp + kD*s)/((s+1)*(5*s+1));
GPID = (kp + kI/s + kD*s)/((s+1)*(5*s+1));
HP = GP/(1+GP);
HPD = GPD/(1+GPD);
HPID = GPID/(1+GPID);
t = 0:0.001:300;
yr_P = t' - step(HP/s,t);
yr_PD = t' - step(HPD/s,t);
yr_PID = t' - step(HPID/s,t);
ys_P = 1 - step(HP,t);
ys_PD = 1 - step(HPD,t);
ys_PID = 1 - step(HPID,t);
subplot 321
plot(t, yr_P);
title('P')
subplot 322
plot(t, ys_P);
subplot 323
plot(t, yr_PD);
subplot 324
plot(t, ys_PD);
subplot 325
plot(t, yr_PID);
subplot 326
plot(t, ys_PID);