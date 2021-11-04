class Projectile extends GameObject {

  int fc;
  int duration;

  Projectile(PVector aim, color f, int s) {
    hp = 1;
    loc = new PVector(p1.loc.x, p1.loc.y);
    vel = aim;
    vel.add(p1.vel);
    fc = f;
    size = s;
    duration=180;
  }

  void show() {
    stroke(255);
    fill(fc);
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    loc.add(vel);
    
    if (mode == GAME) {
      super.act();
      duration--;
      if (duration == 0) {
        hp = 0;
      }

      //wall collision
      if (loc.x >= width*0.9) {
        hp = 0;
      }
      if (loc.x <= width*0.1) {
        hp = 0;
      }
      if (loc.y >=height*0.9) {
        hp = 0;
      }
      if (loc.y <= height*0.1) {
        hp = 0;
      }
      
      //room switch
    }
  }
}
