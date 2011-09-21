/**
 *
 *  wngITD is a wrong-entertainment production
 *
 *
 *  Copyright 2011 wrong-entertainment
 *                 <wrongentertainment@yahoo.de>
 *                 <http://wrong-entertainment.com>
 * 
 *  This file is part of wngITD.
 *
 *  wngITD is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  wngITD is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU Lesser General Public License for more details.
 *  
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with wngITD. If not, see <http://www.gnu.org/licenses/>.
 *
 */



// application value
int WIDTH = 750;
int HEIGHT = 750;
int SPACING = 20;
int DRAWWIDTH = WIDTH-(SPACING*2);
int DRAWHEIGHT = HEIGHT-(SPACING*2);
int bgColor = 10;
// image
PImage img;
String loadPath;
float imgWidth = WIDTH-(SPACING*2);
float imgHeight = HEIGHT-(SPACING*2);
float iw, ih; // resize
// font
PFont VERA_MONO;
String consoleText = "wng_imageTriangulationDrawer ### IMPORT AN IMAGE";
// mouse position
float mousePosX, mousePosY;




/*
 * setup
 */
void setup() {
  size(WIDTH, HEIGHT);
  smooth();
  // set new window title
  frame.setTitle("wng_imageTriangulateDrawer - v 0.1.1_05c1");
  // set the first four points
  setupPoints();
  // create controlP5 setup
  controlSetup();
  // font load
  VERA_MONO = createFont("VeraMono.ttf", 10, false);
}


/*
 * draw
 */
void draw() {
  // wait one second (to be save for import function)
  if(frameCount < 2) delay(1500);
  
  background(bgColor);
  
  // if imput is selected
  if(importerload == true) {
    img = loadImage(loadPath);
    //println(img.width+"x"+img.height);
    // resize image, if bigger
    if(img.width > imgWidth) {
      img.resize(int(imgWidth), 0);
      imgWidth = img.width;
      imgHeight = img.height;
    }
    if(img.height > imgHeight) {
      img.resize(0, int(imgHeight));
      imgWidth = img.width;
      imgHeight = img.height;
    }
    // resize image, if smaller
    iw = (imgWidth / img.width);
    ih = (imgHeight / img.height);
    if(iw < ih) {
      img.resize(int(imgWidth), 0);
      imgWidth = img.width;
      imgHeight = img.height;
    }
    if(iw > ih) {
      img.resize(0, int(imgHeight));
      imgWidth = img.width;
      imgHeight = img.height;
    }
    //println("W: " + imgWidth + "\tH: " + imgHeight);
    // set the first four points
    setupPoints();
    // set imput selected to false
    importerload = false;
  }
  
  startExport();
  
  pushMatrix();
  translate(SPACING, SPACING);
    pushMatrix();
      // zoom function
      scale(scaleValue);
      // translate function
      translate(transX, transY);
      
      // get the triangulated mesh
      triangles = Triangulate.triangulate(points);
      
      if(importer == true) {
        image(img, 0, 0);
        if(export == false) triangleMesh();
      }
      if(export == true) triangleMeshExport();
    popMatrix();
  popMatrix();
  
  // non drawing space mask
  fill(bgColor);
  noStroke();
  rect(0,0,width,SPACING);
  rect(0,height-SPACING,width,SPACING);
  rect(0,0,SPACING,height);
  rect(width-SPACING,0,SPACING,height);
  
  // console text
  textFont(VERA_MONO);
  fill(0, 255, 255);
  text(consoleText, 130, 12);
  
  finishExport();
}


/*
 * mousePressed
 */
void mousePressed() {
  if(overRect(SPACING, SPACING, DRAWWIDTH, DRAWHEIGHT)) {
    mousePosX = mouseX-SPACING;
    mousePosY = mouseY-SPACING;
    pushMatrix();
      // zoom function
      if(scaleValue > 1.0) {
        scale(scaleValue);
        mousePosX = (mousePosX/scaleValue);
        mousePosY = (mousePosY/scaleValue);
      }
      // translate function
      if(transX > 1) {
        mousePosX = mousePosX - transX;
      }
      if(transX < -1) {
        mousePosX = mousePosX - transX;
      }
      if(transY > 1) {
        mousePosY = mousePosY - transY;
      } if(transY < -1) {
        mousePosY = mousePosY - transY;
      }
      points.add(new PVector(mousePosX, mousePosY));
      consoleText = "### POINT ADDED X: "+mousePosX+" Y: "+mousePosY;
    popMatrix();
  }
  //println(mousePosX +" _ "+ mousePosY);
  println(transX +" _ "+ transY);
}


/*
 * mouseMoved
 */
void mouseMoved() {
  // mouse modi
  if(overRect(SPACING, SPACING, DRAWWIDTH, DRAWHEIGHT)) {
    cursor(CROSS);
  } else {
    cursor(ARROW);
  }
}


/*
 * overRect
 */
boolean overRect(int x, int y, int w, int h) {
  if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}


/*
 * keyPressed
 */
void keyPressed() {
  // zoom function
  if(key == '+') zoomIn();
  if(key == '-') zoomOut();
  // translate function
  if(key == CODED) {
    if(keyCode == UP) translateUp();
    if(keyCode == LEFT) translateLeft();
    if(keyCode == RIGHT) translateRight();
    if(keyCode == DOWN) translateDown();
  }
}
