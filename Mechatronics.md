# Mechatronics Projects


## University Projects
As a mechatronics engineering student, I aim to document my projects and learnings on this page along with my hobby of space engineering.


### Robot Kinematics
This project involves designing a 2DOF robotic arm which can move in 2D space. It can be operated either using Forward Kinematics - where desired angles are input and the positions are calculated. Or by Inverse Kinematics - where the desired positions are input and the joint angles are calculated. 

For a 2DOF robot, it is easy to derive the equations of motion using trigonometry to create a relationship between joint lengths and joint angles.

---

![image](https://user-images.githubusercontent.com/68944131/89091516-b6743380-d3ed-11ea-9e29-3b3b56754648.png)


---

From the above image the following equations can be derived for **Forward Kinematics** : 


`x2 = L2 * cos(theta1 +  theta2) + L1 * cos(theta1)`

`y2 = L2 * sin(theta1 +  theta2) + L1 * sin(theta1)`


I created this project using Processing 3 which made it easier to visualise the actual system being moved. Instead of having the input angles typed, I thought it would be more intuitive to have a slider system much like how excavator controls operate in order to chose the target angle. The first iteration of the program worked successfuly and is shown below. It does **not** include the collision mechanic with the wall which requires recalculating the way that the arm approaches the set target angles. 

The code for **Forward Kinematics** is here:
[Forward Kinematics](./Code/Processing/ForwardKinematics.pde)

The project can be shown in the short GIF below.

![ArmAnimation](https://user-images.githubusercontent.com/68944131/89114568-4636e200-d4c1-11ea-8704-d1d7b595bb37.gif)

So this small code project shows how a 2DOF robot can be controlled easily by manipulating its relative angles with each other and the fixed horizontal axis. Future developments and adjustments to this project could include making a Double Pendulum that uses Forward Kinematics, expanding this to a 3DOF system, implementing collision between the arms and an external wall as well as variable speed control.




---

And for **Inverse Kinematics** the solutions are a bit more complicated but can also be found using trigonometry:

`theta2 = arccos((x2^2 + y2^2 - L1^2 - L2^2) / (2 * L1 * L2))`

`theta1 = arctan(y2/x2) -  arctan( (L2 * sin(theta2)) / (L1 + L2 * cos(theta2))`

It is important to note that inverse kinematics will always result in 2 solutions where if a solution `theta` exists, then there exists another solution `theta + 2 * n * PI` where n is an integer. I also did this project using Processing 3 which made it easier to visualise the actual system being moved. Instead of using a slider system like with Forward Kinematics, the Locus of available points reachable by the arm is shown by the green circle and is dependent on the arm lengths. Clicking anywhere within the green circle will cause the program to calculate the required angles and move the arm to the designated position. 

The code for **Inverse Kinematics** is here:
[Inverse Kinematics](./Code/Processing/InverseKinematics.pde)


The project can be shown in the short GIF below.

![inverseKin](https://user-images.githubusercontent.com/68944131/89171296-49ff5d00-d5c4-11ea-9e2a-c23ede309cce.gif)


So this small code project shows how a 2DOF robot can be controlled easily by manipulating its position and angles with a fixed horizontal axis. Future developments and adjustments to this project could include making a simple hand waving animation using Inverse Kinematics, adding more degrees of freedom, and possibly making a 3D version including the Z-axis utilising PVectors and Classes instead.




---
