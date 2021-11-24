class Player extends GameObject {

  float speed;
  Weapon myWeapon;

  Player() {
    super();
    loc = new PVector (width/2, height/2);
    vel = new PVector (0, 0);
    hp = 100;
    speed = 4;
    roomX = 7;
    roomY = 1;
    myWeapon = new Weapon();
    ArrayList <Weapon> myWeapon;
  }

  Player(int x, int y) {
    super();
    loc = new PVector (width/2, height/2);
    vel = new PVector (0, 0);
    hp = 1;
    speed = 4;
    roomX = x;
    roomY = y;
    //Weapon swap
    myWeapon = new Weapon();
    ArrayList <Weapon> myWeapon;
  }

  void show() {
    fill(aqua);
    strokeWeight(5);
    stroke(red);
    circle(loc.x, loc.y, 40);
    fill(white);
    textSize(20);
    text(hp, loc.x, loc.y);
    println("hp:" + hp);
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
