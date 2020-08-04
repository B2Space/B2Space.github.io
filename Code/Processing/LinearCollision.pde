PVector Block1Pos;
PVector Block1Vel;

PVector Block2Pos;
PVector Block2Vel;

float Block1Mass = 20;
float Block2Mass = 40;

float Block1Radius = 30;
float Block2Radius = 60;

float Distance = 0;

boolean Collision = false;

void setup()
{
  
  size(800,300);
  ellipseMode(RADIUS);
  
  Block1Pos = new PVector(width/4, height/2);
  Block1Vel = new PVector(3,0);
  
  Block2Pos = new PVector(width - width/4,height/2);
  Block2Vel = new PVector(-4,0);

}

void draw()
{

  background(100);
  
  // Changes the Axis to the conventional X-Y axis extending upwards and rightwards.
  scale(1,-1);
  translate(0,-height);
  
  // Calculate the Distance between the center of each block
  Distance = Block2Pos.x - Block1Pos.x;
  
  // Collision occurs when the distance between the two blocks is less than their respective sum of radii, meaning they are effectively inside each other.
  if( Distance < (Block1Radius + Block2Radius))
  {
   Collision = true; 
  }
  else
  {
    Collision = false;
  }
  
  // If collision is detected, then apply the Conservation of Momentum equations to find the resulting velocity of the objects after they collide
  if(Collision == true)
  {
    float PreCollisionBlock1Vel = Block1Vel.x;
    float PreCollisionBlock2Vel = Block2Vel.x;
    
   Block1Vel.x = ((Block1Mass-Block2Mass)/(Block1Mass+Block2Mass)) * PreCollisionBlock1Vel + (2*Block2Mass/(Block1Mass+Block2Mass)) * PreCollisionBlock2Vel;
   
   Block2Vel.x = ((Block2Mass-Block1Mass)/(Block1Mass+Block2Mass)) * PreCollisionBlock2Vel + (2*Block1Mass/(Block1Mass+Block2Mass)) * PreCollisionBlock1Vel;
  }
  
  // Collision with walls
  if (Block1Pos.x > width-Block1Radius) 
  {
      Block1Pos.x = width-Block1Radius;
      Block1Vel.x *= -0.95;
  } 
  else if (Block1Pos.x < Block1Radius) 
   {
      Block1Pos.x = Block1Radius;
      Block1Vel.x *= -0.95;
   }
    
  if (Block2Pos.x > width-Block2Radius) 
  {
      Block2Pos.x = width-Block2Radius;
      Block2Vel.x *= -0.95;
  } 
  else if (Block2Pos.x < Block2Radius) 
  {
      Block2Pos.x = Block2Radius;
      Block2Vel.x *= -0.95;
  }
  
  // Eulers Integration
  Block1Pos.add(Block1Vel);
  Block2Pos.add(Block2Vel);
  
  // Drawing both balls
  strokeWeight(3);
  fill(8,159,189);
  ellipse(Block1Pos.x,Block1Pos.y,Block1Radius,Block1Radius);
  fill(222,98,125);
  ellipse(Block2Pos.x,Block2Pos.y,Block2Radius,Block2Radius);
  
}
