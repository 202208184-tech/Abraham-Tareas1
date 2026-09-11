clear
close all

DibujaEjes(10);

[Ancho, Largo, Alto] = LeerDimensiones();
fprintf("[DEBUG] Ancho: %f | Largo: %f | Alto: %f  \n", Ancho, Largo, Alto);

PointMatrix = GetPointMatrix(Largo, Ancho, Alto, 0, 0, 0);

Color = input("Escribe el nombre del color entre comillas: ");
Color2 = input("Escribe el nombre del color2 entre comillas: ");

DibujaCaja(PointMatrix, Color);

numPasos = input("¿Cuántos pasos de movimiento y rotación quieres? ");

PuntosActuales = PointMatrix;

for i = 1:numPasos
    fprintf("\n--- Paso %d ---\n", i);

    eje = input("Indica el eje de rotación/traslación ('x', 'y' o 'z'): ", 's');
    eje = strtrim(eje);  % Eliminar espacios
    eje = strip(eje, "'");  % Eliminar comillas simples
    eje = strip(eje, '"');  % Eliminar comillas dobles

    distancia = input("Indica la distancia a mover en ese eje [m]: ");
    angulo = input("Indica el ángulo de rotación [rad]: ");

    % Aplica movimiento y rotación
    PuntosActuales = MoverCaja(PuntosActuales, eje, distancia, angulo);

    DibujaCaja(PuntosActuales, Color2);

end
