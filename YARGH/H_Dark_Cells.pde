class DarkCell {
  float opacity;
  float x, y, size;

  DarkCell(float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 200;
  }
  
  void show() {
    rectMode(CORNER);
    noStroke();
    opacity = map(dist(x, y, p1.loc.x, p1.loc.y), 0, 1, 0, 1); 
    fill(black, opacity);
    square(x,y,size); 
    rectMode(CENTER);
  }
}
