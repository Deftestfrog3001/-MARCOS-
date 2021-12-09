void pause() {
  background(black, 255);

  //buttons
  HP  = new Button(">", width*0.1, height*0.3, 150, 100, red, white);
  AGL  = new Button(">", width*0.1, height*0.6, 150, 100, red, white);
  DMG  = new Button(">", width*0.1, height*0.9, 150, 100, red, white);
  noFill();

  //text
  fill(white);
  text("EXP: " + p1.xp, width*0.2, height*0.1, 150, 100);
  text("HP: " + p1.hp, width*0.2, height*0.3, 150, 100);
  text("AGL: " + p1.speed, width*0.22, height*0.6, 150, 100);
  text("DMG: " + p1.damage, width*0.2, height*0.9, 150, 100);

  HP.show();
  AGL.show();
  DMG.show();

  //return
    if (Pkey) mode = GAME;
  }
