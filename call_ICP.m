% call_ICP.m prepares the data that will be processed using ICP (Interactive Closest Point).
% Wilm Jakob and Martin Kjer, Technical University of Denmark, 2012.

n=1046232; %n data number to process (1046232 total data)
I=10; %iteration number
%
%% Load model-matrix 
load('C:\Users\Gloria\Desktop\Tarea GIS\point_cloud_registration\pointcloud1.fuse'); %Path model file = 'pointcloud1.fuse' file
M1=[pointcloud1(:,1,1,1),pointcloud1(:,2,1,1),pointcloud1(:,3,1,1)]; %Selection of first three columns (x,y,z)
M1 = M1.'; %matrix-M1 transpose
M=M1(:,1:n); %data selection-n
%
%% Load data-matrix
load('C:\Users\Gloria\Desktop\Tarea GIS\point_cloud_registration\pointcloud2.fuse');%Path data file = 'pointcloud2.fuse' file
D1=[pointcloud2(:,1,1,1),pointcloud2(:,2,1,1),pointcloud2(:,3,1,1)]; %Selection of first three columns (x,y,z)
D1 = D1.'; %matrix-D1 transpose
D=D1(:,1:n); %data selection-n
%
%% Run ICP
[Ricp Ticp ER t] = icp(M, D, I, 'EdgeRejection', true, 'Boundary', 'Matching'); %call 'icp' routine
%
%Transform data-matrix using ICP result
Dicp = Ricp * D + repmat(Ticp, 1, n); %repmat function Repeat copies of array

