/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */

Star s1;
Star[] stars = new Star[1000];

Asteroid[] asteroids = new Asteroid [7];

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
int flip = 1;
int flip_2 = 300;

/* * * * * * * * * * * * * * * * * * * * * * *
 Initialize all of your variables and game state here */
public void setup() {
  size(800, 800);
  background(40);

  //initialize your asteroid array and fill it


  //initialize ship
  player1 = new Spaceship(width / 2, height / 2, 0, 0);


  //initialize starfield

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  s1 = new Star();




  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i] = new Asteroid(random(800), random(800), 1, flip * (random(360)));
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





  player1.show();
  player1.mouseMovement();
  player1.update();
  //Draw Starfield first 


  //TODO: Part I

  //Check bullet collisions
  //TODO: Part III or IV - for not just leave this comment

  //TODO: Part II, Update each of the Asteroids internals

  //Check for asteroid collisions against other asteroids and alter course
  //TODO: Part III, for now keep this comment in place

  //Draw asteroids
  //TODO: Part II

  //Update spaceship
  //TODO: Part I

  //Check for ship collision agaist asteroids
  //TODO: Part II or III

  //Draw spaceship & and its bullets
  //TODO: Part I, for now just render ship
  //TODO: Part IV - we will use a new feature in Java called an ArrayList, 
  //so for now we'll just leave this comment and come back to it in a bit. 

  //Update score
  //TODO: Keep track of a score and output the score at the top right
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
      if (a1 != a2 && a1.collidingWith(a2)) {
        flip = flip * -1;
        
      }
    }
  }
}
