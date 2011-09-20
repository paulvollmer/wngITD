

import org.processing.wiki.triangulate.*;
ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();



/*
 * setupPoints
 */
void setupPoints() {
  points.clear();
  // add the first four points automatically
  points.add(new PVector(0, 0));
  points.add(new PVector(imgWidth, 0));
  points.add(new PVector(imgWidth, imgHeight));
  points.add(new PVector(0, imgHeight));
}


/*
 * triangleMesh
 * draw the mesh of triangles
 */
void triangleMesh() {
  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
    noFill();
    strokeWeight(1);
    strokeCap(ROUND);
    strokeJoin(ROUND);
    stroke(255,0,0);
    // create shape
    beginShape(TRIANGLES);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
    endShape();
  }
}


/*
 * triangleMeshExport
 * draw the mesh of triangles to PDF File
 */
void triangleMeshExport() {
  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
    // get color
    color c = get(int((t.p1.x + t.p2.x + t.p3.x) / 3),
                  int((t.p1.y + t.p2.y + t.p3.y) / 3));
    pdf.fill(c);
    pdf.strokeWeight(0.75);
    pdf.strokeCap(ROUND);
    pdf.strokeJoin(ROUND);
    pdf.stroke(c);
    // create shape
    pdf.beginShape(TRIANGLES);
    pdf.vertex(t.p1.x, t.p1.y);
    pdf.vertex(t.p2.x, t.p2.y);
    pdf.vertex(t.p3.x, t.p3.y);
    pdf.endShape();
    println("### TRIANGLES "+i+" OF "+triangles.size());
    // textOutput
    textOutput.println("### NUMBER "+(i+1)+"\tP1.X: "+t.p1.x + "\tP1.Y: "+t.p1.y +
                                           "\tP2.X: "+t.p2.x + "\tP2.Y: "+t.p2.y +
                                           "\tP3.X: "+t.p3.x + "\tP3.Y: "+t.p3.y +
                                           "\tCOLOR: "+ hex(c, 8));
  }
}
