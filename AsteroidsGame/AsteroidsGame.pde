/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
import java.util.ArrayList;
ArrayList <Bullet> bullets;

int asteroidSize = 10;
int asteroidIndex = 0;
boolean resetArray = true; 


Star s1;
Star[] stars = new Star[1000];

Asteroid[] asteroids = new Asteroid [asteroidSize];



Spaceship player1;




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
  
  
  bullets = new ArrayList();
 // myBullet = new Bullet(100,100,0,0,50,0);

  //initialize starfield

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  s1 = new Star();



if(resetArray){
  for (int i = 0; i < asteroids.length; i++) {
    asteroids[asteroidIndex] = new Asteroid(0, 0, 1, (random(360)), 30, 0);
    asteroids[i] = new Asteroid(random(800), random(800), 1, (random(360)), 30, 0);
    
  }
  resetArray = false;
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



  for(int i = 0; i < bullets.size(); i++)
  {
    Bullet myBullet = bullets.get(i);
    myBullet.update();
    myBullet.show();
  }







  player1.show();
  player1.mouseMovement();
  player1.update();
  





  
} // end draw

  void mousePressed(){
    Bullet myBullet = new Bullet(100,100,0,0,50,0);
    myBullet.setStart(player1.getX(), player1.getY(), player1.getDirection());
    bullets.add(myBullet);
 
    System.out.print(bullets.size() + " ");
    }

void keyPressed() {
  if (keyPressed) {
    if (key == 'a') {
      ROTATE_LEFT = true;
    } else if ( key == 'd') {
      ROTATE_RIGHT = true;
    } else if (key == 'w') {
      MOVE_FORWARD = true;
      thrust = true;
    }
  }

  if (keyCode == 32) {  
    SPACE_BAR = true;
  }
}

void keyReleased() {  
  //if (keyPressed) { 
    if (key == 'a') {
      ROTATE_LEFT = false;
    } else if ( key == 'd') {
      ROTATE_RIGHT = false;
    } else if (key == 'w') {
      MOVE_FORWARD = false;
      thrust = false;
      boost = -75;
    }

  if (keyCode == 32) {
    SPACE_BAR = false;

  }
}


void checkOnAsteroids() {
  for(int i = 0; i < asteroids.length; i++){
    Asteroid a1 = asteroids[i];
    
    for(int j = 0; j < bullets.size(); j ++){
      Bullet b1 = bullets.get(j);
      
      if(b1.collidingWith(a1) ){
        System.out.print(" COLLISSION ");
        bullets.remove(j);
        asteroidSize += 3;
        asteroidIndex = j;
        resetArray = true; 
        
      }
    }
  }
  
  
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
