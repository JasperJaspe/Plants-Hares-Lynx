t0 = 0;                 	% start time of simulation [in months]
tfinal = 200;                % end time of simulation [in months]
tspan = [t0 tfinal];        % time span defined by the start and end times of the simulation [in months]
a1 = 5;      % plant → hare predation
a2 = 0.5;    % hare → lynx predation
b1 = 5;      % plant handling time
b2 = 2;      % hare handling time
d1 = 0.3;    % hare death
d2 = 0.05;   % lynx death
y0 = [0.8 0.5 0.2];       
              

% The system of ordindary differential equations for sharks and tuna are
% solved numerically by taking tiny steps forward in time and estimating
% the solution.
for i = 1:6

[t,y] = ode45(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1(i),d2), tspan, y0);

% plotting the population over time
figure("Name",'Plant, Hare & Lynx')
plot(t,y)
title('Plants/Hares/Lynxes Populations Over Time')
xlabel('Time [months]')
ylabel('Population')
legend('Plant','Hare', 'Lynx', 'Location','North')

% Now, we are also going to plot the state space:
% plotting the state space
figure("Name",'State space')
plot3(y(:,1),y(:,2),y(:,3))
title('State space')
xlabel('Plant Population')
ylabel('Hare Population')
zlabel('Lynx Population')
end