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
      if (angle > HALF_PI) {
        angle = 0;
        animating = false;
      }  
    }  
  } 
    }  
 
