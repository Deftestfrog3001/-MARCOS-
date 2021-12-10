class Button {

  float x, y, w, h;
  boolean clicked;
  color highlight, normal;
  String text;

  Button(String t, float _x, float _y, float _w, float _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }

  void show() {
    //rectangle
    pushMatrix();
    translate(x, y);
    rectMode(CENTER);
    noFill();
    noStroke();
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    } else {
    }
    rect(0, 0, w, h, 30);

    //text label
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      scale(1.2);
      fill(normal);
    } else {
      scale(1);
      fill(highlight);
    }
    textSize(w/4);
    text(text, 0, 0);
    noFill();
    popMatrix();
    noFill();

    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked  = true;
    } else {
      clicked = false;
    }
  }
}
