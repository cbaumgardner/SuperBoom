clear all;
clf;

% Initialize variables.
rayNum = 10;                 
v1 = 400;                          % Layer velocities.
v2 = 600;
v3 = 800;
theta1 = asin(v1/v2);              % Critical angle.
disp('Critical angle:');
disp(theta1);
theta2 = asin(sin(theta1)*(v2/v1));
theta3 = asin(sin(theta2)*(v3/v2));
x0 = 0.0;                          % Shot location.
y0 = 0.0;                          % Ground.
y1 = 50;                           % Interface depth.
x1 = y1*tan(theta1);
y2 = 4*y1;
xStep = x1/rayNum;
thetaDegrees= theta1*57.2957795;
displayAngle = round(thetaDegrees)


% Set up figure.
axis([-4*y1,4*y1,-3*y1, .1*y1]);
xlabel('distance', 'FontSize', 18);
ylabel('depth', 'FontSize', 18);
title(sprintf('BOOM! Critical angle is %g degrees', ...
    displayAngle), 'FontSize', 24);
hold on; 

% Start plotting.
plot(x0, 0, '*');                    % Plot shot point.
line([4*y1 -4*y1], [0 0], 'Color', 'k');   % Draw 'ground'.
line([4*y1 -4*y1], [-y1 -y1], 'Color', 'k');   % Draw first interface.  
line([4*y1 -4*y1], [-2*y1 -2*y1], 'Color', 'k');    % Draw second interface.


for i=1:rayNum                  % First Layer up to critical angle.

    x1 = y1*tan(theta1);
    x1 = i*xStep;
    theta1 = atan(x1/y1);
    theta2 = asin(sin(theta1)*(v2/v1));
    theta3 = asin(sin(theta2)*(v3/v2));

    
   
        firstReflectX(1) = x0;                % Shot point.
        firstReflectY(1) = y0;

        firstReflectX(2) = x0+x1;             % Ray contacts interface.
        firstReflectY(2) = -y1;

        firstReflectX(3) = x0+2*x1;           % Ray is reflected to surface.
        firstReflectY(3) = y0;

        p1 = plot(firstReflectX, firstReflectY, 'EraseMode', 'none');

        firstReflectX2(1) = x0;                 % Process repeated in opposite direction.
        firstReflectY2(1) = y0;

        firstReflectX2(2) = x0-x1;
        firstReflectY2(2) = -y1;

        firstReflectX2(3) = -(x0+2*x1);
        firstReflectY2(3) = y0;

        plot(firstReflectX2, firstReflectY2);
    
        firstRefractX(1) = x0+x1;
        firstRefractY(1) = -y1;
    
        firstRefractX(2) = y1*tan(theta2);
        firstRefractY(2) = -2*y1;
 
        plot(firstRefractX, firstRefractY, 'r');
    
        firstRefractX2(1) = x0-x1;
        firstRefractY2(1) = -y1;
    
        firstRefractX2(2) = -y1*tan(theta2);
        firstRefractY2(2) = -2*y1;
 
        p2 = plot(firstRefractX2, firstRefractY2, 'r');
        
end



for i=1:3                         % First layer reflections past critical distance
    x1 = y1*tan(theta1);    
    x1 = x1+i*xStep;
    theta1 = atan(x1/y1);
    theta2 = asin(sin(theta1)*(v2/v1));
    
        reflectX(1) = x0;                % Shot point.
        reflectY(1) = y0;

        reflectX(2) = x0+x1;             % Ray contacts interface.
        reflectY(2) = -y1;

        reflectX(3) = x0+2*x1;           % Ray is reflected to surface.
        reflectY(3) = y0;

        p4 = plot(reflectX, reflectY, 'k', 'EraseMode', 'none');

        reflectX2(1) = x0;                 % Process repeated in opposite direction.
        reflectY2(1) = y0;

        reflectX2(2) = x0-x1;
        reflectY2(2) = -y1;

        reflectX2(3) = -(x0+2*x1);
        reflectY2(3) = y0;

        plot(reflectX2, reflectY2, 'k');
        
end

for i=1:rayNum*(1/2)                  % First Layer up to critical angle.

    x1 = y1*tan(theta1);
    x1 = i*xStep;
    theta1 = atan(x1/y1);
    theta2 = asin(sin(theta1)*(v2/v1));
    theta3 = asin(sin(theta2)*(v3/v2));

    
   
        firstReflectX(1) = x0;                % Shot point.
        firstReflectY(1) = y0;

        firstReflectX(2) = x0+x1;             % Ray contacts interface.
        firstReflectY(2) = -y1;

        firstReflectX(3) = x0+2*x1;           % Ray is reflected to surface.
        firstReflectY(3) = y0;

        p1 = plot(firstReflectX, firstReflectY, 'EraseMode', 'none');

        firstReflectX2(1) = x0;                 % Process repeated in opposite direction.
        firstReflectY2(1) = y0;

        firstReflectX2(2) = x0-x1;
        firstReflectY2(2) = -y1;

        firstReflectX2(3) = -(x0+2*x1);
        firstReflectY2(3) = y0;

        plot(firstReflectX2, firstReflectY2);
    
        firstRefractX(1) = x0+x1;
        firstRefractY(1) = -y1;
    
        firstRefractX(2) = y1*tan(theta2);
        firstRefractY(2) = -2*y1;
 
        plot(firstRefractX, firstRefractY, 'r');
    
        firstRefractX2(1) = x0-x1;
        firstRefractY2(1) = -y1;
    
        firstRefractX2(2) = -y1*tan(theta2);
        firstRefractY2(2) = -2*y1;
 
        p2 = plot(firstRefractX2, firstRefractY2, 'r');
        
        secondRefractX(1) = y1*tan(theta2);
        secondRefractY(1) = -2*y1;
        
        secondRefractX(2) = y1*tan(theta2)+y2*tan(theta3);
        secondRefractY(2) = -y2;
        
        plot(secondRefractX, secondRefractY, 'm');
        
        secondRefractX(1) = -(y1*tan(theta2));
        secondRefractY(1) = -2*y1;
        
        secondRefractX(2) = -(y1*tan(theta2)+y2*tan(theta3));
        secondRefractY(2) = -y2;
        
        p3 = plot(secondRefractX, secondRefractY, 'm');
  
end
    

legend([p1, p4, p2, p3],'Reflection', 'Reflection past critical distance', 'Refraction (1st layer)', 'Refraction (2nd layer)');
hold off;



    