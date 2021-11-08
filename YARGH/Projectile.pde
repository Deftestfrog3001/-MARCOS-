class Projectile extends GameObject {

  int fc;
  int duration;

  Projectile(PVector aim, color f, int s) {
    hp = 1;
    loc = p1.loc.copy();
    vel = aim;
    fc = f;
    size = s;
    duration=180;
    roomX = p1.roomX;
    roomY = p1.roomY;
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
