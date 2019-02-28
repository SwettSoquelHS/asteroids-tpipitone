class Bullet extends Spaceship {
  private int live = 100;
  boolean fire = false;
  Bullet(float x, float y, float speed, float direction, float radius, float collision) {
    super(x, y, speed, direction, radius,  collision);
  }
  
  
  /*
  void update(){
    x = x ++;
    y = y ++;
   // live--;
  }
  */
  boolean isAlive(){
    if(live > 0){
     
      return true;
      
    } else {
      return false;
    }
    
   // return false;
  
  }
  
  void shoot(){
    fire = true;
  }


  void show() {

      translate(x, y);
    
    pushMatrix();
    fill(255);
    ellipse(0, 0, 5, 5);

    popMatrix();
    
   
  }


}
