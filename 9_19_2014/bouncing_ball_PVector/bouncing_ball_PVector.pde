//bouncing balls with PVector!

//declared our variables globally

PVector position;

float radius;

PVector velocity;

color forceFieldColor;

void setup() {
  size(1000, 1000);

  //intialize our variable in the setup
  //start the ball in the center of the screen
  position = new PVector( width/2, height/2 );
  
  //set the ball radius so we can check against the edges of the screen later
  radius = 100;
  
  //choose a random velocity, which moves the ball in a random direction
  velocity = new PVector( random( -10, 10 ), random( -10, 10 ) );

  //choose a random forcefield color
  forceFieldColor = color( random(255), random(255), random(255), 50 );


  println( "Velocity X: "+velX+" Velocity Y: "+velY );
}

void draw() {
  background(255);
  //move the position by a constant velocity every frame
  position.add( velocity );

  //check if the ball has gone off the screen in the x direction
  if ( position.x > width - radius || position.x < radius ) {
    
    //if so, reverse the velocity in the x direction
    velocity.x *= -1;
   forceFieldColor = color( 255, 0, 0, 50 );
  }
  //check if the ball has gone off the screen in the y direction
  if ( position.y > height - radius || position.y < radius ) {
    
    //if so, reverse the velocity in the y direction
    velocity.y *= -1;
    forceFieldColor = color( 255, 0, 0, 50 );
    
  }

  //draw the ellipse
  fill(forceFieldColor);
  ellipse(position.x, position.y, radius*2, radius*2);
  fill(127);
  ellipse( position.x, position.y, radius/2, radius/2 );
  forceFieldColor = color( 255, 255, 255, 255 );
}

