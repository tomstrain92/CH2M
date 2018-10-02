function eqns = cameraEquationsExperiment

m = 4032; cx = 2016; % >
n = 3024; cy = 1512; % ^
camera_height = 0.21;

stickyNotesData = readtable(fullfile(dataDir(),'Experiment','StickyNotes.csv'));

syms L1 L2 G A
B = 0;
%% first sticky note
row = 1;
u = stickyNotesData(row,:).U - cx; v = cy - stickyNotesData(row,:).V;
x = stickyNotesData(row,:).X; y = stickyNotesData(row,:).Y;
z = -camera_height;

eqn1 = u == m*L1*(...
                 (x*(cos(G)*cos(B)) + y*(-sin(G)*cos(A) + cos(G)*sin(B)*sin(A)) + z*(sin(G)*sin(A) + cos(G)*sin(B)*cos(A)))/...
                 (x*(sin(G)*cos(B)) + y*(cos(B)*cos(A) + sin(G)*sin(B)*sin(A)) + z*(-cos(G)*sin(A) + sin(G)*sin(B)*cos(A)))...
                );

eqn2 = v == n*L2*(...
                 (x*(-sin(B)) + y*(cos(B)*sin(A)) + z*(cos(B)*cos(A)))/...
                 (x*(sin(G)*cos(B)) + y*(cos(B)*cos(A) + sin(G)*sin(B)*sin(A)) + z*(-cos(G)*sin(A) + sin(G)*sin(B)*cos(A)))...
                );

%% second sticky note
row = 3;
u = stickyNotesData(row,:).U - cx; v = cy - stickyNotesData(row,:).V;
x = stickyNotesData(row,:).X; y = stickyNotesData(row,:).Y;
z = -camera_height;

eqn3 = u == m*L1*(...
                 (x*(cos(G)*cos(B)) + y*(-sin(G)*cos(A) + cos(G)*sin(B)*sin(A)) + z*(sin(G)*sin(A) + cos(G)*sin(B)*cos(A)))/...
                 (x*(sin(G)*cos(B)) + y*(cos(B)*cos(A) + sin(G)*sin(B)*sin(A)) + z*(-cos(G)*sin(A) + sin(G)*sin(B)*cos(A)))...
                );

eqn4 = v == n*L2*(...
                 (x*(-sin(B)) + y*(cos(B)*sin(A)) + z*(cos(B)*cos(A)))/...
                 (x*(sin(G)*cos(B)) + y*(cos(B)*cos(A) + sin(G)*sin(B)*sin(A)) + z*(-cos(G)*sin(A) + sin(G)*sin(B)*cos(A)))...
                );
 
%% Vanishing Point
up = -47; vp = -68;

eqn5 = up == m*L1*(...
                (-sin(G)*cos(A) + cos(G)*sin(B)*sin(A))/...
                (cos(B)*cos(A) + sin(G)*sin(B)*sin(A))...
                );

eqn6 = vp == n*L2*(...
                (cos(B)*sin(A))/...
                (cos(B)*cos(A) + sin(G)*sin(B)*sin(A))...
                );

sol = solve(eqn1,eqn2,eqn3,eqn4)%,eqn5,eqn6)
