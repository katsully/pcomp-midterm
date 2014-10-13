class Particle {
  PVector loc;
  PVector sloc; //The starting location. For the lines.
  PVector vel;
  PVector acc;
  color c;
  boolean dead = false;
 
  Particle(PVector loc, PVector acc, color c) {
    this.loc = loc;
    this.sloc = loc;
    this.acc = acc;
    this.c = c;
    vel = new PVector(0, 0);
  }
 
  void drawParticle() {
    /* Variable s takes the distance between itself and its starting location. Then makes that value between 1 and 60. */
    float s = map(dist(sloc.x, sloc.y, loc.x, loc.y), 0, width/2, 1, 60);
    stroke(c, 250-s*6);
    fill(c, 250-s*6);
    ellipse(loc.x, loc.y, s, s);
    /* The second x and y locations look familiar. */
    line(loc.x, loc.y, loc.x-(loc.x-sloc.x)/2, loc.y-(loc.y-sloc.y)/2);
 
    /*
     We use the same formular for the transperency of the particles so that when its completely gone we can delete it.
      
     NOTICE: We multiply by 4 instead of 6 because when deleting a FireWork, it flashes right before it is deleted. So
     by multiplying it by 4 the value will get to 0 slower and makeing the FireWork still be alive for a little longer
     but fixes the problem.
     */
    if (250-s*4 <= 0) {
      dead = true;
    }
  }
 
  void move() {
    vel.add(acc);
    loc.add(vel);
    /* Vel gets to fast so we divide by 6 to make it slower. */
    vel.div(24);
  }
}
