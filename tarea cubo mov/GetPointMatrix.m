function PointMatrix = GetPointMatrix(Largo, Ancho, Alto, XInit, YInit, ZInit)

P1 = [XInit; YInit; ZInit; 1];
P2 = [XInit + Ancho; YInit; ZInit; 1];
P3 = [XInit; YInit + Largo; ZInit; 1];
P4 = [XInit + Ancho; YInit + Largo; ZInit; 1];

P5 = [XInit; YInit; ZInit + Alto; 1];
P6 = [XInit + Ancho; YInit; ZInit + Alto; 1];
P7 = [XInit; YInit + Largo; ZInit + Alto; 1];
P8 = [XInit + Ancho; YInit + Largo; ZInit + Alto; 1];

PointMatrix = [P1, P2, P3, P4, P5, P6, P7, P8];

end
