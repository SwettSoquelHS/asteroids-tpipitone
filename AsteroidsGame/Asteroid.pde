/** 
 Asteroid class
 Should extend Mover class and implement show.
 
 Initially, your asteroid may just be a simple circle or square
 but the final program should use "beginShap(), vertex(), and endShape()"
 to render the asteroid.
 */

  

  
class Asteroid extends Mover {

  int n = 50;
  float ran[] ={random(n),random(n),random(n),random(n),random(n)};
  
  Asteroid(float x, float y, float speed, float direction) {
    super(x, y, speed, direction);
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

    
    vertex(0, 30 + ran[0]);
    vertex(30, 40 + ran[1]);
    vertex(60, 10 + ran[2]);
    vertex(40, -30 + ran[3]);
    vertex(-20, -20 + ran[4]);
    vertex(0, 30 + ran[0]);
    endShape();
    popMatrix();
  }
  
  
  
  
  
}
