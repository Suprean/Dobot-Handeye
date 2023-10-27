
clear all
close all
bag = rosbag('C:\Users\Zixuan Yan\Documents\20231026_162019.bag');
depth = select(bag,'Topic','/device_0/sensor_0/Depth_0/image/data');
color = select(bag,'Topic','/device_0/sensor_1/Color_0/image/data');
first_depth = readMessages(depth);
first_color = readMessages(color);
m_rgb=first_color{1,1};
m_depth=first_depth{1,1};
image_rgb=readImage(m_rgb);
image_depth=readImage(m_depth);


I = rgb2gray(image_rgb);
cornerPoints = detectHarrisFeatures(I,'MinQuality',0.2,'ROI',[680/2,480/3, 150, 150]);



strongest = selectStrongest(cornerPoints,1);
imshow(I)
hold on
plot(strongest)
M = strongest.Location;
u = round(M(1,1));
v = round(M(1,2));
z = image_depth(u,v);


