% Juntar rotación y traslación
TR = T * R;

% Aplicar la transformación a todos los puntos
P1 = PointMatrix(:, 1);
P2 = PointMatrix(:, 2);
P3 = PointMatrix(:, 3);
P4 = PointMatrix(:, 4);
P5 = PointMatrix(:, 5);
P6 = PointMatrix(:, 6);
P7 = PointMatrix(:, 7);
P8 = PointMatrix(:, 8);

P1T = TR * P1;
P2T = TR * P2;
P3T = TR * P3;
P4T = TR * P4;
P5T = TR * P5;
P6T = TR * P6;
P7T = TR * P7;
P8T = TR * P8;

NewPoints = [P1T, P2T, P3T, P4T, P5T, P6T, P7T, P8T];

end
