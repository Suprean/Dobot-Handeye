# Dobot-Handeye
This is done by Group 8 for project 3 

Software needed:
MATLAB, REALSENSE-Viewer, DobotLab. 
Also you should install the Computer vision and Robotics Toolbox in MATLAB. 

The control process is done in the DobotLab. 

Steps:

In order to finish the task, the first thing is using REALSENSE-Viewer to generate a .bag file. With the target object in the image.

Then, use the deth_emample.m file to get the Harrisfeature point and the depth. 

Next use the eyeinhand.m or eyetohand.m to get the point that the robot arm need to go. Using eyeinhand.m or eyetohand.m depends on your camera setup. 

Finally, use the figures you generate from the previous step as input to control the robot arm through the Control_on_Dobotlab.py. 

This project is done by:



Zixuan Yan    24675441


Yuanbo Xu     24601231


Haosong Teng  12999064
