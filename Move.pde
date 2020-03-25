class Move {
  float angle = 0;
  int dir;
  Axis axis;
  int index;
  final float DEFAULT_SPEED = 0.1;
  final float SHUFFLE_SPEED = 0.2;
  float speed = SHUFFLE_SPEED;
  boolean animating = false;
  boolean finished = false;
  
  Move(Axis axis, int index, int dir) {
      this.axis = axis;
      this.index = index;
      this.dir = dir;
  }   
  
  void changeToShuffleSpeed() {
    this.speed = SHUFFLE_SPEED; 
  }  
  
  void changeToDefaultSpeed() {
     this.speed = DEFAULT_SPEED; 
  }  
  
  void start() {
    animating = true;
    finished = false;
  }  
  
  void update() {
    if (animating) {
      angle += dir * speed;
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
