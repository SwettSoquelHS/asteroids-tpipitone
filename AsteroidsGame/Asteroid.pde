class Asteroid extends Mover {

  int n = 20;
  float ran[] ={random(n),random(n),random(n),random(n),random(n)};
  
  Asteroid(float x, float y, float speed, float direction, float radius, float collision) {
    super(x, y, speed, direction, radius, collision);
  }
  

  
   

  void show() {

    pushMatrix();
    translate(x, y );
    rotate(radians(direction));
    fill(255);

    beginShape();
    fill(64, 67, 71);
    strokeWeight(4);
    stroke(58, 31, 9);

    
    vertex(0, 30 + ran[0] );
    vertex(30, 40 + ran[1] );
    vertex(60, 10 + ran[2]);
    vertex(40, -30 + ran[3]);
    vertex(-20, -20 + ran[4]);
    vertex(0, 30 + ran[0] );
    /*
    ellipseMode(RADIUS);
    ellipse(0,0,radius,radius);
    */
    endShape();
    popMatrix();
  }
  
  
  
  
  
}
