void intro() {
  campfire.show();
  
  //Audio
  //intro.play();
  
  //Title
  textSize(75);
  text("~MARCOS~",width/2,height*0.25);

  //button(s)

  StartB  = new Button("Start", width*0.9, height*0.7, 150, 100, red , white);

  StartB.show();

  if (StartB.clicked) {
    mode = GAME;
  }
}

void IntroClicks() {
}
