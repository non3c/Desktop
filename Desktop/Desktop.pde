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
PImage[] Wallpapers;
void setup() {
  //size(displayWidth, displayHeight, FX2D);
  fullScreen(FX2D);
  //textMode(SHAPE);
  background(#ffffff);
  WallpaperSize = 3;
  randomTBColor = int(random(0, 2));


  Wallpapers = new PImage[WallpaperSize];

  for (int i = 0; i < WallpaperSize; i ++ ) {
    Wallpapers[i] = loadImage("Wallpapers/Wallpaper_" + i + ".jpg");
  }

  Montserrat = createFont("Fonts/Montserrat-LightItalic.ttf", 128);
  Supermercado = createFont("Fonts/SupermercadoOne-Regular.ttf", 128);
  randomWP = int(random(WallpaperSize));
}
void draw() {
  textAlign(CENTER);
  background(#ffffff);
  hour = hour();
  minute = minute();
  second = second();
  image(Wallpapers[randomWP], 0, 0, width, height);
  drawTime();
  taskBar();

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
      } else if (second > 10) {
        text("0" + hour + ":0" + minute + ":" + second, width/2, height/2);
      }
    } else if (minute > 10) {
      if (second < 10) {
        text("0" + hour + ":" + minute + ":0" + second, width/2, height/2);
      } else if (second > 10) {
        text("0" + hour + ":0" + minute + ":" + second, width/2, height/2);
      }
    }
  } else if (hour > 10) {
    if (minute < 10) {
      if (second < 10) {
        text("" + hour + ":0" + minute + ":0" + second, width/2, height/2);
      } else if (second > 10) {
        text("" + hour + ":0" + minute + ":" + second, width/2, height/2);
      }
    } else if (minute > 10) {
      if (second < 10) {
        text("" + hour + ":" + minute + ":0" + second, width/2, height/2);
      } else if (second > 10) {
        text("" + hour + ":" + minute + ":" + second, width/2, height/2);
      }
    }
  }
}

void taskBar() {
  noStroke();

  if (randomTBColor == 0) {
    fill(#121212, 200);
    rect(0, displayHeight-42, displayWidth, 42);
  } else if (randomTBColor == 1) {
    fill(#F2F2F2, 200);
    rect(0, displayHeight-42, displayWidth, 42);
  }
}
