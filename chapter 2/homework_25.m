K=113.34;
a=67.10;
H=tf([0 0 100*K],[1 25+a  25*a+100*K]);
t=0:0.001:0.2;
y=step(H,t);
plot(t,y);
title('final design');
grid on