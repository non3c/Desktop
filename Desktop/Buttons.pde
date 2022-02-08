
class Buttons {
  //instance variables
  PVector pos;
  PVector size;
  PImage unhoverImage, hoverImage;
  String text;
  PFont font;
  float fontSize;
  String prefix, suffix;
  boolean clicked;
  PImage[] buttons;

  Buttons(String pre, String suf, float x, float y, float w, float h) {
    //constructor
    pos = new PVector(x, y);
    size = new PVector(w, h);
    prefix = pre;
    suffix = suf;
    buttons = new PImage[2];
    buttons[0] = loadImage(prefix+"_Unhovered"+suffix);
    buttons[1] = loadImage(prefix+"_Hovered"+suffix);
  }

  Buttons(String pre, String suf, float x, float y, float w, float h, float fs, String txt) {
    //constructor
    pos = new PVector(x, y);
    size = new PVector(w, h);
    fontSize = fs;
    text = txt;
    prefix = pre;
    suffix = suf;
    buttons = new PImage[2];
    buttons[0] = loadImage(prefix+"_Unhovered"+suffix);
    buttons[1] = loadImage(prefix+"_Hovered"+suffix);
  }

  void show() {
    //behaviour function
    rectMode(CENTER);
    textAlign(CENTER);
    strokeWeight(5);
    //Hovering
    if ( mouseX > pos.x-size.x/2 && mouseX < pos.x+size.x/2 && mouseY > pos.y-size.y/2 && mouseY < pos.y+size.y/2) {
      textFont(font);
      image();
      textSize(fontSize);
      text(text, pos.x, pos.y+10);
    } else {
      textFont(font);
      rect(pos.x, pos.y, size.x, size.y, 10);
      textSize(fontSize+5);
      text(text, pos.x, pos.y+10);
    }
    if (mouseReleased && mouseX > pos.x-size.x/2 && mouseX < pos.x+size.x/2 && mouseY > pos.y-size.y/2 && mouseY < pos.y+size.y/2) {
      //check for click
      clicked = true;
    } else {
      clicked = false;
    }
  }
}
