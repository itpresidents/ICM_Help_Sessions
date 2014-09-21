//bouncing balls yo!

//declared our variables globally
float posX;
float posY;

float radius;

float velX;
float velY;

color forceFieldColor;

void setup() {
  size(1000, 1000);

  //intialize our variable in the setup
  //start the ball in the center of the screen
  posX = width / 2;
  posY = height / 2;
  
  //set the ball radius so we can check against the edges of the screen later
  radius = 100;
  
  //choose a random velocity, which moves the ball in a random direction
  velX = random(-10, 10);
  velY = random(-10, 10);
  
  //choose a random forcefield color
  forceFieldColor = color( random(255), random(255), random(255), 50 );

  
  println( "Velocity X: "+velX+" Velocity Y: "+velY );
}

void draw() {
  background(255);
  //move the position by a constant velocity every frame
  posX += velX;
  posY += velY;

  //check if the ball has gone off the screen in the x direction
  if ( posX > width - radius || posX < radius ) {
    
    //if so, reverse the velocity in the x direction
    velX *= -1;
   forceFieldColor = color( 255, 0, 0, 50 );
  }
  //check if the ball has gone off the screen in the y direction
  if ( posY > height - radius || posY < radius ) {
    
    //if so, reverse the velocity in the y direction
    velY *= -1;
    forceFieldColor = color( 255, 0, 0, 50 );
    
  }

  //draw the ellipse
  fill(forceFieldColor);
  ellipse(posX, posY, radius*2, radius*2);
  fill(127);
  ellipse( posX, posY, radius/2, radius/2 );
  forceFieldColor = color( 255, 255, 255, 255 );
}

