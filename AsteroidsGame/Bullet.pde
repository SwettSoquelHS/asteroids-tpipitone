class Bullet extends Spaceship {
  private int live = 100;
  
  Bullet(float x, float y, float speed, float direction, float radius, float collision) {
    super(x, y, speed, direction, radius,  collision);
  }
  
  void update(){
    x = x + speed*(float)Math.cos(radians(direction));
    y = y + speed*(float)Math.sin(radians(direction));
   // live--;
  }
  
  boolean isAlive(){
    if(live > 0){
      live--;
      return true;
      
    } else {
      return false;
    }
    
   // return false;
  
  }


  void show() {
    translate(x, y);
    pushMatrix();
    fill(255);
    ellipse(0, 0, 5, 5);

    popMatrix();
    
   
  }


}
