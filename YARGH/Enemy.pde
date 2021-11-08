class Enemy extends GameObject {

  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp  = 100;
    roomX = 1;
    roomY = 1;
  }

  void show() {
    stroke(white);
    strokeWeight(10);
    fill(green);
    ellipse(loc.x, loc.y, size, size);
  }
}
