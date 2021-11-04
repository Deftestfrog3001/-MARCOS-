class Weapon {

  int shotTimer;
  int threshold;
  int projectileSpeed;

  Weapon() {
    shotTimer = 0;
    threshold = 0;
    projectileSpeed = 8;
  }

  Weapon(int thr, int ps) {
    shotTimer = 0;
    threshold = thr;
    projectileSpeed = ps;
  }

  void update() {
    shotTimer++;
  }

  void fire() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-p1.loc.x, mouseY-p1.loc.y);
      aimVector.setMag(projectileSpeed);
      println("L");
      myObjects.add(new Projectile(aimVector, red, 10));
      shotTimer = 0;
    }
  }
}
