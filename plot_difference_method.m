% This matlab program is used to plot results from:
% 
%   1. Forwarddifference.f95
%   2. Backwarddifference.f95
%   3. Centerdifference.f95
% 
% By: Aulia Khalqillah,S.Si (2019)

clear;clc;

data1 = load('ForwardOut.txt');
data2 = load('BackwardOut.txt');
data3 = load('CenterOut.txt');
iter1 = data1(:,1);
x1 = data1(:,2);
fx1 = data1(:,3);
df1 = data1(:,4);
af1 = data1(:,5);
er1 = data1(:,6);

iter2 = data2(:,1);
x2 = data2(:,2);
fx2 = data2(:,3);
df2 = data2(:,4);
af2 = data2(:,5);
er2 = data2(:,6);

iter3 = data3(:,1);
x3 = data3(:,2);
fx3 = data3(:,3);
df3 = data3(:,4);
af3 = data3(:,5);
er3 = data3(:,6);

figure(1)
subplot(121)
plot(x1,fx1,'b')
hold on
plot(x2, fx2,'r')
hold on
plot(x3,fx3,'g')
xlabel('X Data')
ylabel('Function')

subplot(122)
plot(x1,df1,'b-d')
hold on
plot(x2, df2,'r-*')
hold on
plot(x3,df3,'m-o')
hold on
plot(x1,af1,'k')
xlabel('X Data')
ylabel('Function')
legend('Forward Difference','Backward Difference','Center Difference','Analytic','Location','NorthWest');

figure(2)
subplot(311)
plot(iter1,er1,'o')
ylabel('Residual')
title('Forward Difference')
subplot(312)
plot(iter2,er2,'o')
ylabel('Residual')
title('Backward Difference')
subplot(313)
plot(iter3,er3,'o')
ylabel('Residual')
xlabel('Iteration')
title('Center Difference')
