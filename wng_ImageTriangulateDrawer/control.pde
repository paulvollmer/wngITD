

import controlP5.*;
ControlP5 controlP5;

boolean importer = false;
boolean importerload = false;
boolean exporter = false;


/*
 * controlSetup
 */
void controlSetup() {
  controlP5 = new ControlP5(this);
  controlP5.addButton("IMPORT",0, 20,0, 50,15);
  controlP5.addButton("EXPORT",1, 75,0, 50,15);
  controlP5.addButton("ZOOMIN",2, 0,75, 15,15).setLabel("+");
  controlP5.addButton("ZOOMOUT",3, 0,95, 15,15).setLabel("-");
  controlP5.addButton("UP",4, 0,135, 15,15).setLabel("^");
  controlP5.addButton("LEFT",5, 0,155, 15,15).setLabel("<");
  controlP5.addButton("RIGHT",6, 0,175, 15,15).setLabel(">");
  controlP5.addButton("DOWN",7, 0,195, 15,15).setLabel("v");
}


/*
 * function IMPORT
 */
public void IMPORT(int theValue) {
  imgWidth = WIDTH-(SPACING*2);
  imgHeight = HEIGHT-(SPACING*2);
  // Opens file chooser
  loadPath = selectInput("Import jpg, png or gif");
  if (loadPath == null) {
    // If a file was not selected
    consoleText = "### NO FILE WAS SELECTED";
  } else {
    // If a file was selected, print path to file
    consoleText = "### "+loadPath;
    importer = true;
    importerload = true;
    delay(1000);
  }
}


/*
 * function EXPORT
 */
public void EXPORT(int theValue) {
  // reset zoom + translate
  scaleValue = 1.0;
  transX = 0;
  transY = 0;
  // Opens file chooser
  savePath = selectOutput("Export this crazy stuff :)");
  if (savePath == null) {
    // If a file was not selected
    consoleText = "### NO OUTPUT FILE WAS SELECTED";
  } else {
    // If a file was selected, print path to folder
    consoleText = "### "+savePath;
    export = true;
    redraw();
  }
}


/*
 * function ZOOMIN
 */
public void ZOOMIN(int theValue) {
  zoomIn();
}

/*
 * function ZOOMOUT
 */
public void ZOOMOUT(int theValue) {
  zoomOut();
}


/*
 * function UP
 */
public void UP(int theValue) {
  translateUp();
}

/*
 * function LEFT
 */
public void LEFT(int theValue) {
  translateLeft();
}

/*
 * function RIGHT
 */
public void RIGHT(int theValue) {
  translateRight();
}

/*
 * function DOWN
 */
public void DOWN(int theValue) {
  translateDown();
}
