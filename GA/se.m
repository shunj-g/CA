clc
clear
syms x y
y = 11*sin(7*x)-7*cos(5*x);
[xv,fv]=GA(@fit,0,2*pi,1200,20,0.6,0.1,0.0001)%�Ŵ��㷨���
ezplot(y)%���ͼ��