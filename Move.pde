class Move {
  float angle = 0;
  int dir;
  Axis axis;
  int index;
  boolean animating = false;
  boolean finished = false;
  
  Move(Axis axis, int index, int dir) {
      this.axis = axis;
      this.index = index;
      this.dir = dir;
  }   
  
  void start() {
    animating = true;
    finished = false;
  }  
  
  void update() {
    if (animating) {
      angle += dir * 0.1;
      if (abs(angle) > HALF_PI) {
        angle = 0;  
        animating = false;
        finished = true;
        if (abs(this.index) > 0) {
          turn(this.axis,this.index,dir);
        }  
      }  
    } 
  }

  
} 
