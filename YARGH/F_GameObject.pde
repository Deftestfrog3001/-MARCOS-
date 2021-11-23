class GameObject {
  int hp;
  PVector loc;
  PVector vel;
  int size; 
  int roomX, roomY;

  GameObject() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
  }

  void show () {
  }

  void act () {
    //move
    loc.add(vel);

    //Wall collision
    if (loc.x < width*0.1) loc.x = width*0.1;
    if (loc.x > width*0.9) loc.x = width*0.9;
    if (loc.y < height*0.1) loc.y = height*0.1;
    if (loc.y > height*0.9) loc.y = height*0.9;
  }

  boolean RoomWith(GameObject OBJ) {
   
    return (roomX == OBJ.roomX && roomY == OBJ.roomY);
  }

  boolean CollidingWith(GameObject OBJ) {
    float d = dist(OBJ.loc.x, OBJ.loc.y, loc.x, loc.y);
    if (RoomWith(OBJ) && d <= OBJ.size/2 + size/2) {
      return true;
      
    }
    else
      return false;
  }
}
