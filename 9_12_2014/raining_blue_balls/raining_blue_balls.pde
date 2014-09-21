//how many blue balls do i want
int numBoxes = 100;

//containers for all the x, y and speed 
//these variables are not floats, they each
//represent large sets of floats

float x[] = new float[numBoxes];
float y[] = new float[numBoxes];
float speeds[] = new float[numBoxes];

//setup everything
void setup() {
  //set the size of the screen
  size(1000, 1000, P2D);

  //fill the containers with all their numbers
  for (int i = 0; i < numBoxes; i++) {
    //set x,y and speed randomly looping once for each box
    x[i] = random(width);
    y[i] = random(height);
    speeds[i] = random(1, 5);
  }
  //lets not draw strokes around our circles
  noStroke();
}

void draw() {
  //clear the background ever frame to white
  background(255);

  //use another for loop to draw all the circles at their positions
  for ( int i = 0; i < numBoxes; i++) {
    //draw them all blue
    fill(0, 0, 255);
    //draw a circle using the x and y arrays using the loop incrementor i as the index
    ellipse( x[i], y[i], 10, 10 );

    //check if the y has gone off the bottom of screen
    if ( y[i] > height ) {
      //if it has, set y[i] back to 0  and get a new random vale for x[i] and a new speed
      y[i] = 0;
      x[i] = random(width);
      speeds[i] = random(1, 5);
    } else {
      //we are still on the screen so lets incriment the y[i] by its related speed, speeds[i]
      y[i]+=speeds[i];
    }
  }
}

