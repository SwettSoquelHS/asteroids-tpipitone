/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */

Star s1;
Star[] stars = new Star[1000];

Asteroid[] asteroids = new Asteroid [10];

//Bullet bullet;
Spaceship player1;
//Asteroid[] asteroids;



/*
  Track User keyboard input
 */
boolean ROTATE_LEFT;  //User is pressing <-
boolean ROTATE_RIGHT; //User is pressing ->
boolean MOVE_FORWARD; //User is pressing ^ arrow
boolean SPACE_BAR;    //User is pressing space bar
boolean thrust;
int boost;


/* * * * * * * * * * * * * * * * * * * * * * *
 Initialize all of your variables and game state here */
public void setup() {
  size(800, 800);
  background(40);

  //initialize your asteroid array and fill it


  //initialize ship
  player1 = new Spaceship(width / 2, height / 2, 0, 0, 50, 0);
 // bullet = new Bullet(width / 2, height / 2, 0, 0, 50 , 0);

  //initialize starfield

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  s1 = new Star();




  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i] = new Asteroid(random(800), random(800), 1, (random(360)), 30, 0);
  }
}


/* * * * * * * * * * * * * * * * * * * * * * *
 Drawing work here
 */
public void draw() {
  //your code here
  background(0);


  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  s1.show();



  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i].show();
    asteroids[i].update();
  }
  checkOnAsteroids();







  player1.show();
  player1.mouseMovement();
  player1.update();

  //myBullet.show();
  //myBullet.update();
}



/* * * * * * * * * * * * * * * * * * * * * * *
 Record relevent key presses for our game
 */
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      ROTATE_LEFT = true;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = true;
    } else if (keyCode == UP) {
      MOVE_FORWARD = true;
      thrust = true;
    }
  }

  //32 is spacebar
  if (keyCode == 32) {  
    SPACE_BAR = true;
    player1.fire();
    //myBullet.shoot();
  }
}



/* * * * * * * * * * * * * * * * * * * * * * *
 Record relevant key releases for our game.
 */
void keyReleased() {  
  if (key == CODED) { 
    if (keyCode == LEFT) {
      ROTATE_LEFT = false;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = false;
    } else if (keyCode == UP) {
      MOVE_FORWARD = false;
      thrust = false;
      boost = -75;
    }
  }
  if (keyCode == 32) {
    SPACE_BAR = false;
  }
}


void checkOnAsteroids() {
  for (int i = 0; i < asteroids.length; i++) {
    Asteroid a1 = asteroids[i];

    for (int j = 0; j < asteroids.length; j++) {
      Asteroid a2 = asteroids[j];

      if (a1 != a2 && a1.collidingWith(a2) ) {
        a1.setDirection(a1.getDirection() + 90);


        a1.setSpeed((a1.getSpeed()*.99 ));
      }
    }
  }
}
