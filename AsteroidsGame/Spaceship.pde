/*
  Spaceship class
 Should extend Mover class and implement show.
 You may add additional methods to this class, for example "rotate" and "accelerate" 
 might be useful.
 */


class Spaceship extends Mover {



  void show() {
    pushMatrix();
    ellipseMode(CENTER);
    translate(x, y);
    rotate(radians(direction));
    rotate(radians(270));
    scale(0.5);
    beginShape();

    stroke(0);
    strokeWeight(2);
    fill(255);
    line(0, 0, 0, 80); //line points on top
    line(-40, 0, -40, 60);
    line(40, 0, 40, 60);

    fill(47, 79, 79);
    triangle(-20, 0, 20, 0, 0, 75); //triangle gun

    if ( thrust ) { //thruster
      fill(178, 34, 34);
      boost = boost - 1;
      if (boost < -100) {
        boost = -100;
      }
      triangle(-10, -45, 10, -45, 0, boost);
    }


    fill(105, 105, 105);
    rect(0, -40, 10, 20); //thruster
    rect(-10, -40, 10, 20);

    fill(153, 0, 76);
    ellipse(0, 80, 10, 10); //top nodes
    ellipse(-40, 60, 10, 10);
    ellipse(40, 60, 10, 10);
    strokeWeight(2);

    fill(34, 139, 34);
    arc(0, 0, 70, 50, radians(0), radians(180), OPEN); //main ship
    fill(47, 79, 79);
    ellipse(0, 5, 100, 20);
    arc(0, 0, 50, 50, radians(-185), radians(5), OPEN);
    popMatrix();


  }



  Spaceship(float x, float y, float speed, float direction, float radius, float colission) {
    super(x, y, speed, direction, radius, colission);
  }


}
