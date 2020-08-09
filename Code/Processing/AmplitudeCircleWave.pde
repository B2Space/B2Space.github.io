import processing.sound.*;        // library needed for sound processing

SoundFile song;                   // create a SoundFile object if you are using a local .mp3 file
Amplitude amp;                    // create an Amplitude object which allows for amplitude analysis functions.
float analyzed_val;               // variable to store the sampled amplitude
float mapped_val;                 // variable to store the remapped amplitude

FloatList volume_history;         // create a FloatList to store previous amplitude measurements for a smooth graph (basically an array)

PVector position;                 // variable to allow for polar transformation

void setup()
{
  song = new SoundFile(this, "sunflower.mp3");        // create new SoundFile object with second parameter being the local file's name.
  amp = new Amplitude(this);                          // create a new Amplitude object
  amp.input(song);                                    // feed the SoundFile object to the Amplitude object as input. Use AudioIn object if using Mic.
  
  size(800,800);          
  smooth();
  ellipseMode(RADIUS);
  
  position = new PVector(0,0);                
  volume_history = new FloatList();
  
  song.play();                  // Start playing the song once set-up is ready.
  
}


void draw()
{

  background(27,2,38);  
  analyzed_val = amp.analyze();                       // Calling this function samples the current amplitude of the song 
  mapped_val = map(analyzed_val, 0, 1, 50, 150);      // Remap the value to something that is visible on screen
  
  volume_history.append(mapped_val);                  // Add the remapped value to the end of the "array"
  
  translate(width/2,height/2);
  
  push();
  
  scale(2,2);                                        // Increase scale for visibility
  noFill();                                          // Don't fill, only outline
  stroke(67,150,180);                                // Outline colour
  strokeWeight(3);
  beginShape();                                      // Begin the line
  for(int i = 0; i < volume_history.size(); i ++)    // Keep adding vertices for every element in the array as that corresponds to an amplitude reading
  {
     position.x = volume_history.get(i) * sin(radians(i));    // Polar transformation
     position.y = volume_history.get(i) * cos(radians(i)) ;   // Polar transformation
     vertex(position.x,position.y);
     
  }
 endShape();                                          // Stop joining the dots
 pop();
 
 if(volume_history.size() > 360)                      // To prevent the program from drawing over itself, remove the 360th element because only 360 degrees in a cirle
 {
   volume_history.remove(0);
 }
  
   fill(129,41,245);                                  // Draw 2 concentric circles which grow/shrink in size depending on the amplitude reading
   strokeWeight(1);
   ellipse(0,0,mapped_val*0.8,mapped_val*0.8);
   fill(222,60,247);
   ellipse(0,0,mapped_val*0.4,mapped_val*0.4);
 

}
