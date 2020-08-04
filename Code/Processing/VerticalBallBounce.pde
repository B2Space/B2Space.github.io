
PVector g;
PVector BallPosition;
PVector BallVelocity;
PVector BallAcceleration;
float m = 5;
float BallRadius = 20;
boolean HittingGround;

void setup()
{
  size(800,800);
  ellipseMode(RADIUS);
  
  g = new PVector(0,-1);
  BallPosition = new PVector(400,400);
  BallVelocity = new PVector(0,0);
  BallAcceleration = new PVector(0,0);
  
  BallAcceleration.add(g);
  
}


void draw()
{
  background(100);
  
  scale(1,-1);
  translate(0,-height);
  
  BallVelocity.add(BallAcceleration);
  BallPosition.add(BallVelocity);
  
  
  if( (BallPosition.y) <= 45)
  {
    HittingGround = true;
  }
  else
  {
    HittingGround = false;
  }
  
  if(HittingGround == true)
  {
    BallVelocity.mult(-1);
    BallVelocity.mult(0.82); 
    BallPosition.y = 0 + 45;
  }
  
  fill(43,189,184);
  strokeWeight(1);
  ellipse(BallPosition.x,BallPosition.y,BallRadius,BallRadius);
  
  fill(130,92,3);
  strokeWeight(1);
  rect(0,-25,width,50);

}
