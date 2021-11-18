class NightStalker extends Enemy {

  NightStalker() {
    super(100, 50, 7, 3);
  }

  NightStalker(int x, int y) {
    super(100, 50, x, y);
  }

  void show() {
    stroke(white);
    strokeWeight(5);
    fill(pink);
    circle(loc.x, loc.y, size);
    fill(white);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    //following AI
    vel = new PVector(p1.loc.x - loc.x, p1.loc.y - loc.y);
    vel.setMag(3);
  }
}
