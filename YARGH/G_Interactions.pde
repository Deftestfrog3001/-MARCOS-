void keyPressed() {
  if (key == 'W')           Wkey = true;
  if (key == 'S')           Skey = true;
  if (key == 'A')           Akey = true;
  if (key == 'D')           Dkey = true;
  if (key == 'P')           Pkey = true;
  if (key == ' ')       Spacekey = true;
  if (keyCode == SHIFT) Shiftkey = true;
}

void keyReleased() {
  if (key == 'W')           Wkey = false;
  if (key == 'S')           Skey = false;
  if (key == 'A')           Akey = false;
  if (key == 'D')           Dkey = false;
  if (key == 'P')           Pkey = false;
  if (key == ' ')       Spacekey = false;
  if (keyCode == SHIFT) Shiftkey = false;
}
