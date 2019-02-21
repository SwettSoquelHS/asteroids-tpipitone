/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 All objects in this world that move must implemnt the Movalbe interface.
 */
interface Movable {
  /*
    Return the x location of the Movable
   */
  float getX();



  /*
    Return the y location of the Movable
   */
  float getY();

  /*
    Return the direction of the Movable in degrees.
   */
  float getDirection();

  /*
   Return the speed of the Movable.
   The speed you use is a relative value and will
   feel different for different frame rates. For example,
   if frameRate is set to 48, then a speed of 1 would move 48 pixels 
   per second.
   */
  float getSpeed();

  /*
   Return the radius of influence. If you could draw a circle
   around your object, then what would this radius be.
   */
  float getRadius();
  
  float getColission();
  
  void setColission(float newColission);

  /* 
   Sets the direction of the Movable
   */
  void setDirection(float newDirectionInDegrees);

  /* 
   Sets the speed of the Movable
   */
  void setSpeed(float newSpeed);

  /*
   Update the internals of the instance
   */
  void update(); 

  /*
    Display the isntance
   */
  void show();

  /*
   Return true if the instance of Movable is "colliding with" 
   the movable referred to by object.  *Note* An object should not
   be able to collide with iteself.
   */
  boolean collidingWith(Movable object);
 
//END OF Movable Interface


}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 Abstract base class Mover 
 */
abstract class Mover implements Movable {

  protected float x, y;
  protected float speed;
  protected float direction;
  protected int myColor;
  protected float radius;  
  protected float colission;

  /*
    Default Mover, not actually moving and directionless
   */
  Mover(float x, float y) {
    //The line below shows how we can 
    //link this constructor to the constructor below through "this"
    this(x, y, 0, 0,0,0);
  }

  /*
    Mover constructor specifying x, y position along with its speed and
   direction (in degrees)
   */
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

  /*
    Most of your movalbe objects should follow this pattern.
   
   */


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
    //todo: You need to decide what to do when X is less than 0 or greater than width
    //todo: You need to decide what to do when Y is less than 0 or greater than height
  }



  /*
    Save this for your subclasses to override.
   but notice how it is tagged with abstract, meaning 
   it is incomplete. (It's like an I.O.U.)
   */
  abstract void show();


  /*
    TODO: Part 4: Implement collision detection
   */
  boolean collidingWith(Movable m) {
    //Can't collide with yourself
    if (this == m) {
      return false;
    }
    
    //How far away are OUR centers
    float d = dist(x, y, m.getX(), m.getY());    
    
    //If both of our radi added are greater than or equal to d, then we have collided
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
  
  float getColission(){
    return colission;
  }
  
  void setColission(float newColission){
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
