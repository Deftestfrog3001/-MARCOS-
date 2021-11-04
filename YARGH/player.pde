class Player extends GameObject {

  float speed;
  int roomX, roomY;
  Weapon myWeapon;

  Player() {
    super();
    loc = new PVector (width/2, height/2);
    vel = new PVector (0, 0);
    hp = 1;
    speed = 4;
    roomX = 1;
    roomY = 1;
    myWeapon = new Weapon();
    ArrayList <Weapon> myWeapon;
  }

  void show() {
    fill(aqua);
    strokeWeight(5);
    stroke(red);
    circle(loc.x, loc.y, 40);
  }

  void act() {

    super.act();
    loc.add(vel);
    if (Wkey) vel.y = -speed;
    if (Akey) vel.x = -speed;
    if (Skey) vel.y = speed;
    if (Dkey) vel.x = speed;

    if (vel.mag() > speed) vel.setMag(speed);

    if (!Wkey && !Skey) vel.y = 0;
    if (!Akey && !Dkey) vel.x = 0;

    //exit detect
    //north
    if (northRoom != white && loc.y <= height*0.1 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY = roomY - 1;
      loc = new PVector(width/2, height*0.9-20);
    } else if
      //east
      (eastRoom != white && loc.x >= width*0.9 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX = roomX + 1;
      loc = new PVector(width*0.1+20, height/2);
    } else if
      //south
      (southRoom != white && loc.y >= height*0.9 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY = roomY + 1;
      loc = new PVector(width/2, height*0.1+20);
    } else if
      //west
      (westRoom != white && loc.x <= width*0.1 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX = roomX -1;
      loc = new PVector(width*0.9-20, height/2);
    }

    //fire
    myWeapon.update();
    if (mousePressed && mode == GAME) {
      myWeapon.fire();
    }
  }
}
