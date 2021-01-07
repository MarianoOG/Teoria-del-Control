z = 0.5;
Wn = 10;


sigma = z*Wn;
Wd = Wn*sqrt(1-z^2);
tr1 = (1/Wd)*atan(-Wd/sigma)
beta = acos(z);
tr2 = (pi - beta)/Wd
Mp = exp(-(sigma/Wd)*z)
ts2 = 4/sigma
ts5 = 3/sigma

s = tf('s') ;
G = 100/(s^2+2*z*Wn*s + Wn^2);

step(G)

% td := tiempo de retardo, la primera vez que llega a la mitad del valor final
% tr := tiempo de crecimiento primera vez en el valor final
% tp := tiempo pico valor m?ximo
% ts := tiempo de ascentamiento, criterio del 2% o del 5%
% Mp := sobreimpulso = valor maximo - valor final

G1 = 1/(s^2+5*s);
G2 = 1-s+s;
G3 = feedback(G1,G2)