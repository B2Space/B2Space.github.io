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

``` java
import controlP5.*;             // Library required for sliders

float L1, L2;                   // Lengths of Links 1 and 2
float theta1, theta2;           // Angles from horizontal for Link 1 and angle from Link 1 for Link 2
int target1 = 0;                // Initialise target1
int target2 = 0;                // Initialise target2
float x0,x1,x2,y0,y1,y2;        // Initialise joint end and start positions
float moveSpeed;                // Rotation speed of the arm          

ControlP5 slider;               // Initialise the slider for target1
ControlP5 slider2;              // Initialise the slider for target2


void setup()                    // This section only occurs once
{
        
  slider = new ControlP5(this);                                             // Create new Slider object
  slider.addSlider("target1").setPosition(600,200).setRange(0,359);         // Set parameters for the slider
  
  slider2 = new ControlP5(this);                                              
  slider2.addSlider("target2").setPosition(600,250).setRange(-179,179);
  
  size(800,800);       // Set canvas size                                         
  
  L1 = width/5;        // Fix length of arms
  L2 = width/8;
 
  x0 = 0;              // Base position remains fixed
  y0 = 0;
  x1 = x0 + L1;        // Arm 1 begins horizontal and is connected to the Base
  y1 = 0;
  x2 = x1 + L2;        // Arm 2 begins horizontal and is connected to the end of Arm 1
  y2 = 0;
  
  theta1 = 0;          // Initial angles are 0
  theta2 = 0;
  
  moveSpeed = 0.5;     // Set rate of rotation
  
}

void draw()                          // This section is constantly looping
{
  pushMatrix();                      // Save the current screen orientation
    
  background(100);                   // Refresh the background
  
  
  translate(width/2,height/2);       // Move the origin of the canvas to the middle of the page
  
  
  if(theta1 < target1)               // Move Arm 1 till it reaches the target
  {
    theta1 +=moveSpeed;
  }
  
  if(theta2 < target2)               // Move Arm 2 till it reaches the target
    {
      theta2 += moveSpeed;
    }
    
    
  if(theta1 > target1)               // Move Arm 1 till it reaches the target
  {
    theta1 -=moveSpeed;
  }
  
  if(theta2 > target2)               // Move Arm 2 till it reaches the target
  {
    theta2 -= moveSpeed;
  }
    
  
  print(theta1 + " " + theta2 + "\n");  // Print the current angle values to the console
  
  x1 = L1 * cos(radians(theta1));       // Perform trigonometry to calculate the coordinates of the Arm 1 end /  Arm 2 beginning
  y1 = L1 * sin(radians(theta1));
  
  x2 = L2 * cos(radians(theta1 + theta2)) + x1;   // Perform trigonometry to calculate the coordinates of Arm 2 end
  y2 = L2 * sin(radians(theta1 + theta2)) + y1;
  
  
  stroke(255,0,0);           // Draw Arm 1
  line(x0,y0,x1,y1);
  ellipse(x0,y0,5,5);        // Draw Base Joint
  
  stroke(10);                // Draw Arm 2
  line(x1,y1,x2,y2);
  
  ellipse(x1,y1,5,5);        // Draw Arm 1 Joint
  
  ellipse(x2,y2,5,5);        // Draw Arm 2 Joint
  
  popMatrix();               // Reload the screen back
}

```
The project can be shown in the short GIF below.

![ArmAnimation](https://user-images.githubusercontent.com/68944131/89114568-4636e200-d4c1-11ea-8704-d1d7b595bb37.gif)

So this small code project shows how a 2DOF robot can be controlled easily by manipulating its relative angles with each other and the fixed horizontal axis. Future developments and adjustments to this project could include making a Double Pendulum that uses Forward Kinematics, expanding this to a 3DOF system, implementing collision between the arms and an external wall as well as variable speed control.




---

And for **Inverse Kinematics** the solutions are a bit more complicated but can also be found using trigonometry:

`theta2 = arccos((x2^2 + y2^2 - L1^2 - L2^2) / (2 * L1 * L2))`

`theta1 = arctan(y2/x2) -  arctan( (L2 * sin(theta2)) / (L1 + L2 * cos(theta2))`

It is important to note that inverse kinematics will always result in 2 solutions where if a solution `theta` exists, then there exists another solution `theta + 2 * n * PI` where n is an integer.
