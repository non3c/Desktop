import processing.javafx.*;

int hour = hour();
int minute = minute();
int second = second();
int WallpaperSize;
int randomWP;

boolean hadPressed;
boolean mouseReleased;

PFont Montserrat;
PFont Supermercado;
PFont Calibri;
PImage[] Wallpapers;


Buttons startIcon;
Buttons searchIcon;
Buttons cortanaIcon;
Buttons taskviewIcon;

Buttons showdesktopIcon;
Buttons notificationIcon;
Buttons inputIcon;

void setup() {
  fullScreen(FX2D);
  smooth();
  frameRate(60);
  background(#ffffff);
  WallpaperSize = 3;
  Wallpapers = new PImage[WallpaperSize];

  startIcon = new Buttons("Icons/WindowsIcon/Windows", ".png", 24, displayHeight-20, 48, 40);
  searchIcon = new Buttons("Icons/SearchIcon/Search", ".png", 72, displayHeight-20, 48, 40);
  cortanaIcon = new Buttons("Icons/CortanaIcon/Cortana", ".png", 120, displayHeight-20, 48, 40);
  taskviewIcon = new Buttons("Icons/TaskViewIcon/TaskView", ".png", 168, displayHeight-20, 48, 40);

  showdesktopIcon = new Buttons("Icons/ShowDesktopIcon/ShowDesktop", ".png", width-2.5, displayHeight-20, 5, 40);
  notificationIcon = new Buttons("Icons/NotificationIcon/Notification", ".png", width-29, displayHeight-20, 48, 40);
  

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
  image(Wallpapers[randomWP], width/2, height/2, width, height);
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
  fill(#dad9df);
  rect(0, displayHeight-40, displayWidth, 40);
  startIcon.show();
  searchIcon.show();
  cortanaIcon.show();
  taskviewIcon.show();

  showdesktopIcon.show();
  notificationIcon.show();
}
