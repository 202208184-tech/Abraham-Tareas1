function DibujaEjes(AxisLength)


Delta = [-AxisLength AxisLength];

line(Delta, [0 0], [0 0], "LineWidth", 2, "Color", "red");
line([0 0], Delta, [0 0], "LineWidth", 2, "Color", "red");
line([0 0], [0 0], Delta, "LineWidth", 2, "Color", "red");

view(45, 30)

hold on;
grid on;

axis equal;

end
