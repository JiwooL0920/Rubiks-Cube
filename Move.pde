class Move {
  float angle = 0;
  int x = 0; //right left
  int y = 0; //up or down
  int z = 0; //front or back 
  int dir;
  boolean animating = false;
  
  Move(int x, int y, int z, int dir) {
      this.x = x;
      this.y = y;
      this.z = z;
      this.dir = dir;
  }   
  
  void start() {
    animating = true;
  }  
  
  
  void update() {
    if (animating) {
      angle += dir * 0.1;
      if (abs(angle) > HALF_PI) {
        angle = 0;  
        animating = false;
        if (abs(x) > 0) {
          turn(Axis.X,x,dir);
        } else if (abs(y) > 0) {
          turn(Axis.Y,y,dir);
        } else if (abs(z) > 0) {
          turn(Axis.Z,z,dir); 
        } 
      }  
    }  
    delay(10);
  } 
    }  
 
