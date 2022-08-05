class SelectorBar {
  static final int SPACESTATION = 1;
  static final int RAMMERSHIP = 2;
  static final int SLOWTOWER = 3;
  static final int MISSILETOWER = 4;
  static final int VORTEXTOWER = 5;
  static final int SCRAPPER = 6;
  SpaceStation a1;
  RammerShip a2;
  SlowTower a3;
  MissileTower a4;
  VortexTower a5;
  Scrapper a6;
  Ally samples[] = new Ally[6];
  int selected;
  int XSIZE = 420;
  int YSIZE = 80;
  int XCORNER =  173;
  int YCORNER = height - 90;
  int size = int((XSIZE -10) /6.);
  SelectorBar() {
    selected = 1;
    a1 = new SpaceStation(10,10);
    a2 = new RammerShip(10,10);
    a3 = new SlowTower(10,10);
    a4 = new MissileTower(0,0);
    a5 = new VortexTower(0,0);
    a6 = new Scrapper(0,0);
    setTowerCors(SPACESTATION,a1);
    setTowerCors(RAMMERSHIP,a2);
    setTowerCors(SLOWTOWER,a3);
    setTowerCors(MISSILETOWER,a4);
    setTowerCors(VORTEXTOWER,a5);
    setTowerCors(SCRAPPER,a6);
  }
  void display() {
    fill(135);
    rect(XCORNER,YCORNER,XSIZE,YSIZE);
    for (int i = 1; i <= 6; i++) {
      drawTower(i);
    }
    highlightSelected();
    a1.display();
    a2.display();
    a3.display();
    a4.display();
    a5.display();
    a6.display();
  }
  void setTowerCors(int towerType, Ally a) {
    int xCorner = 5 + XCORNER + (towerType-1)*size;
    int yCorner = YCORNER + 5;
    a.location.x = xCorner + size/2;
    a.location.y = yCorner + size/2;
  }
  void highlightSelected() {
    rectMode(CORNER);
    fill(255,255,0);
    int xCorner = 5 + XCORNER + (selected-1)*size;
    int yCorner = YCORNER + 5;
    rect(xCorner,yCorner, size,size);
  }
  void drawTower(int towerType) {
    noFill();
    int xCorner = 5 + XCORNER + (towerType-1)*size;
    int yCorner = YCORNER + 5;
    rect(xCorner,yCorner, size,size);
  }
  void setSelected(int x, int y) {
    for (int i = 1; i <= 6; i++) {
      int xCorner = 5 + XCORNER + (i-1)*size;
      int yCorner = YCORNER + 5;
      if (x > xCorner && x < xCorner + size && y > yCorner && y < yCorner + size) {
        selected = i;
        return;
      }
    }
  }
}
