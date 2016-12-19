clear
close all
w_n = 1;
kc = 0.7;
for d = 1:4
	p = 10^(d-1);
	H=tf([0 0 0 w_n*w_n*p], [1 2*kc*w_n+p w_n*w_n+2*kc*w_n*p w_n*w_n*p]);
	t=0:0.01:60;
	y=step(H,t);
	figure,
	plot(t,y,'Color',[1,0,0]);
	str = sprintf('The Step Response for p=%3.0f',p);
	title(str);
	grid on
end