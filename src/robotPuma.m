%% Ejemplo 6 - Robot PUMA:
addpath('Common');
initPeterCorkeToolboox();

% Crear objeto de robot:
d = [3,.5,2,.5];
a = 2;
w = [-5, 5, -5, 5, 0, 5];
L1 = Link('d',d(1),'a',0,'alpha',0);
L2 = Link('d',0,'a',0,'alpha',-pi/2);
L3 = Link('d',d(2),'a',a(1),'alpha',0);
L4 = Link('d',d(3),'a',0,'alpha',-pi/2);
L5 = Link('d',0,'a',0,'alpha',-pi/2);
L6 = Link('d',d(4),'a',0,'alpha',pi/2);
robot = SerialLink([L1, L2, L3, L4, L5, L6],'name','Puma');

% Animacion
q = [0, 0, 0, 0, 0, 90]*pi/180; % Posicion final
robot.fkine(0*q);
robot.plot(0*q,'workspace',w);
n = 20;
for i = 1:n
    pause(.5);
    robot.fkine(i*q/n);
    robot.plot(i*q/n,'workspace',w);
end
