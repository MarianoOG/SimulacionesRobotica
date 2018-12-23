%% Ejemplo 2 - Robot Cilindrico:
addpath('Common');
initPeterCorkeToolboox();

% Crear objeto de robot:
d = [1,-90*pi/180]; % Dimensiones del robot
w = [-3, 3, -3, 3, 0, 5];
L1 = Link('d',d(1),'a',0,'alpha',0);
L2 = Link('theta',0,'a',0,'alpha',d(2));
L3 = Link('theta',0,'a',0,'alpha',0);
robot = SerialLink([L1, L2, L3],'name','Cilindrico');

% Animacion
% q = [180*pi/180, 2, 2]; % Posicion final
q = paramsCilindrico(-1,-2,3);
robot.fkine(0*q);
robot.plot(0*q,'workspace',w);
n = 20;
for i = 1:n
    pause(.5);
    robot.fkine(i*q/n);
    robot.plot(i*q/n,'workspace',w);
end
