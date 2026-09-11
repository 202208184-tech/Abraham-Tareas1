function DibujaCaja(PointMatrix, Color)

P1 = PointMatrix(:, 1);
P2 = PointMatrix(:, 2);
P3 = PointMatrix(:, 3);
P4 = PointMatrix(:, 4);
P5 = PointMatrix(:, 5);
P6 = PointMatrix(:, 6);
P7 = PointMatrix(:, 7);
P8 = PointMatrix(:, 8);

%Dibuja base de caja

LineaPuntos(P1, P2, Color);
LineaPuntos(P1, P3, Color);
LineaPuntos(P2, P4, Color);
LineaPuntos(P3, P4, Color);

%Dibujamos tapa de caja

LineaPuntos(P5, P6, Color);
LineaPuntos(P5, P7, Color);
LineaPuntos(P6, P8, Color);
LineaPuntos(P7, P8, Color);

%Dibujando paredes de caja

LineaPuntos(P1, P5, Color);
LineaPuntos(P2, P6, Color);
LineaPuntos(P3, P7, Color);
LineaPuntos(P4, P8, Color);

end
