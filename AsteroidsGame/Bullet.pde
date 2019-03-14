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

    }
    
  }

  void setStart(float startX, float startY, float startDirection) {
      x = startX;
      y = startY;
      direction = startDirection;
      firing = true;
  }


  void show() {
    pushMatrix();
    translate(x, y );
    rotate(direction);
    strokeWeight(.5);
    fill(255,0,0);
    ellipse(0, 0, 5, 5);
    popMatrix();
  }
}
