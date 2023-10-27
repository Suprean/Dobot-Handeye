% Define intrinsic parameters
intrinsic_parameters.image_resolution = [1080, 1920];
intrinsic_parameters.principle_point = [974,538];
intrinsic_parameters.focal_length = 1388;

% Given image coordinates and depth
u = 381;
v = 263 ;
Z = 327; % Example depth value

% Compute 3D position from 2D image coordinate and depth
[X, Y] = Compute3Dfrom2D(u, v, Z, intrinsic_parameters);

% Print the results
fprintf('3D position of the feature in the camera coordinate frame: (%f, %f, %f)\n', X, Y, Z);

R = [0.9920, 0.1135, -0.0546
-0.1129, 0.9935, 0.0136
0.0558, -0.0073, 0.9984]; 
T = [-52.581336 -124.8084 566.7019]; 
Pc = [X; Y; Z];
Pg = R * Pc + T';
fprintf('3D position in the global coordinate frame: (%f, %f, %f)\n', Pg(1), Pg(2), Pg(3));

% Compute Xr and Yr from Pg
Xr = Pg(2) + 440  ;
Yr = Pg(1) + 195 ;

% Print Xr and Yr
fprintf('Computed values: Xr = %f, Yr = %f\n', Xr, Yr);

function [X, Y] = Compute3Dfrom2D(u, v, Z, intrinsic_parameters)
    % Extract the necessary parameters from the intrinsic parameters
    principle_point = intrinsic_parameters.principle_point;
    focal_length = intrinsic_parameters.focal_length;

    % Convert to normalized camera coordinates
    x_normalized = (u - principle_point(1)) / focal_length;
    y_normalized = (v - principle_point(2)) / focal_length;

    % Compute the 3D position using depth Z
    X = x_normalized * Z;
    Y = y_normalized * Z;
end
