function LineaPuntos(PuntoInit, PuntoFin, Color)

DeltaX = [PuntoInit(1) PuntoFin(1)];
DeltaY = [PuntoInit(2) PuntoFin(2)];
DeltaZ = [PuntoInit(3) PuntoFin(3)];

line(DeltaX, DeltaY, DeltaZ, "Linewidth", 2, "Color", Color);

end