clear;close all
s = tf('s');
k_p = 19;
k_D = 0.5;
k_I = 4/19;
G_P = k_p/((s+1)*(5*s + 1));
G_PD = (k_p + k_D*s)/((s + 1)*(5*s + 1));
G_PID = (k_p + k_D*s + k_I/s)/((s + 1)*(5*s + 1));
H_P = G_P/(1 + G_P);
H_PD = G_PD/(1 + G_PD);
H_PID = G_PID/(1 + G_PID);
t = 0:0.0001:300;
figure,
yr = t' - step(H_P/s, t);
subplot(3,2,1)
plot(t,yr);
ys = 1 - step(H_P, t);
subplot(3,2,2)
plot(t,ys);
yr = t' - step(H_PD/s, t);
subplot(3,2,3)
plot(t,yr);
ys = 1 - step(H_PD, t);
subplot(3,2,4)
plot(t,ys);
yr = t' - step(H_PID/s, t);
subplot(3,2,5)
plot(t,yr);
ys = 1 - step(H_PID, t);
subplot(3,2,6)
plot(t,ys);