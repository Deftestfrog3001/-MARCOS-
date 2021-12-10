void pause() {
  //fill(black, 25);
  //rect(width/2, height/2, width, height);
  background(black);

  //buttons
  HP.show();
  AGL.show();
  DMG.show();


  if (HP.clicked) {
    p1.hpMax = p1.hpMax + 10;
    p1.hp = p1.hp + 10;
  }
 
  if (AGL.clicked) {
    p1.speed = p1.speed + 1;
    println("tap");
  }
 
  if (DMG.clicked) {
    p1.damage = p1.damage + 2;
  }
  noFill();

  //text
  fill(white);
  text("EXP: " + p1.xp, width*0.2, height*0.1, 150, 100);
  text("HP: " + p1.hpMax, width*0.2, height*0.3, 150, 100);
  text("AGL: " + p1.speed, width*0.22, height*0.6, 150, 100);
  text("DMG: " + p1.damage, width*0.2, height*0.9, 150, 100);



  //return
  //button(s)

  UnPause  = new Button("X", width*0.9, height*0.1, 150, 100, red, white);

  UnPause.show();

  if (UnPause.clicked) {
    mode = GAME;
  }
}
