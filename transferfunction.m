%% Funcion de transferencia:

% G1 = ft(num,den)
G1 = tf([1,1,1],[4,3,1,10,-1])
% G2 = zpk([zero,pole,gain])
G2 = zpk([-10,-3],[-8,-9,-15],2)
% G3 = tf('s')
s = tf('s')
G3 = (s^2+1)/(s^5+8*s^3+10*s^2+2)
% G4 = zpk('s')
s = zpk('s')
G4 = (s^2+1)/(s^5+8*s^3+10*s^2+2)

%% Caracteristicas:

% Polos y ceros:
P2 = pole(G2)
Z2 = zero(G2)
% Mapa de polos y ceros:
pzmap(G4)
[P4,Z4] = pzmap(G4)

%% Respuestas del sistema:

% Delta de dirac:
impulse(G3)
Y3_impulse = impulse(G3)
% Escalon unitario:
step(G2)
Y2_step = step(G2)
% Entradas definidas por el usuario -- Ejemplo: u = 3sin(10t)
t = 0:0.1:10;
u = 3*sin(10*t);
[y,t] = lsim (G2,u,t);
plot(t,y)

%% Algebra de bloques:

% Retroalimentaci?n:
% Para: Gt = feedback(G1,G2), Gt = G1/(1-G1*G2) 
% ? feedback(G1,G2,+1) para retroalimentacion positiva
Gt = feedback(G1,G2);
% Probar series y parallel