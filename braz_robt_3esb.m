close all;
clear;
clc;

%% 1. ENTRADA DE DATOS
l = zeros(1, 3);
l(1) = input('Ingresa la longitud del eslabon 1: ');
l(2) = input('Ingresa la longitud del eslabon 2: ');
l(3) = input('Ingresa la longitud del eslabon 3: ');

% Ángulos iniciales y finales [grados]
theta_ini = zeros(1, 3);
theta_fin = zeros(1, 3);

for k = 1:3
    theta_ini(k) = input(sprintf('Ingresa el angulo inicial del eslabon %d: ', k));
end



% Conversión a radianes
theta_ini = deg2rad(theta_ini);
theta_fin = deg2rad(theta_fin);

% Movimiento relativo de cada eslabón y paso fijo (45 grados)
movimiento1 = theta_fin(1) - theta_ini(1);
movimiento2 = theta_fin(2) - theta_ini(2);
movimiento3 = theta_fin(3) - theta_ini(3);

movimiento = pi/4; 

%% 2. ANIMACIÓN DE MOVIMIENTO DE CADA ESLABÓN
theta_actual = theta_ini;
tiempos_pause = [0.1, 0.05, 0.05];

for eslabon = 1:3
    pasos = 0:0.05:movimiento;

    for i = pasos
        t = theta_actual;
        t(eslabon) = theta_actual(eslabon) + i;

        dibujar_brazo(l, t, sprintf('Movimiento del eslabon %d', eslabon));
        pause(tiempos_pause(eslabon));
    end

    % Actualizar ángulo acumulado del eslabón tras la animación
    theta_actual(eslabon) = theta_actual(eslabon) + movimiento;
end

%% 3. POSICIÓN FINAL
dibujar_brazo(l, theta_actual, 'Posicion final del brazo robotico');


%% ==========================================
% FUNCIÓN AUXILIAR DE GRAFICADO
% ==========================================
function dibujar_brazo(l, theta, titulo)
clf;

% Cálculo de cinemática directa acumulada
x = zeros(1, 4);
y = zeros(1, 4);

q_sum = 0;
for k = 1:3
    q_sum = q_sum + theta(k);
    x(k+1) = x(k) + l(k) * cos(q_sum);
    y(k+1) = y(k) + l(k) * sin(q_sum);
end

% Dibujar Ejes Referenciales
line([-5 5], [0 0], [0 0], 'Color', 'red', 'LineWidth', 2);
line([0 0], [-5 5], [0 0], 'Color', 'green', 'LineWidth', 2);
hold on;

% Dibujar Eslabones
for k = 1:3
    line([x(k) x(k+1)], [y(k) y(k+1)], 'Color', 'blue', 'LineWidth', 4);
end

% Dibujar Articulaciones
scatter(x, y, 100, 'filled');

% Configuración de Gráfica
axis equal;
grid on;
axis([-5 5 -5 5]);
title(titulo);
end