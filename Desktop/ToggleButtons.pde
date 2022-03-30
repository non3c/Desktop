
class ToggleButtons {
  //instance variables
  PVector pos;
  PVector size;
  //PGraphics PGicons;
  PImage unhoverImage, hoverImage;
  String text;
  float fontSize;
  String prefix, suffix;
  boolean clicked;
  PImage[] buttons;

  ToggleButtons(String pre, String suf, float x, float y, float w, float h) {
    //constructor
    pos = new PVector(x, y);
    size = new PVector(w, h);
    fontSize = 1;
    text = "";
    prefix = pre;
    suffix = suf;
    buttons = new PImage[2];
    buttons[0] = loadImage(prefix+"_Unhovered"+suffix);
    buttons[1] = loadImage(prefix+"_Hovered"+suffix);
  }

  ToggleButtons(String pre, String suf, float x, float y, float w, float h, PFont ft, float fs, String txt) {
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
    
    textAlign(CENTER);
    strokeWeight(5);
    //Hovering
    if (mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y) {
      textFont(Calibri); 
      image(buttons[1], pos.x, pos.y, size.x, size.y);
      textSize(fontSize);
      text(text, pos.x, pos.y+10);
    } else {
      textFont(Calibri);
      image(buttons[0], pos.x, pos.y, size.x, size.y);
      textSize(fontSize+5);
      text(text, pos.x, pos.y+10);
    }
    if (mouseReleased && mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y) {
      if (clicked == false) {
        //check for click
        clicked = true;
      } else if (clicked == true) {
        clicked = false;
      }
    }
  }
}
