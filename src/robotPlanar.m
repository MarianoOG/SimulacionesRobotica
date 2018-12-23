%% Ejemplo 1 - Robot Planar:
addpath('Common');
initPeterCorkeToolboox();

% Crear objeto de robot:
d = [1,2]; % Dimensiones del robot
L1 = Link('d',0,'a',d(1),'alpha',0);
L2 = Link('d',0,'a',d(2),'alpha',0);
robot = SerialLink([L1, L2],'name','Planar');

% Animacion
q = [90, 90]*pi/180; % Posicion final
robot.fkine(0*q);
robot.plot(0*q);
n = 20;
for i = 1:n
    pause(.5);
    robot.fkine(i*q/n);
    robot.plot(i*q/n);
end