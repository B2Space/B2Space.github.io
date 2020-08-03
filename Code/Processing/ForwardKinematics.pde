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
