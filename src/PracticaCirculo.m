%% Practica - Crear circulo
addpath('Common');
initPeterCorkeToolboox();

% Crear objeto de robot:
w = [-2, 2, -1, 4, 0, 5];
L1 = Link('d',1,'a',0,'alpha',0);
L2 = Link('theta',0,'a',0,'alpha',-90*pi/180);
L3 = Link('theta',0,'a',0,'alpha',0);
L4 = Link('d',0,'a',0,'alpha',-90*pi/180);
L5 = Link('d',0,'a',0,'alpha',90*pi/180);
L6 = Link('d',1,'a',0,'alpha',0);
robot = SerialLink([L1, L2, L3, L4, L5, L6],'name','Circulo');

% Animacion:
figure(1)
alpha = (0:10:360)*pi/180;
n = length(alpha);
q = zeros(n,6);
for i = 1:n
    q(i,:) = cinInvCirculo(alpha(i));
    plot3(cos(alpha),3*ones(1,length(alpha)),sin(alpha)+3); hold on
    robot.fkine(q(i,:));
    robot.plot(q(i,:),'workspace',w);
    axis(w);
    pause(.5);
end

figure(2)
for i = 1:6
    subplot(2,3,i)
    plot(alpha,q(:,i))
    title(['q',num2str(i),'(alpha)'])
    xlabel('alpha')
    ylabel(['q',num2str(i)])
    xlim([0,2*pi])
end

figure(1)
while(true)
    a = input('Ingresa la posicion en grados: ');
    q = cinInvCirculo(a*pi/180);
    plot3(cos(alpha),3*ones(1,length(alpha)),sin(alpha)+3); hold on
    robot.fkine(q);
    robot.plot(q,'workspace',w);
    axis(w);
end