class Loot extends GameObject {
  
  int type;
  Weapon w;
  Potion p;
  
  Loot(float x, float y, int rx, int ry) {
    type = WEAPON;
    w = new MP5();
    hp = 1;
    loc = new PVector(x,y);
    vel = new PVector(0,0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c = orangeGold;
  }
  
  void show() {
   stroke(black);
   strokeWeight(2);
   fill(c);
   circle(loc.x, loc.y, size);
  }
}
