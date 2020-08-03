float L1,L2;                                  // Length of arm 1 and arm 2
float theta1, theta2;                         // Angles of arm 1 relative to horizontal axis and arm 2 relative to arm 1
float targetAngle1, targetAngle2;             // Target angles calculated by trigonometry
float targetPositionX, targetPositionY;       // Target positions chosen by mouse click
float x0,x1,x2,y0,y1,y2;                      // Position variables
float moveSpeed;                              // Rotation speed of arms

void setup()
{
 
  size(800,800);                              // Screen size
  
  L1 = width/5;                               // Arm 1 and Arm 2 size
  L2 = width/8;
  
  x0 = 0;                                     // Base joint coordinates
  y0 = 0;
  
  theta1 = 0;                                 // Initial angles
  theta2 = 0;
  
  moveSpeed = 0.5;                            // Set rotation speed
}

void draw ()
{
  pushMatrix();                               // Save current state of screen
        
  background(100);                            // Reset the screen
  
  translate(width/2,height/2);                // Move origin to middle of screen rather than top-left.
  
  targetAngle2 = acos((targetPositionX*targetPositionX + targetPositionY*targetPositionY - L1*L1 - L2*L2)/(2*L1*L2));   // Use inverse trig formulas to calculate Angles based on target Positions
  targetAngle1 = atan(targetPositionY/targetPositionX) - atan((L2 * sin(targetAngle2))/(L1 + L2*cos(targetAngle2)));
  
  
  if(targetPositionX < 0)       // Due to the multiple solutions and quadrants, add PI to circumvent this issue.
  {
    targetAngle1 += PI;
 
  }
  
  if(theta1 < degrees(targetAngle1))    // Move Arm 1
  {
    theta1 += moveSpeed;
  }
   if(theta2 < degrees(targetAngle2))   // Move Arm 2
  {
    theta2 += moveSpeed;
  }
  
   if(theta1 > degrees(targetAngle1))   // Move Arm 1
  {
    theta1 -= moveSpeed;
  }
   if(theta2 > degrees(targetAngle2))   // Move Arm 2
  {
    theta2 -= moveSpeed;
  }
  
  x1 = L1 * cos(radians(theta1));       // Use forward kinematics trigonometry formulas to recalcuate the effector positions
  y1 = L1 * sin(radians(theta1));
  
  x2 = L2 * cos(radians(theta1 + theta2)) + x1;
  y2 = L2 * sin(radians(theta1 + theta2)) + y1;
  
  
  fill(100,200,100);                    // Draw outer locus
  ellipse(0,0,520,520);
                
  fill(100);                            // Draw inner locus
  ellipse(0,0,120,120);
 
  stroke(255,0,0);                      // Draw Arm 1 with Base Joint
  line(x0,y0,x1,y1);
  fill(255,0,0);
  ellipse(x0,y0,5,5);
  
  stroke(10);                           // Draw Arm 2 with Arm 1 joint and end Joint.
  line(x1,y1,x2,y2);
  fill(255,0,0);
  ellipse(x1,y1,5,5);
  fill(0,0,0);
  ellipse(x2,y2,5,5);

  popMatrix();                          // Restore the screen
}

void mouseClicked()                     // In the event of mouse click, execute this code.
{
   if(mouseX <= 660 && mouseX >= 140 && mouseY <= 660 && mouseY >= 140)         // Bounds of clickable area are shown by the green donut.
  {
    targetPositionX = mouseX-400;       // Have to take into account the translation of the origin
    targetPositionY = mouseY-400;
  } 
}
