clear all, clc, close all, syms s t
%% Datos:
G = 15/((s+5)*(s^2+s+3)); % Modificar para funcion de transferencia diferente.
x = 1 + 0.2*t;            % Modificar para entrada diferente.
X = laplace(x);
Y = G * X;
%% Obtenga yt y yss:
[snum, sden] = numden(Y);
num = sym2poly(snum);
den = sym2poly(sden);
[r, p, k] = residue(num,den); % Obtiene fracciones parciales
yt = t-t;
yss = t-t;
e = 1;
for i = 1:length(r) % Crea terminos parciales y los clasifica.
    Gp(i) = r(i)/((s-p(i))^e);
	if(i<length(r)) % Comprueba la multiplicidad del polo.
        if(p(i) == p(i+1))
            e = e + 1; 
        else
            e = 1;
        end
    end
    gp(i) = ilaplace(Gp(i));
    if (limit(gp(i),t,inf) == 0) % Clasifica (estacionario o transitorio)
        yt = yt + gp(i);
    else
        yss = yss + gp(i);
    end
end
y = yt + yss; % Salida total
%% Grafique ys y yss:
t2 = 0:0.1:20;
x2 = subs(x,t,t2);
y2 = real(subs(y,t,t2));
yt2 = real(subs(yt,t,t2));
yss2 = real(subs(yss,t,t2));
figure
    subplot(2,2,1)
        plot(t2,x2,'b')
        axis([0,20,round(min(x2))-1,round(max(x2))+1])
        title('Entrada')
    subplot(2,2,2)
        plot(t2,y2,'b')
        axis([0,20,round(min(y2))-1,round(max(y2))+1])
        title('Salida completa')
    subplot(2,2,3)
        plot(t2,yt2,'b')
        axis([0,20,round(min(yt2))-1,round(max(yt2))+1])
        title('Respuesta transitoria (yt)')
    subplot(2,2,4)
        plot(t2,yss2,'b')
        axis([0,20,round(min(yss2))-1,round(max(yss2))+1])
        title('Respuesta estacionaria (yss)')