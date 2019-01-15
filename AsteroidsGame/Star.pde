//note that this class does NOT *NEED* to extend Mover but can if you like
class Star {
  float x;
  float y;



  public Star() {
    x = random(-800, 800);
    y = random(-800, 800);
  }



  void show() {

    pushMatrix();
    translate(x+=.25, y+=.25);
    if (y > 800) {
      y = -800;
    } else if (x > 800) {
      x = -800;
    }


    fill(255);

    noStroke();
    ellipse(0, 0, random(2), random(2));
    popMatrix();
  }
}
