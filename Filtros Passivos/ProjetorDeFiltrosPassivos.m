close all;
clear all;
clc;


freqCorte = input('Digite o valor da Frequência de Corte (em kHz): '); %kHz
impedCarga = input('Digite o valor da Impedância de Carga (em Ω): '); %Ω

R = impedCarga;
fc=freqCorte*1000;
wc = 2*pi*fc;

%Henry
indutores = [0.1 0.12 0.15 0.18 0.22 0.27 0.33 0.39 0.47 0.56 0.68 0.82 1.0 1.2 1.5 1.8 2.2 2.7 3.3 3.9 4.7 5.6 6.8 8.2 10 12 15];

%Faraday
capacitores = [1.0 1.2 1.5 1.8 2.2 2.7 3.3 3.9 4.7 5.6 6.8 8.2 10 12 15 18 22 27 33 39 47 56 68 82 100];

%mili = 10^-3; micro = 10^-6; nano = 10^-9; pico = 10^-12

%% Passa baixa
fprintf('\nFiltro Butterworth Passa-Baixa\n');
L_pb = impedCarga/(pi*freqCorte);
fprintf('Indutor ideal: %.2f mH\n', L_pb);
indutorProximo = sugereComponente(L_pb, indutores, 'L');

C_pb = 1/(2*pi*freqCorte*impedCarga);
fprintf('Capacitor ideal: %.2f µF\n', C_pb);
capacitorProximo = sugereComponente(C_pb, capacitores, 'C');
fprintf('\n');

%  Filtro Passa-Baixa 2ª Ordem Ideal 
C = C_pb;
L = L_pb;
Q  = R * sqrt(C/L);      % fator de qualidade

num = [wc^2];
den = [1 wc/Q wc^2];
H_LP2Ideal = tf(num, den);

%  Filtro Passa-Baixa 2ª Ordem Real 
C = capacitorProximo;
L = indutorProximo;
Q  = R * sqrt(C/L);      % fator de qualidade

num = [wc^2];
den = [1 wc/Q wc^2];
H_LP2Real = tf(num, den);

% Gráfico de Bode comparativo
figure;
bode(H_LP2Ideal, 'b', H_LP2Real, 'r--');
legend('Filtro Ideal','Filtro Real');
grid on;
title('Comparativo Bode - Passa-Baixa 2ª Ordem para Woofer');


%% Passa alta
fprintf('Filtro Butterworth Passa-Alta\n');
L_pa = impedCarga/(2*pi*freqCorte);
fprintf('Indutor ideal: %.2f mH\n', L_pa);
indutorProximo = sugereComponente(L_pa, indutores, 'L');

C_pa = 1/(pi*freqCorte*impedCarga);
fprintf('Capacitor ideal: %.2f µF\n', C_pa);
capacitorProximo = sugereComponente(C_pa, capacitores, 'C');

s = tf('s');

%Func de transferencia ideal
C = C_pa;
L = L_pa;

Zc = 1/(s*C);
Zl = s*L;

Zpar = (Zl*R) / (Zl + R);      % L // R
H_ideal = Zpar / (Zc + Zpar); 


%Func de transferencia real
C = capacitorProximo;
L = indutorProximo;

Zc = 1/(s*C);
Zl = s*L;

Zpar = (Zl*R) / (Zl + R);
H_real = Zpar / (Zc + Zpar);

%Gráfico de Bode comparativo
figure;
bode(H_ideal, 'b', H_real, 'r--');
grid on;
legend('Filtro Ideal', 'Filtro Real');
title('Comparativo Bode - Passa-Alta 2ª Ordem para Tweeter');


%% Função para encontrar o mais componente próximo
function proximo = sugereComponente(ideal, valoresComerciais, tipo)

[~,pos] = min(abs(valoresComerciais - ideal));

proximo = valoresComerciais(pos);

 if strcmp(tipo,'C')
    fprintf('Capacitor sugerido: %.2f µF\n', proximo);
 elseif strcmp(tipo,'L')
    fprintf('Indutor sugerido: %.2f mH\n', proximo);
 end

end


