class Bullet  extends Spaceship {
  

  boolean fire = false;
  float maxSpeed;;
  boolean firing;

  Bullet(float x, float y, float speed, float direction, float radius, float colission) {
   super(x, y, speed, direction, radius, colission);
   maxSpeed = 15;
   firing = false;
  }



  void update() {
    if (firing){
      if (speed < maxSpeed) {
        speed +=2;
      }
      
      
      x = x + speed*(float)Math.cos(radians(direction));
      y = y + speed*(float)Math.sin(radians(direction));
  
  
      if (x > 850) {
        x = -50;
      } else if (x < -50) {
        x = 850;
      }
  
      if (y > 850) {
        y = -50;
      } else if (y < -50) {
        y = 850;
      }
      
      
    }
  }

  void setStart(float startX, float startY, float startDirection) {
    //if (!firing){
      x = startX;
      y = startY;
      direction = startDirection;
      firing = true;
  //  } 
  }


  void show() {

    translate(x, y );
    rotate(direction);
    pushMatrix();
    fill(255);
    ellipse(0, 0, 5, 5);
    popMatrix();
  }
}
