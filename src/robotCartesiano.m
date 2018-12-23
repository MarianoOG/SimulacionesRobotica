%% Ejemplo 5 - Robot Cartesiano:
addpath('Common');
initPeterCorkeToolboox();

% Crear objeto de robot:
w = [-3, 3, -3, 3, -3, 3];
L1 = Link('theta',0,'a',0,'alpha',-pi/2);
L2 = Link('theta',pi/2,'a',0,'alpha',pi/2);
L3 = Link('theta',0,'a',0,'alpha',0);
robot = SerialLink([L1, L2, L3],'name','Cartesiano');

% Animacion
q = [1, 1.5, 2]; % Posicion final
robot.fkine(0*q);
robot.plot(0*q,'workspace',w);
n = 20;
for i = 1:n
    pause(.5);
    robot.fkine(i*q/n);
    robot.plot(i*q/n,'workspace',w);
end
