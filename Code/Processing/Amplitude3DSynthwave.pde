import processing.sound.*;    // Sound library
SoundFile song;               // Initialise soundFile object
Amplitude amp;                // Initialise amplitude object
float analyzed_amp;           // create value to store analyzed amplitude
float amp_height;             // create value to store remapped amplitude

int rows,cols;                // create value for rows and columns of the grid mesh
int scale;                    // create value to determine size of each grid in the mesh

float[][] gridPoints;         // create matrix to hold coordinates x and y for each vertex in the mesh.

int w = 2400;                 // create variables which determine the width and height of the mesh
int h = 2400;

float angle = 86;             // create variable to determine the angle of viewing

float traverse = 0;           // create variable to determine the speed of moving through the mesh

PImage sun;                   // create image object for the cool retro sun in the background.

void setup()
{
  song = new SoundFile(this, "Cosmic.mp3");         // initialise soundfile
  amp = new Amplitude(this);                        // initialise amplitude
  amp.input(song);                                  // feed the soundfile as input to the amplitude object
    
  size(1200,1000,P3D);                              // create a 3D plane window.
  smooth();
  
  scale = 40;                                       // Divide up the grid accordingly 
  cols = w / scale;
  rows = h /scale;
  
  gridPoints = new float[cols][rows];               // Fix the grid size

   sun = loadImage("sun.png");                      // Load the image 
   imageMode(CENTER);
  
   song.play();                                     // start playing the song once setup of other things are over
  
}


void draw()
{
  
  analyzed_amp =  amp.analyze();                  // get the current amplitude of the song at that sample time
  amp_height = map(analyzed_amp,0,1,0,300);       // remap the value between 0-1 to between 0 - 300
   
  traverse -= 0.07;                               // set the speed of travelling through the grid (or grid moving away from you)
  
  float yOffset = traverse;                       // yOffset is the perlin noise parameter in the y axis
  
  for(int y = 0; y < rows; y++)
  {
    float xOffset = 0;                            // xOffset is the perlin noise parameter in the x axis
    for(int x = 0; x < cols; x++)
    {
      if(x < 37 && x > 23 )                       // create a zone in the middle which is purely determined by perlin noise
      { 
        gridPoints[x][y] = map(noise(xOffset,yOffset),0,1, -40,40);  

      }
      else                                       // have the external mountain walls be either randomly generated, purely perlin noise, hybrid of perlin noise and amplitude or just amplitude
      {                     
        //gridPoints[x][y] = map(noise(xOffset,yOffset),0,1, 0,50) + amp_height;
       // gridPoints[x][y] = random(0,50);
       gridPoints[x][y] = amp_height;
      }
      xOffset += 0.2;                            // Increment the x parameter. The smaller it is, the less noticible steepness
    } 
    yOffset += 0.2;                              // Incremenet y parameter. The smaller it is, the less noticible altitude change
  }
  
  
  background(27,2,38);    
  
  push();                                       // Place the image of the sun which is a 2D object in a 3D environment, tricking our eyes.
  translate(width/2,height/2-350,-1000);
  scale(0.8,0.8);
  image(sun,0,0);
  pop();

  translate(width/2,height/2);                  // rotate the whole gridmap to the correct position that hides half the sun, and does not show the bottom of the terrain map
  rotateX(radians(angle));
  translate(-w/2,-h/2);
  
 for (int y = 0; y < rows-1; y++)               // Draw the polygon lines, split as triangles instead of squares 
  {
    stroke(67,150,180);
    strokeWeight(3.5);
    fill(129,41,245);
    beginShape(TRIANGLE_STRIP);
    
     for (int x = 0; x < cols; x++)
    {
      vertex(x * scale, y * scale, gridPoints[x][y]);
      vertex(x * scale,  (y + 1) * scale, gridPoints[x][y+1]);
    }
    
    endShape();
  }
  
}
