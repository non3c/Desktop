import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.javafx.*;

Minim minim;
AudioPlayer music1;


String hour, minute, second;


int randomWP;

boolean hadPressed;
boolean mouseReleased;

PFont Montserrat;
PFont Supermercado;
PFont Calibri;
PFont SmoochSans;
PImage[] Wallpapers;

ArrayList<Tabs> tabsList;
int STARTMENU, BROWSERTAB;

//GLOBAL VARIABLES
final int START = 0; 
final int SEARCH = 1; 
final int CORTANA = 2;
final int TASKVIEW = 3;
final int SHOWDESKTOP = 4;
final int NOTIFICATIONS = 5;
//final int 
//final int 
//final int 
//final int 
//final int 
//final int 
//final int


ToggleButtons[] toggleIcon;
Buttons[] buttonsIcon;

void setup() {
  fullScreen(FX2D);
  smooth();
  frameRate(60);
  cursor(ARROW);
  background(#ffffff);
  imageMode(CORNER);
  textAlign(CENTER);
  int WallpaperSize = 5;
  randomWP = int(random(-1, WallpaperSize));

  Wallpapers = new PImage[WallpaperSize];
  tabsList = new ArrayList<Tabs>();
  toggleIcon = new ToggleButtons[10];
  minim = new Minim(this);

  hour = nf(hour(), 2);
  minute = nf(minute(), 2);
  second = nf(second(), 2);


  for (int i = 0; i < WallpaperSize; i ++) {
    Wallpapers[i] = loadImage("Wallpapers/Wallpaper_" + i + ".jpg");
  }

  toggleIcon[START] = new ToggleButtons("Icons/TaskBar/WindowsIcon/Windows", ".png", 0, displayHeight-40, 48, 40);
  toggleIcon[SEARCH] = new ToggleButtons("Icons/TaskBar/SearchIcon/Search", ".png", 48, displayHeight-40, 48, 40);
  toggleIcon[CORTANA] = new ToggleButtons("Icons/TaskBar/CortanaIcon/Cortana", ".png", 96, displayHeight-40, 48, 40);
  toggleIcon[TASKVIEW] = new ToggleButtons("Icons/TaskBar/TaskViewIcon/TaskView", ".png", 144, displayHeight-40, 48, 40);
  toggleIcon[SHOWDESKTOP] = new ToggleButtons("Icons/TaskBar/ShowDesktopIcon/ShowDesktop", ".png", width-5, displayHeight-40, 5, 40);
  toggleIcon[NOTIFICATIONS] = new ToggleButtons("Icons/TaskBar/NotificationIcon/Notification", ".png", width-53, displayHeight-40, 48, 40);

  Montserrat = createFont("Fonts/Montserrat-LightItalic.ttf", 128); 
  Supermercado = createFont("Fonts/SupermercadoOne-Regular.ttf", 128); 
  Calibri = createFont("Fonts/Calibri.ttf", 128); 
  SmoochSans = createFont("Fonts/SmoochSans-Regular.ttf", 168); 

  //PGraphics pg = createGraphics(width,height);
  tabsList.add(new startMenu());
}

void draw() {

  //hour = hour();
  //minute = minute();
  //second = second();
  image(Wallpapers[randomWP], 0, 0, width, height); 
  updateTime(); 
  drawTime(); 
  drawIcons();
  taskBarShow(); 
  taskBarAct(); 



  if (mousePressed) hadPressed = true; 
  if (hadPressed &&!mousePressed) {
    mouseReleased = true; 
    hadPressed = false;
  } else mouseReleased = false;
}

void updateTime() {
  hour = nf(hour(), 2); 
  minute = nf(minute(), 2); 
  second = nf(second(), 2);
}

void drawTime() {
  textSize(186); 
  fill(#ffffff); 
  textFont(SmoochSans); 
  textAlign(CENTER, CENTER); 

  //text( + hour + minute + " : " + second, width/2, height/2);
  text(hour, width/2-180, height/2-20); 
  text(minute, width/2, height/2-20); 
  text(second, width/2+180, height/2-20); 
  text(":", width/2-90, height/2-20); 
  text(":", width/2+90, height/2-20);
}

void drawIcons() {
 for (int i = 0; i <= toggleIcon.length; i ++) {
   toggleIcon[i].show();
 }
  
}

void taskBarShow() {
  noStroke(); 
  fill(#dad9df); 
  rect(0, displayHeight-40, displayWidth, displayHeight);
}

  void taskBarAct() {
  for (int i = 0; i < tabsList.size(); i ++) {
    Tabs tabs = tabsList.get(i); 
    tabs.act(); 

    //if (toggleIcon[i].clicked()) {
    //  tabs.show();
    //} else {
    //}
  }
}
