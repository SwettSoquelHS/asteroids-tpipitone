interface Movable {

  float getX();
  float getY();
  float getDirection();
  float getSpeed();
  float getRadius();
  float getColission();

  void setColission(float newColission);

  void setDirection(float newDirectionInDegrees);

  void setSpeed(float newSpeed);

  void update(); 

  void show();

  boolean collidingWith(Movable object);
}

abstract class Mover implements Movable {

  protected float x, y;
  protected float speed;
  protected float direction;
  protected int myColor;
  protected float radius;  
  protected float colission;

  Mover(float x, float y) {
    this(x, y, 0, 0, 0, 0);
  }

  Mover(float x, float y, float speed, float direction, float radius, float colission) {

    this.x = x;
    this.y = y;
    this.speed = speed;
    this.direction = direction;
    this.radius = radius;
    this.colission = colission;
    myColor = 225;
    radius = 0.0;
  }
  void mouseMovement() {

    if (ROTATE_LEFT)
      direction -= 4.5;
    if (ROTATE_RIGHT)
      direction += 4.5;
    if (MOVE_FORWARD) {
      if (speed < 3) {
        speed += 0.5;
      }
    } else {
      if (speed > 0) {
        speed -= 0.5;
      }
      if (speed < 0)
        speed = 0;
    }
  }



  void update() {

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

  abstract void show();

  boolean collidingWith(Movable m) {
    if (this == m) {
      return false;
    }
    float d = dist(x, y, m.getX(), m.getY());    
    if ((radius + m.getRadius()) >= d) {
      return true;
    }
    return false;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getDirection() {
    return direction;
  }

  float getRadius() {
    return radius;
  }

  float getSpeed() {
    return speed;
  }

  float getColission() {
    return colission;
  }

  void setColission(float newColission) {
    colission = newColission;
  }

  void setSpeed(float newSpeed) {
    speed = newSpeed;
  }

  void setDirection(float newDirectionInDegrees) {
    direction = newDirectionInDegrees;
  }

  //TODO: Part I: implement the methods of Moveable interface - delete this comment
}
