import java.util.ArrayList;

ArrayList <Bullet> bullets;
ArrayList<Asteroid> asteroids;


int asteroidIndex = 0;



Star s1;
Star[] stars = new Star[1000];





Spaceship player1;

int level = 1;
int score = 0; 
int health = 100;
float  asteroidSpeed = 1;


boolean ROTATE_LEFT;  //User is pressing <-
boolean ROTATE_RIGHT; //User is pressing ->
boolean MOVE_FORWARD; //User is pressing ^ arrow
boolean SPACE_BAR;    //User is pressing space bar
boolean thrust;
int boost;


public void setup() {
  size(800, 800);
  background(40);

  player1 = new Spaceship(750, 750, 0, 200, 50, 0);


  bullets = new ArrayList();

  asteroids = new ArrayList<Asteroid>(10);



  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  s1 = new Star();


  for (int i = 0; i < 10; i++) {
    Asteroid myAsteroid = new Asteroid(random(700), random(700), 1, (random(360)), 30, 0);
    asteroids.add(myAsteroid);
  }
}

public void draw() {
  if (health > 0 ) {

    background(0);
    textSize(30);
    fill(0, 102, 153);
    text("SCORE: " + score, 10, 60);

    text("HEALTH: " + health, 10, 100);
    text("ROUND " + level, 10, 140);

    for (int i = 0; i < stars.length; i++) {
      stars[i].show();
    }
    s1.show();

    if (score % 10 == 0 && score != 0 ) {
      score ++;
  
      for (int i = 0; i <  10; i++) {
        Asteroid newAsteroids = new Asteroid(player1.getX() + random(700), player1.getY() + random(700), asteroidSpeed , (random(360)), 30, 0);
        asteroids.add(newAsteroids);
      }
      level++;
      health+=10;
      asteroidSpeed = asteroidSpeed * 1.25;
    }



    for (int i = 0; i < asteroids.size(); i++) {
      asteroids.get(i).show();
      asteroids.get(i).update();
    }



    checkOnAsteroids();



    for (int i = 0; i < bullets.size(); i++)
    {
      Bullet myBullet = bullets.get(i);
      myBullet.update();
      myBullet.show();
    }

    player1.show();
    player1.mouseMovement();
    player1.update();
  } else {
    fill(255, 0, 0);
    text("YOU DIED ", 350, width / 2);
    text("SCORE  " + score, 350, width / 2 + 100);
  }
} 

void mousePressed() {
  Bullet myBullet = new Bullet(100, 100, 0, 0, 50, 0);
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

  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid a1 = asteroids.get(i);
    for (int j = i + 1; j < asteroids.size(); j++) {

      Asteroid a2 = asteroids.get(i);
      if (a1 != a2 && a1.collidingWith(a2) ) {
        System.out.println("COLLISSION");
        a1.setDirection(a1.getDirection() + 90);
        a1.setSpeed((a1.getSpeed()*.99 ));
      }
    }
  }

  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid a1 = asteroids.get(i);
    for (int j = 0; j < bullets.size(); j ++) {
      Bullet b1 = bullets.get(j);
      if (b1.collidingWith(a1) ) {
        bullets.remove(j);
        asteroids.remove(i);
        score++;
      }
    }
  }

  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid a1 = asteroids.get(i);
    if (player1.collidingWith(a1)) {
      health-=10;
      a1.setDirection(player1.getDirection());
      a1.setSpeed((player1.getSpeed()*1.5 ));
    }
  }
}
