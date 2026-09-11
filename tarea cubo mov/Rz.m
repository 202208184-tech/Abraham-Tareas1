function RM = Rz(eje, angle)

% Limpiar la entrada: eliminar espacios y comillas
eje = strtrim(eje);  % Eliminar espacios al inicio y final
eje = strip(eje, "'");  % Eliminar comillas simples
eje = strip(eje, '"');  % Eliminar comillas dobles

switch lower(eje)
    case 'x'
        RM = [1       0           0       0;
            0       cos(angle)  -sin(angle) 0;
            0       sin(angle)  cos(angle)  0;
            0       0           0       1];
    case 'y'
        RM = [cos(angle)   0       sin(angle)  0;
            0            1       0           0;
            -sin(angle)  0       cos(angle)  0;
            0            0       0           1];
    case 'z'
        RM = [cos(angle)   -sin(angle)     0   0;
            sin(angle)   cos(angle)      0   0;
            0            0               1   0;
            0            0               0   1];
    otherwise
        error('Eje no válido. Use ''x'', ''y'' o ''z''');
end

end
