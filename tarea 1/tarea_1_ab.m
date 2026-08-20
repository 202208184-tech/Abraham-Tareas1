Cuadrado1 = [0 3 3 0 0; 0 0 3 3 0; 0 0 0 0 0; 1 1 1 1 1];
CuadradoAnimacion = Cuadrado1;

steps = 40;
dy = 4 / steps;

for i = 1:steps
    clf
    line([0 10],[0 0],[0 0],'LineWidth',2,'Color','red');
    line([0 0],[0 10],[0 0],'LineWidth',2,'Color','magenta');
    axis([-1 10 -1 10]);
    grid on;
    hold on

    % PLOT CUADRADO ORIGINAL
    plot(Cuadrado1(1,:), Cuadrado1(2,:), 'black', 'LineWidth', 2);

    % PLOT CUADRADO EN ANIMACION
    plot(CuadradoAnimacion(1,:), CuadradoAnimacion(2,:), 'blue', 'LineWidth', 2);

    for j = 1:size(CuadradoAnimacion, 2)
        CuadradoAnimacion(:,j) = traslacion(0, dy, 0, CuadradoAnimacion(:,j));
    end

    pause(0.05)
end