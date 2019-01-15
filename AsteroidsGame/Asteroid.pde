/** 
  Asteroid class
    Should extend Mover class and implement show.
    
    Initially, your asteroid may just be a simple circle or square
    but the final program should use "beginShap(), vertex(), and endShape()"
    to render the asteroid.
*/
class Asteroid {
  float x;
  float y;
  float quadX;
  float quadY;
  



  public Asteroid() {
    x = random(0,800);
    y = random(0,800);
    quadX = random(50);
    quadY = random(50);
  }



  void show() {

    pushMatrix();
    translate(x, y);
    fill(255);
    beginShape();
    vertex(0,30 + quadY);
    vertex(30,40 + quadX);
    vertex(60,10 + quadY);
    vertex(40, -30 + quadX);
    vertex(-20,-20 + quadY);
    endShape();
    popMatrix();
  }
}
