

## Personal and University Projects
As a mechatronics engineering student, I aim to document my projects and learnings on this page along with my hobby of space engineering. Some of the projects on here are spin-off versions or harder versions of what I am given at University as coding projects (mainly in C or Python) but because I like visualising things, I try to create it in Processing which allows for drawing and actually visualising the motion of many systems that tend to be dynamic. Most of these projects are **simple** but just because I have next to no experience in Java and OOP, I try to learn as much as I can through these simple projects.

---

---

### Robot Kinematics
This project involves designing a 2DOF robotic arm which can move in 2D space. It can be operated either using Forward Kinematics - where desired angles are input and the positions are calculated. Or by Inverse Kinematics - where the desired positions are input and the joint angles are calculated. 

<details markdown="1">
  <summary>Expand to see the kinematics projects:</summary>
  <br>
  
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
</details>


---

---

### Collisions
This project involves experimenting with various objects to see how they interact with other objects when taking gravity, vectors, and mass into account during collision. The examples here are done without OOP because I am still new at programming, but the later, more complicated ones definitely should be done using OOP.

<details markdown="1">
  <summary>Expand to see the collision projects:</summary>
  <br>

  
  The first simple project is a **Vertically Bouncing Ball** which aims to use a ball under the influence of gravity and restitution to eventually come to rest upon consecutive contacts with the ground. Instead of actually programming *collision* because I am still unsure how to go about defining a specific set of points which constitute an object, so I made it bounce back up when it reached the position at which the ground was defined at instead.

  It's code can be located here: [Vertical Ball Bounce](./Code/Processing/VerticalBallBounce.pde)

  The simulation can be shown in the short GIF below:

  ![BallBounce](https://user-images.githubusercontent.com/68944131/89274676-97db9a00-d684-11ea-8c87-ac93709dfa3a.gif)

---

The next step up from the simple ball bouncing was the collision of two objects with differing masses. I had to use the conservation of momentum equations to ensure that this simulation stayed as close to 1D physics as possible as they are only experiencing co-linear collision. I also experimented with energy loss during the collision so it wasn't perfectly elastic, resulting in the balls losing velocity everytime they hit the wall or each other. The proof and formula for elastic collisions was studied and applied from [this](https://courses.lumenlearning.com/boundless-physics/chapter/collisions/) website.

The code for this project can be located here: [Linear Collision](./Code/Processing/LinearCollision.pde)

The simulation is shown in the short GIF below:

![LinearCollision](https://user-images.githubusercontent.com/68944131/89293360-2827d800-d6a1-11ea-93ad-c408c01239ef.gif)

---

The next step up from 1D collinear collision was 2D freespace collision. Instead of using complex trigonometry and momentum mechanics (I tried and it didnt work :( ), I just added the Y axis also being manipulated by the collision where in the Linear Collision project, only the X axis velocities were being impacted. This also meant that I had to add boundaries to the top and bottom of the screen for the balls to bounce off and lose velocity as restitution is only 95%. I also had to tweak the way that distance between the two ball's center was calculated, as now it has a Y component as well, Pythagoras Theorem does the trick in finding the minimum distance between the Ball Centers to detect a collision. I won't upload this new one as it is 90% the same as the previous Linear Collision version, instead I will list the major code changes and additions below.

Pythagoras for minimal distance calculation:
``` java
  DistanceX = Block2Pos.x - Block1Pos.x;
  DistanceY = Block2Pos.y - Block1Pos.y;
  
  distance = sqrt(DistanceX * DistanceX  + DistanceY* DistanceY);
```  
Y-Velocity being affected by collisions if there is a Y Component present as well:
```java
   Block1Vel.y = ((Block1Mass-Block2Mass)/(Block1Mass+Block2Mass)) * PreCollisionBlock1VelY + (2*Block2Mass/(Block1Mass+Block2Mass)) * PreCollisionBlock2VelY;
   Block2Vel.y = ((Block2Mass-Block1Mass)/(Block1Mass+Block2Mass)) * PreCollisionBlock2VelY+ (2*Block1Mass/(Block1Mass+Block2Mass)) * PreCollisionBlock1VelY;
```


 The simulation can be shown in the short GIF below:
 
 ![2DCollision](https://user-images.githubusercontent.com/68944131/89365855-e175c480-d718-11ea-888b-3d93c49524c6.gif)

</details>

 
 ---
 
 ---


### Visualizer
This project involves taking audio input from either the computer's microphone or a local mp3 soundfile and creating a music visualiser. This is more of a personal project because I'm interested in audio processing and animation.

<details markdown="1">
  <summary>Expand to see the visualizer projects</summary>
  <br>
  
  When analysing a sound file or audio input, it can be analysed relatively simply with amplitude analysis which quantifies the `volume` at a specific time determined by the sampling rate. In processing, there are inbuilt functions that do this and return a float value ranging from `0 - 1` where 0 is low volume and 1 is high volume. This value is not influenced by the output speaker volume controls and is purely derivative data from the input sound file.
  
  
  The first project is a simple audio visualiser made from analysing the amplitude of a song stored locally on my computer. It can be done through audio input via the headphone jack or microphone but since that would include noise from my keyboard and environment, I rather analyze a local file for the purposes of understanding how this process works in the first place.
  
  
  This simple visualiser uses the amplitude data collected per sample which happens to be the rate at which the `draw` loop is called per second. This amplitude is then used to control the radii of 2 circles as well as an amplitude waveform that has been wrapped around the circles using polar coordinates.
  
  Its code can be located here: [Amplitude Waveform Visualiser](./Code/Processing/AmplitudeCircleWave.pde).
 
  
  You can see how it looks in the short GIF below. Unfortunately GIFs don't support sound but it is playing [Sunflower by Post Malone and Swae Lee.](https://www.youtube.com/watch?v=ApXoWvfEYVU)
  
  ![AmplitudeWavePolar](https://user-images.githubusercontent.com/68944131/89728651-2fb8f980-da72-11ea-816b-b2286bc8d1eb.gif)

  
  The next project using this amplitde analysis took some time to understand and create because it was the first time that I worked with so many polygons, simultaneous events and 3D plotting. A very good reference that I used to create this project was from [The Coding Train](https://www.youtube.com/watch?v=IKB1hWWedMk). Following his general structure was easy to understand how to proceed with this project and shape it in a way that I thought would be cool. The inspiration for my project was [this video](https://www.youtube.com/watch?v=JYEJK9h5wdg). Plus I really like the theme of Synthwave and '80s retro music so this was more a personal project than anything.
  
  Overall this project experimented with 3D terrain generation, Perlin noise, polygon shaping, amplitude analysis of soundfiles and traversing through 3D planes.
  
  The code to this project is located here: [3D Amplitude Terrain](./Code/Processing/Amplitude3DSynthwave.pde).
  
  
  You can see how it looks in the short GIF below. This program was run using the song [Cosmic Sand - 9h00](https://www.youtube.com/watch?v=JYEJK9h5wdg) but sound cannot be played during the GIF unfortunately:
  
  ![SynthWaveAmplitude](./GIF/synthwave.gif)
  
  
  
  
  
  
  
  
  
  
</details>

