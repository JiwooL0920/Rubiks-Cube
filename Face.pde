class Face {
  PVector normal;
  color c;
  Face(PVector normal, color c) {
    this.normal = normal;
    this.c = c; 
  }  
  
  void turn(Axis axis, float angle) {
    PVector newV = new PVector();
    switch (axis) {
      case X:
        newV.y = round(normal.y * cos(angle) - normal.z * sin(angle));
        newV.z = round(normal.y * sin(angle) + normal.z * cos(angle));
        newV.x = round(normal.x);
        break;
      case Y:
        newV.x = round(normal.x * cos(angle) - normal.z * sin(angle));
        newV.z = round(normal.x * sin(angle) + normal.z * cos(angle));
        newV.y = round(normal.y);
        break;
      case Z:
        newV.x = round(normal.x * cos(angle) - normal.y * sin(angle));
        newV.y = round(normal.x * sin(angle) + normal.y * cos(angle));
        newV.z = round(normal.z);
        break;
    }  
    normal = newV;
  }  
 
  
  void show() {
    pushMatrix();
    fill(c);
    noStroke();
    rectMode(CENTER);
    translate(0.5*normal.x,0.5*normal.y,0.5*normal.z);
    if (abs(normal.x) > 0) {
      rotateY(HALF_PI);
    }  else if (abs(normal.y) > 0) {
      rotateX(HALF_PI);
    }  
    square(0,0,1);
    popMatrix();
  }
}
