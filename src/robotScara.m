%% Ejemplo 4 - Robot SCARA:
addpath('Common');
initPeterCorkeToolboox();

% Crear objeto de robot:
d = [1,1,1]; % Dimensiones del robot
w = [-3, 3, -3, 3, -5, 5];
L1 = Link('d',0,'a',d(1),'alpha',0);
L2 = Link('d',0,'a',d(2),'alpha',pi);
L3 = Link('theta',90*pi/180,'a',0,'alpha',0);
L4 = Link('d',d(3),'a',0,'alpha',0);
robot = SerialLink([L1, L2, L3, L4],'name','SCARA');

% Animacion
q = [180*pi/180, 90*pi/180, 2, 90*pi/180]; % Posicion final
robot.fkine(0*q);
robot.plot(0*q,'workspace',w);
n = 20;
for i = 1:n
    pause(.5);
    robot.fkine(i*q/n);
    robot.plot(i*q/n,'workspace',w);
end
