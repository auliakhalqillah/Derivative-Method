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
x1 = data1(:,2);
fx1 = data1(:,3);
df1 = data1(:,4);

x2 = data2(:,2);
fx2 = data2(:,3);
df2 = data2(:,4);

x3 = data3(:,2);
fx3 = data3(:,3);
df3 = data3(:,4);


figure(1)
plot(x1,fx1,'g')
hold on
plot(x2, fx2,'r')
hold on
plot(x3,fx3,'b')
title('Original Function')
xlabel('X Data')
ylabel('Function')

figure(2)
plot(x1,df1,'b')
hold on
plot(x2, df2,'r')
hold on
plot(x3,df3,'g')
title('Derivative Function Results using Forwad, Backward, and Center Difference')
xlabel('X Data')
ylabel('Function')
legend('Forward Difference','Backward Difference','Center Difference','Location','NorthWest');
