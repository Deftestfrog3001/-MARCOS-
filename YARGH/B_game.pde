void game() {
  drawroom();
  drawGameObjects();  
  drawLightLayer();
  drawMiniMap();

  //println(p1.loc);
  //println(p1.vel);
  //println(frameRate);
}

void drawroom() {

  //level
  background(grey);
  fill(black);
  stroke(5);

  //walls
  line(0, 0, width, height);
  line(width, 0, 0, height);

  //exits
  //map detect
  northRoom = map.get(p1.roomX, p1.roomY-1);
  eastRoom  = map.get(p1.roomX+1, p1.roomY);
  southRoom = map.get(p1.roomX, p1.roomY+1);
  westRoom  = map.get(p1.roomX-1, p1.roomY);

  //draw exits
  noStroke();
  fill(black);
  if (northRoom != #ffffff) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastRoom != #ffffff) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom != #ffffff) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom != #ffffff) {
    ellipse(width*0.1, height/2, 100, 100);
  }

  //floor
  fill(white);
  stroke(black);
  strokeWeight(10);
  rect(width/2, height/2, width*0.8, height*0.8);
  image(cobble, width/2, height/2, width*0.8, height*0.8);
}

void drawGameObjects() {
  int i = 0;
  while (i < OBJ.size()) {
    GameObject myOb = OBJ.get(i);
    //print(myOb+ " ");
    if (myOb.roomX == p1.roomX && myOb.roomY == p1.roomY) {
      myOb.show();
      myOb.act();
    }

    if (myOb.hp <= 0) {
      OBJ.remove(i);
    } else {
      i++;
    }
  }
}

void drawLightLayer() {
  for (int i = 0; i < DC.size(); i ++) {
    DarkCell dark = DC.get(i);
    dark.show();
  }
  noFill();
}

void drawMiniMap() {
  noStroke();
  noFill();
  rectMode(CORNER);
  float size = 10;
  int x = 0;
  int y = 0;

  while (y < map.height) {
    color c = map.get(x, y);
    //Current Room Indicator
    if (p1.roomX == x && p1.roomY == y) { 
      fill(aqua);
    } else {
      if (c == white) {
        fill (c);
      } else {
        fill (c, 200);
      }
    }
    square(x*size, y*size, size);

    if (y == map.height)
      break;
    x = x + 1;

    if (x == map.width) {
      y = y + 1; 
      x = 0;
    } 
    rectMode(CENTER);
  }
}
