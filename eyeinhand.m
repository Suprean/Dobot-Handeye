% Define intrinsic parameters
intrinsic_parameters.image_resolution = [1080, 1920];
intrinsic_parameters.principle_point = [1023,555];
intrinsic_parameters.focal_length = 815;

% Given image coordinates and depth
u = 414;
v = 480-195;
Z = 197; % Example depth value

% Compute 3D position from 2D image coordinate and depth
[X, Y] = Compute3Dfrom2D(u, v, Z, intrinsic_parameters);

% Print the results
fprintf('3D position of the feature in the camera coordinate frame: (%f, %f, %f)\n', X, Y, Z);

R = [0.997103403289506 0.0680407176613879 0.0339891731086189
-0.0671555450574757 0.997389472890669 -0.0265400100773575
-0.0357062447831990 0.0241805729253087 0.999069749305065]; 
T = [-80.8798113067158 -64.0907525189128 179.024548010274]; 
Pc = [X; Y; Z];
Pg = R * Pc + T';
fprintf('3D position in the global coordinate frame: (%f, %f, %f)\n', Pg(1), Pg(2), Pg(3));

% Compute Xr and Yr from Pg
Xr = Pg(1) + 464  ;
Yr = Pg(2) + 159 - 5;

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
