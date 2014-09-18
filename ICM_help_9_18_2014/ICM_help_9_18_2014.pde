float ballX;
float ballY;
float ballRadius = 20;

float xSpeed = 3;
float ySpeed = random(3);

float paddleOneX;
float paddleTwoX;

float paddleHeight = 50;
float paddleWidth = 10;

void setup() {
  size(400,400);
  ballX = width/2;
  ballY = height/2;
  
  paddleOneX = 20;
  paddleTwoX = width-20;
  
  rectMode(CENTER);
}

void draw() {
  background(0);
  
  // draw the 2 paddles with the MouseY for both
  rect(paddleOneX,mouseY,paddleWidth,paddleHeight);
  rect(paddleTwoX,mouseY,paddleWidth,paddleHeight);
  
  // draw the ball
  ellipse(ballX,ballY,ballRadius*2,ballRadius*2);
  
  // take a step
  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;
  
  // test the X axis
  if(ballX+ballRadius>paddleTwoX-paddleWidth/2){
    if(ballY>mouseY-paddleHeight/2 && ballY<mouseY+paddleHeight/2){
      xSpeed = xSpeed * -1;
      ballX = (paddleTwoX-paddleWidth/2)-ballRadius;
    }
  }
  
  if(ballX-ballRadius<paddleOneX+paddleWidth/2){
    if(ballY>(height-mouseY)-paddleHeight/2 && ballY<(height-mouseY)+paddleHeight/2){
      xSpeed = xSpeed * -1;
      ballX = (paddleOneX+paddleWidth/2)+ballRadius;
    }
  }
  
  // test the Y axis
  if(ballY+ballRadius>height || ballY-ballRadius<0){
    ySpeed = ySpeed * -1;
  }
  
  if(ballX<paddleOneX || ballX>paddleTwoX){
    ballX = width/2;
    ballY = height/2;
    ySpeed = random(3);
  }
}

