class FireWork {
  /* We store each particle in an arraylist */
  ArrayList fw = new ArrayList();
  PVector loc;
  boolean dead = false;
 
  FireWork(PVector loc) {
    this.loc = loc;
    /* You can change each individual particle's color by puting the below line in the for loop. */
    color c = color(random(100, 255), 0, random(100, 255));
    for (int i = 0; i < 360; i+=6) {
      /* Makes the particle's go in a cirlce */
      float x = sin(radians(i))*4;
      float y = cos(radians(i))*4;
      /*
      Acceleration is, for every frame, how much we move the particle on the x and y axis. We want it to be a low number
       because imagine what would happen if in every frame we move the particle 50 pixels. Not so visually appealing.
       So we first get its location on the axis so x or y. Then we minus itself with its new location which is our variables
       x and y. So its position - (position - new Position). Its difficult to understand at first.
       */
      PVector acc = new PVector(loc.x-(loc.x+x), loc.y-(loc.y+y));
 
      fw.add(new Particle(new PVector(loc.x+x, loc.y+y), acc, c));
    }
  }
 
  void draw() {
    /*
     Draw each particle and check if they are dead. When 1 particle is dead we make the FireWork dead. Which then deletes the
     entire FireWork. This saves us deleting the particles first then the FireWork.  
     */
    for (int i = 0; i < fw.size (); i++) {
      Particle p = (Particle) fw.get(i);
      p.drawParticle();
      p.move();
      if (p.dead) {
        dead = true;
      }
    }
  }
}
