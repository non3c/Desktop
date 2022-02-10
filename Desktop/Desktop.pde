import processing.javafx.*;

int hour = hour();
int minute = minute();
int second = second();
int WallpaperSize;
int randomWP;
int randomTBColor;

boolean hadPressed;
boolean mouseReleased;

PFont Montserrat;
PFont Supermercado;
PFont Calibri;
PImage[] Wallpapers;

Buttons startMenu;
Buttons SearchBar;
void setup() {
  smooth();
  frameRate(60);
  fullScreen(FX2D);
  //textMode(SHAPE);
  background(#ffffff);
  WallpaperSize = 3;
  Wallpapers = new PImage[WallpaperSize];
  randomTBColor = int(random(0, 2));
  
  startMenu = new Buttons("Icons/WindowsIcon/Windows", ".png", 0+12, displayHeight-30, 20, 20);


  for (int i = 0; i < WallpaperSize; i ++ ) {
    Wallpapers[i] = loadImage("Wallpapers/Wallpaper_" + i + ".jpg");
  }

  Montserrat = createFont("Fonts/Montserrat-LightItalic.ttf", 128);
  Supermercado = createFont("Fonts/SupermercadoOne-Regular.ttf", 128);
  Calibri = createFont("Fonts/Calibri.ttf", 128);
  randomWP = int(random(WallpaperSize));
}
void draw() {

  textAlign(CENTER);
  hour = hour();
  minute = minute();
  second = second();
  image(Wallpapers[randomWP], 0, 0, width, height);
  drawTime();
  taskBar();
  
  startMenu.show();
  if (mousePressed) hadPressed = true;
  if (hadPressed &&!mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else mouseReleased = false;
}

void drawTime() {
  textSize(156);
  fill(#ffffff);
  textFont(Montserrat);
  if (hour < 10) {
    if (minute < 10) {
      if (second < 10) {
        text("0" + hour + ":0" + minute + ":0" + second, width/2, height/2);
      } else if (second >= 10) {
        text("0" + hour + ":0" + minute + ":" + second, width/2, height/2);
      }
    } else if (minute >= 10) {
      if (second < 10) {
        text("0" + hour + ":" + minute + ":0" + second, width/2, height/2);
      } else if (second >= 10) {
        text("0" + hour + ":0" + minute + ":" + second, width/2, height/2);
      }
    }
  } else if (hour > 10) {
    if (minute < 10) {
      if (second < 10) {
        text("" + hour + ":0" + minute + ":0" + second, width/2, height/2);
      } else if (second >= 10) {
        text("" + hour + ":0" + minute + ":" + second, width/2, height/2);
      }
    } else if (minute >= 10) {
      if (second < 10) {
        text("" + hour + ":" + minute + ":0" + second, width/2, height/2);
      } else if (second >= 10) {
        text("" + hour + ":" + minute + ":" + second, width/2, height/2);
      }
    }
  }
}

void taskBar() {
  noStroke();
  if (randomTBColor == 0) {
    fill(#121212, 230);
    rect(0, displayHeight-40, displayWidth, 40);
  } else if (randomTBColor == 1) {
    fill(#F2F2F2, 230);
    rect(0, displayHeight-40, displayWidth, 40);
  }
}
