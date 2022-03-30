class Tabs {
  //instance variables
  PVector pos;
  int sizeX, sizeY;
  PGraphics drawTab;
  
  color tabColor;
  int transparency;
  boolean showIcons;
  
  ToggleButtons closeTab;
  ToggleButtons maximizeTab;
  ToggleButtons minimizeTab;

  Tabs(PVector p, int sx, int sy, color c, int t, boolean sIcons) {
    pos = p;
    sizeX = sx;
    sizeY = sy;
    transparency = t;
    
    showIcons = sIcons;
    
    closeTab    = new ToggleButtons("Icons/Tabs/closeTabIcon/closeTab", ".png", sizeX-47, displayHeight-sizeY, 47, 30);
    maximizeTab = new ToggleButtons("Icons/Tabs/maximizeTabIcon/maximizeTab", ".png", sizeX-93, displayHeight-sizeY, 46, 30);
    minimizeTab = new ToggleButtons("Icons/Tabs/minimizeTabIcon/minimizeTab", ".png", sizeX-140, displayHeight-sizeY, 47, 30);
  }

  void show() {
    drawTab = createGraphics(sizeX, sizeY);

    drawTab.beginDraw();
    drawTab.noStroke();
    drawTab.fill(tabColor, transparency);
    drawTab.rect(0, 0, width, height);
    if (showIcons) {
      closeTab.show();
      maximizeTab.show();
      minimizeTab.show();
    }
    drawTab.endDraw();
    image(drawTab, pos.x, pos.y);
  }

  void act() {
  }
}
