Planet mercury;
Planet venus;
Planet earth;
Planet mars;
Planet jupiter;
Planet saturn;
Planet uranus;
Planet neptune;

float sunRadius = 75;
float earthMass = 30;

void setup()
{
  size(1500,1100);
  
  // ORBIT RADIUS, MASS ,  ORBIT SPEED, COLOUR
  
  mercury = new Planet(sunRadius + 50, earthMass * 0.5, 4.79, "r");
  venus = new Planet(sunRadius + 100, earthMass * 0.9, 3.50, "o");
  earth = new Planet(sunRadius + 150, earthMass, 2.98, "b");
  mars = new Planet(sunRadius + 200, earthMass * 0.7, 2.41, "r");
  jupiter = new Planet(sunRadius + 275, earthMass * 2, 1.31, "o");
  saturn = new Planet(sunRadius + 350, earthMass * 1.5, 0.96, "o");
  uranus = new Planet(sunRadius + 450, earthMass * 1.3, 0.68, "db");
  neptune = new Planet(sunRadius + 550, earthMass * 1.3, 0.54, "db");
}


void draw()
{
  background(100);
  translate(width/2,height/2);
  createSun();

  mercury.display();
  mercury.move();
  
  venus.display();
  venus.move();
  
  earth.display();
  earth.move();
  
  mars.display();
  mars.move();


  jupiter.display();
  jupiter.move();
  
  saturn.display();
  saturn.move();
  
  uranus.display();
  uranus.move();
  
  neptune.display();
  neptune.move();
  
}


void createSun()
{
  ellipseMode(RADIUS);
  fill(245,242,100);
  ellipse(0,0, sunRadius,sunRadius);
  
}


class Planet
{
  
  PVector position;
  float Orbitradius;
  float mass;
  float angle;
  float OrbitalSpeed;
  float PlanetRadius;
  String colour;
  
  
  Planet(float tempRad, float tempMass, float tempSpeed, String colorTemp)
  {  
 
     Orbitradius = tempRad;
     mass = tempMass;
     OrbitalSpeed = tempSpeed;
     colour = colorTemp;
     position = new PVector(Orbitradius,0);
     
     angle = 0;
     
     PlanetRadius = 0.5 * mass;
    
  }
  
  void display()
  {
    ellipseMode(RADIUS);
    stroke(3);
    
    if(colour == "r")
    {
       fill(196,61,43);
    }
    else if(colour == "b")
    {
      fill(66,135,245);
    }
    else if(colour == "o")
    {
      fill(191,108,6);
    }
    else 
    {
      fill(15,6,191);
    }
   
    ellipse(position.x,position.y, PlanetRadius,PlanetRadius);
  }
  
  void move()
  {
    
    angle += OrbitalSpeed/Orbitradius;
    position.x = Orbitradius * sin(angle);
    position.y = Orbitradius * cos(angle);
    
  }

}

