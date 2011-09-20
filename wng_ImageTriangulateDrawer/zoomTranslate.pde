

// zoom function
float scaleValue = 1.0;
float scaleFactor = 0.1;
// translate function
int transX = 0;
int transY = 0;
int transFactor = 10;


/*
 * zoomIn
 */
void zoomIn() {
  scaleValue = scaleValue + scaleFactor;
}

/*
 * zoomOut
 */
void zoomOut() {
  if(scaleValue > 1.0) {
    scaleValue = scaleValue - scaleFactor;
  }
}





/*
 * translateUp
 */
void translateUp() {
  println("translate up " + transY);
  transY = transY - transFactor;
}

/*
 * translateLeft
 */
void translateLeft() {
  println("translate left " + transX);
  transX = transX - transFactor;
}

/*
 * translateRight
 */
void translateRight() {
  println("translate right " + transX);
  transX = transX + transFactor;
}

/*
 * translateDown
 */
void translateDown() {
  println("translate down " + transY);
  transY = transY + transFactor;
}
