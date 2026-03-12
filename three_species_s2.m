t0 = 0;                 	% start time of simulation [in months]
tfinal = 200;               % end time of simulation [in months]
tspan = [t0 tfinal];        % time span defined by the start and end times of the simulation [in months]
a1 = 3;                     % hare hunting plant
a2 = 1;                     % lynx hunting hare
b1 = 3;                     % hare eating efficiency
b2 = 2;                     % lynx eating efficiency
d1 = 0.2;                   % hare natural death rate
d2 = 0.8;                   % lynx natural death rate
y0 = [1 1 1];     
              
for i = 1:1

[t,y] = ode45(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1(i),d2), tspan, y0);

% plotting the population over time
figure("Name",'Plant, Hare & Lynx')
plot(t,y)
title('Plants/Hares/Lynxes Populations Over Time')
xlabel('Time [months]')
ylabel('Population')
legend('Plant','Hare', 'Lynx', 'Location','North')

% plotting the state space
figure("Name",'State space')
plot3(y(:,1),y(:,2),y(:,3))
title('State space')
xlabel('Plant Population')
ylabel('Hare Population')
zlabel('Lynx Population')
end