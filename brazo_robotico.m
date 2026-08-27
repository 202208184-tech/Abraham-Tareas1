close all
clear all
clf

%%%% Dibujando ejes principales
line([0 2],[0 0],[0 0], "Color",'red', 'LineWidth',3);
line([0 0],[0 2],[0 0], "Color",'green', 'LineWidth',3);
hold on

%% Dibujando articulaciones
% Se usará Scatter
joint_1 = [0 0]';
scatter(joint_1(1), joint_1(2), 100, 'filled', 'MarkerFaceColor', 'blue');
l1 = input("Introduce la longitud del eslabón 1 [m]: ");
theta1 = input("Introduce el ángulo de la primer articulación [rad]: ");
l1x = l1*cos(theta1);
l1y = l1*sin(theta1);

joint_2 = [l1x l1y];
scatter(joint_2(1), joint_2(2), 100, 'filled', 'MarkerFaceColor', 'blue');

l2 = input("Introduce la longitud del eslabón 2 [m]: ");
theta2 = input("Introduce el ángulo de la segunda articulación [rad]: ");
l2x = l2*cos(theta1 + theta2);
l2y = l2*sin(theta1 + theta2);

EFx = l1x + l2x;
EFy = l1y + l2y;
EF = [EFx EFy]';

scatter(EF(1), EF(2), 100, 'filled', 'MarkerFaceColor', 'blue');

%% Dibujando Eslabones
% Primer Eslabón
line([joint_1(1) joint_2(1)], [joint_1(2) joint_2(2)], [0 0],...
    "Color","black","LineWidth",2);
% Segundo Eslabón
line([joint_2(1) EF(1)], [joint_2(2) EF(2)], [0 0],...
    "Color","black","LineWidth",2);

% --- Parámetros del Robot ---
long_1 = 1;
long_2 = 1;
num_pasos = 50;

% --- Trayectoria de los Ángulos (Grados) ---
ang1_grados = [linspace(0, 45, num_pasos), 45 * ones(1, num_pasos)];
ang2_grados = [zeros(1, num_pasos), linspace(0, 45, num_pasos)];

% --- Configuración del Espacio de Trabajo Predeterminado ---
fig = figure;
hold on; 
grid off;
xlabel('X'); ylabel('Y');

% --- Inicialización del Gráfico ---
h_robot = plot([0 0 0], [0 0 0], '-o', 'LineWidth', 3, 'MarkerSize', 8, 'Color', 'r');

% --- Bucle de Animación ---
total_frames = length(ang1_grados);

for i = 1:total_frames
    th1 = deg2rad(ang1_grados(i));
    th2 = deg2rad(ang2_grados(i));

    % Matrices de Transformación Homogénea
    m_T01 = MatrizRotZ(th1);
    m_T12 = MatrizTraslacion(long_1, 0, 0) * MatrizRotZ(th2);
    m_T02 = m_T01 * m_T12;

    % Cálculo de Posición de las Articulaciones
    pos0 = [0; 0; 0; 1];
    pos1 = m_T01 * [long_1; 0; 0; 1];
    pos2 = m_T02 * [long_2; 0; 0; 1];

    % Actualización de coordenadas en la figura
    set(h_robot, 'XData', [pos0(1), pos1(1), pos2(1)], ...
        'YData', [pos0(2), pos1(2), pos2(2)]);
    drawnow;
    pause(0.02);
end

% --- Funciones Auxiliares ---
function T = MatrizTraslacion(dx, dy, dz)
T = [1 0 0 dx;
    0 1 0 dy;
    0 0 1 dz;
    0 0 0  1];
end

function R = MatrizRotZ(angle)
R = [cos(angle) -sin(angle)  0  0;
    sin(angle)  cos(angle)  0  0;
    0           0           1  0;
    0           0           0  1];
end