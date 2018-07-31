function params = config()
    % define parameters
    params.Z0 = 2.5; % height of camera
    params.alpha = 82; % angle rotated around X axis in degrees
    params.lambda = 0.05; % camera focal length
    
    params.cy = 1024; params.cx = 1280; % focal centre of camera
    %params.sy = 1.2e-05; % defined by the aspect ratio
    params.n = 2048; params.m = 2560; %height, width of image 
    
    %% These parameters are set from cam_geo.csv
    cam_geo = readtable(fullfile(dataDir(),'A27','Year2','cam_geo.csv'));
    %params.theta = cam_geo.CAM2_THETA; % extra tilt
    params.theta = 0;

    params.r1 = cam_geo.CAM2_LVRX/1000; 
    params.r2 = cam_geo.CAM2_LVRY/1000; 
    params.r3 = cam_geo.CAM2_LVRZ/1000; % position of camera on fixing
    
end 