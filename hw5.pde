import processing.dxf.*;

boolean record = false;
int radius=20;
int gapDis=30;
int dense=10;
color c1=color(0,0,255);
int diver_x=0;
int diver_z=0;

void setup() {
  size(600, 400, P3D);
  background(0);
  noStroke();
  saveFrame();
}

void draw() {
  keyPressed();
  if (record == true) {
    beginRaw(DXF, "output.dxf");
  }
  background(0);
  lights();
  translate(width/2, height/2, -200);
  rotateY(map(mouseX, 0, width, 0, PI));
  rotateZ(map(mouseY, 0, height, 0, -PI));
  fill(255);
  for (int y = -dense/2; y < dense/2; y++) {
    for (int x = -dense/2+diver_x; x < dense/2; x++) {
      for (int z = -dense/2+diver_z; z < dense/2; z++) {
        pushMatrix();
        translate(gapDis*x, gapDis*y, gapDis*z);
        fill(c1);
        sphere(radius);
        popMatrix();
      }
    }
  }
  saveFrame();
  if (record == true) {
    endRaw();
    record = false;
  }
}

void keyPressed() {
  if (key == 'R' || key == 'r') {
    record = true;
  }
}
