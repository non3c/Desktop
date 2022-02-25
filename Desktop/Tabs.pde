class Tabs {
  //instance variables
  PVector pos;
  PVector size;
  Buttons closeTab;
  Buttons maximizeTab;
  Buttons minimizeTab;

  Tabs(PVector p, PVector s) {
    pos = p;
    size = s;
    closeTab    = new Buttons("Icons/Tabs/closeTabIcon/closeTab", ".png", size.x-23.5, displayHeight-20, 47, 30);
    maximizeTab = new Buttons("Icons/Tabs/maximizeTabIcon/maximizeTab", ".png", size.x, displayHeight-20, 46, 30);
    minimizeTab = new Buttons("Icons/Tabs/minimizeTabIcon/minimizeTab", ".png", size.x, displayHeight-20, 47, 30);
  }

  void show(color c, int t) {
    fill(c, t);
    rect(pos.x, pos.y, size.x, size.y);
    closeTab.show();
    maximizeTab.show();
    minimizeTab.show();
  }

  void act() {
  }
}
