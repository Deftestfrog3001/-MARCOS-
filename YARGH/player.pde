class Player extends GameObject {

  Weapon myWeapon;
  gif currentAct;

  Player() {
    super();
    loc = new PVector (width/2, height/2);
    vel = new PVector (0, 0);
    hpMax = hp = 100;
    speed = 4;
    roomX = 7;
    roomY = 1;
    myWeapon = new Weapon();
    currentAct = manUp;
    ArrayList <Weapon> myWeapon;
    size = 60;
  }

  //Player(int x, int y) {
  //  super();
  //  loc = new PVector (width/2, height/2);
  //  vel = new PVector (0, 0);
  //  hp = 1;
  //  speed = 4;
  //  roomX = x;
  //  roomY = y;
  //  //Weapon swap
  //  myWeapon = new Weapon();
  //  ArrayList <Weapon> myWeapon;
  //}

  void show() {
    currentAct.show(loc.x, loc.y, size/1.5, size);
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

    if (abs(vel.y) > abs(vel.x)) {
      if (vel.y > 0) currentAct = manDown;
      else currentAct = manUp;
    } else {
      if (vel.x > 0) currentAct = manRight;
      else currentAct = manLeft;
    }

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

    //collision
    int i = 0;
    while (i < OBJ.size()) {
      GameObject myOb = OBJ.get(i);
      //enemy_projectile
      if (myOb instanceof EnemyProj && CollidingWith(myOb)) {
        hp = hp - int(myOb.vel.mag());
        myOb.hp = 0;
      }
      //enemy_touch
      if (myOb instanceof Enemy && CollidingWith(myOb)) {
        hp = hp - 1;
        //println(myOb.roomX, myOb.roomY, roomX, roomY);
      }
      if (myOb instanceof Loot && CollidingWith(myOb)) {
        Loot Loot = (Loot) myOb;
        if (Loot.type == WEAPON) {
          myWeapon = Loot.w;
          Loot.hp = 0;
        }
      }
      i++;
    }
  }
}
