class Enemy extends GameObject {

  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp  = 100;
    roomX = 1;
    roomY = 1;
    size = 50;
  }

  Enemy(int _hp, int s, int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp  = _hp;
    roomX = x;
    roomY = y;
    size = s;
  }

  void show() {
    stroke(white);
    strokeWeight(5);
    fill(green);
    circle(loc.x, loc.y, size);
    fill(white);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    //bullet collision
    int i = 0;
    while (i < OBJ.size()) {
      GameObject myOb = OBJ.get(i);
      if (myOb instanceof Projectile) {
        float d = (dist(loc.x, loc.y, myOb.loc.x, myOb.loc.y));
        if (d <= size/2 +  myOb.size/2) {
          myOb.hp--;
          hp=hp-25;
        }
      }
      i++;
    }
  }
}
