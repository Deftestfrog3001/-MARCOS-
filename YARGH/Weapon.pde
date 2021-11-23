class Weapon {

  int shotTimer;
  int threshold;
  int projectileSpeed;

  //default weapon
  Weapon() {
    shotTimer = 0;
    threshold = 15;
    projectileSpeed = 5;
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
      OBJ.add(new Projectile(aimVector, yellow, 10));
      shotTimer = 0;
    }
  }
}
