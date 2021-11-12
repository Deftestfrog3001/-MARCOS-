class Enemy extends GameObject {

  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp  = 100;
    roomX = 1;
    roomY = 1;
    size = 50;
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
}
