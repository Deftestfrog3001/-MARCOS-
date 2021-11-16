class NightStalker extends Enemy {

  NightStalker() {
    super(100, 50, 1, 2);
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

    vel = new PVector(p1.loc.x - loc.x, p1.loc.y - loc.y);
    vel.setMag(3);
  }
}
