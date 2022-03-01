import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.javafx.*;

Minim minim;
AudioPlayer music1;

PGraphics drawTaskbar;

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

ArrayList<Tabs> tabsList;
int STARTMENU, BROWSERTAB;


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
  WallpaperSize = 5;
  Wallpapers = new PImage[WallpaperSize];
  tabsList = new ArrayList<Tabs>();
  
  minim = new Minim(this);

  drawTaskbar = createGraphics(width, 40);
  
  

  startIcon = new Buttons("Icons/TaskBar/WindowsIcon/Windows", ".png", 24, displayHeight-20, 48, 40);
  searchIcon = new Buttons("Icons/TaskBar/SearchIcon/Search", ".png", 72, displayHeight-20, 48, 40);
  cortanaIcon = new Buttons("Icons/TaskBar/CortanaIcon/Cortana", ".png", 120, displayHeight-20, 48, 40);
  taskviewIcon = new Buttons("Icons/TaskBar/TaskViewIcon/TaskView", ".png", 168, displayHeight-20, 48, 40);

  showdesktopIcon = new Buttons("Icons/TaskBar/ShowDesktopIcon/ShowDesktop", ".png", width-2.5, displayHeight-20, 5, 40);
  notificationIcon = new Buttons("Icons/TaskBar/NotificationIcon/Notification", ".png", width-29, displayHeight-20, 48, 40);


  for (int i = 0; i < WallpaperSize; i ++) {
    Wallpapers[i] = loadImage("Wallpapers/Wallpaper_" + i + ".jpg");
  }

  Montserrat = createFont("Fonts/Montserrat-LightItalic.ttf", 128);
  Supermercado = createFont("Fonts/SupermercadoOne-Regular.ttf", 128);
  Calibri = createFont("Fonts/Calibri.ttf", 128);
  randomWP = int(random(-1, WallpaperSize));

  tabsList.add(new startMenu());
  
  
  
  //GLOBAL VARIABLES
  
}

void draw() {
  imageMode(CENTER);
  textAlign(CENTER);
  hour = hour();
  minute = minute();
  second = second();
  image(Wallpapers[randomWP], width/2, height/2, width, height);
  drawTime();
  taskBarShow();
  taskBarAct();
  image(drawTaskbar, 9, 30); 


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


void taskBarShow() {
  drawTaskbar.beginDraw();
  drawTaskbar.filter(BLUR, 3);
  drawTaskbar.noStroke();
  drawTaskbar.fill(#dad9df);
  drawTaskbar.rect(0, displayHeight-40, displayWidth, 40, 200);
  drawTaskbar.endDraw();
  startIcon.show();
  searchIcon.show();
  cortanaIcon.show();
  taskviewIcon.show();

  showdesktopIcon.show();
  notificationIcon.show();
}

void taskBarAct() {
  if (startIcon.clicked) {
    tabsList.get(0).show(#dddddd, 200);
  }
}
