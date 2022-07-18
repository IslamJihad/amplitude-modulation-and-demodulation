% Ac[1 + m cos(2 pi fmt)] cos(2pi fc t)
t= 0:0.001:2;
fc=25;
fm=1;
m=0.25;
Ac=1;
mt= cos(2 * pi * fm * t);
ct= cos( 2 * pi * fc * t);
st= Ac* ct .* (1 + m.*mt);

subplot(4,1,1);
plot(t,mt);
axis([0 2 -2 2]);
title('messege m(t)');
xlabel('time');
ylabel('m(t)');
grid on;
%***********

subplot(4,1,2);
plot(t,ct,'m');
axis([0 2 -2 2]);
title('Carrir C(t)');
xlabel('time');
ylabel('C(t)');
grid on;
%***********

subplot(4,1,3);
plot(t,st,'r');
axis([0 2 -2 2]);
title('AM signal s(t)');
xlabel('time');
ylabel(' sig amp s(t)');
grid on;
%***********
absm=(1 + m.*mt);
env= abs(absm);
subplot(4,1,4);
plot(t,env,'g');
axis([0 2 -2 2]);
title('demodulated signal');
xlabel('time');
ylabel('Y(t)');
grid on;