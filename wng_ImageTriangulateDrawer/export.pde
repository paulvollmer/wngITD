

import processing.pdf.*;
PGraphics pdf;
boolean export = false;
String savePath;

PrintWriter textOutput;
String PROJECTNAME    = "wng_ImageTriangulateDrawer";
String PROJECTVERSION = "0.1.1_04a";
String LASTUPDATE     = "2010.12.13";
String PROJECTINFO    = "wng_ImageTriangulateDrawer project by wrong-entertainment";
String WRONG_ENTERTAINMENT_INFO =
"WRONG-ENTERTAINMENT\nCREATIVE STUDIOLAB FOR MOTION AND GRAFIKDESIGN\n\n"+
"CHECK OUT: http://www.wrong-entertainment.com\nCONTACT: wrongentertainment@yahoo.de\ncopyright (c) 2010 paul vollmer\nbuild with Processing\n";



/*
 * startExpoprt
 */
void startExport() {
  if (export) {
    // PDF File
    pdf = createGraphics(DRAWWIDTH, DRAWHEIGHT, PDF, savePath+".pdf");
    pdf.beginDraw();
    consoleText = "### START PDF WRITING";
    // Text File
    textOutput = createWriter(savePath+".itd");
    textOutput.println(WRONG_ENTERTAINMENT_INFO);
    textOutput.println("PROJECTNAME:\t"+PROJECTNAME+"\nPROJECTVERSION:\t"+PROJECTVERSION+"\nLASTUPDATE:\t"+LASTUPDATE+"\nPROJECTINFO:\t"+PROJECTINFO);
    textOutput.println("-----------------------------------------------------------------------------------------\n\n\n");  
    // start individual text
    textOutput.println("### CREATED AT "+nf(year(),4)+"."+nf(month(),2)+"."+nf(day(),2)+"_"+nf(hour(),2)+"."+nf(minute(),2)+"."+nf(second(),2)+"\n");
    textOutput.println("### NUMBER OF TRIANGLES: "+triangles.size()+"\n");
  }
}


/*
 * finishExpoprt
 */
void finishExport() {
  if (export) {
    export = false;
    // PDF File
    pdf.dispose();
    pdf.endDraw();
    consoleText = "### PDF WRITING READY";
    // Text File
    textOutput.flush();
    textOutput.close();
  }
}
