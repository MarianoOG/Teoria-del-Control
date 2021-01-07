format compact, clc, close all, clear all
%% Ejercicio 1:
G1 = tf([1,0,4],[-1,-2,0,-5,-2]);
G2 = zpk([0,-1,-1],[-2,-5,-12,-7],2);
s = tf('s');
G3 = (s^2+s+1)/(s^3+2*s^1+10);
s = zpk('s');
G4 = (s^2-s+1)/(5*s^5+s^3+3*s^2-s+2);
%% Ejercicio 2:
% a):
t = 0:0.001:1.5;
y2_impulso = 3*impulse(G2,t);
figure
plot(t,y2_impulso)
% b):
t = 0:0.005:3;
G5 = zpk([0],[-3,-2],5);
y5_impulso = 2*impulse(G5,t);
figure
plot(t,y5_impulso)
%% Ejercicio 3:
t = 0:0.01:5;
r = 3*t.^2;
[y,t] = lsim (G3,r,t);
figure
plot(t,y)
%% Ejercicio 4:
G6 = tf([3,2,1,2],[3,4,1,6,2,2]);
P6 = pole(G6);
Z6 = zero(G6);
%% Ejercicio 5:
figure
pzmap(G6)
clear all
%% Ejercicio 6:
s = tf('s');    % Comentar/Descomentar
% s = zpk('s'); % Comentar/Descomentar
G1 = (s+5)/(s*(s+4)*(s+1))
G2 = 1 / (2*s^2+5)
G3 = G1;
G4 = G2;
G5 = s / (s^3+s+1)
temp1 = parallel(G3,G4);
temp2 = series(temp1,G2);
temp3 = series(temp2,G1);
Gfinal = feedback(temp3,G5);
%% Ejercio 7 & 8 en simulink