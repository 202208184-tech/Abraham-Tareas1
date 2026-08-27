L = 4;
h = L/2;
vertices = [
    +h, +h, +h;  %a
    -h, +h, +h; %b
    -h, -h, +h; %c
    +h, -h, +h; %d
    +h, +h, -h; %e
    -h, +h, -h; %f
    -h, -h, -h; %g
    +h, -h, -h; %h
    ];
faces = [
    1 2 3 4;  % cara frontal (+z)  a-b-c-d
    5 6 7 8;  % cara trasera  (-z)  e-f-g-h
    1 5 8 4;  % cara derecha (+x)  a-e-h-d
    2 6 7 3;  % cara izquierda (-x) b-f-g-c
    1 2 6 5;  % cara superior (+y) a-b-f-e
    4 3 7 8;  % cara inferior (-y) d-c-g-h
    ];
figure
patch('Vertices', vertices, 'Faces', faces, ...
    'FaceColor', [0.8 0.8 1], 'EdgeColor', 'k', 'FaceAlpha', 1)
axis equal
view(3)
xlabel('X'), ylabel('Y'), zlabel('Z')
grid on


