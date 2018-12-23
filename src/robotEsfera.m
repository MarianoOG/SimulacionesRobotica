%% Ejemplo 3 - Robot Esferico:
addpath('Common');
initPeterCorkeToolboox();

% Crear objeto de robot:
d = [-90*pi/180,90*pi/180,1]; % Dimensiones del robot
L1 = Link('d',0,'a',0,'alpha',d(1));
L2 = Link('d',0,'a',0,'alpha',d(2));
L3 = Link('d',d(3),'a',0,'alpha',0);
robot = SerialLink([L1, L2, L3],'name','Esfera');

% Animacion
q = [180, 90, 90]*pi/180; % Posicion final
robot.fkine(0*q);
robot.plot(0*q);
n = 20;
for i = 1:n
    pause(.5);
    robot.fkine(i*q/n);
    robot.plot(i*q/n);
end
