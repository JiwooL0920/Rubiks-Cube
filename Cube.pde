import peasy.*;
PeasyCam cam; //for mouse driven camera control
Stopwatch myWatch;

boolean start = false;
boolean madeMove = false;

//Move currentMove;
Move currentMove = new Move(0,0,1,1); //initialize to something or else error in draw

enum Axis {
  X,
  Y,
  Z
}  

Square[] cube = new Square[27];

Move[] moves = new Move[] {
  new Move(0,1,0,1), //U
  new Move(0,1,0,-1), //U'
  new Move(0,-1,0,1), //D
  new Move(0,-1,0,-1), //D'
  new Move(1,0,0,1), //L
  new Move(1,0,0,-1), //L'
  new Move(-1,0,0,1), //R
  new Move(-1,0,0,-1), //R'
  new Move(0,0,1,1), //F
  new Move(0,0,1,-1), //F'
  new Move(0,0,-1,1), //B
  new Move(0,0,-1,-1) //B'
};

void setUpText() {
  textSize(64);
  myWatch = new Stopwatch(10); 
}
    
void setup() {
  size(600,600,P3D);
  cam = new PeasyCam(this,400);
  setUpText();
  init();
} 

void init() {
  int index = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {   
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x,y,z);
        cube[index] = new Square(matrix,x,y,z);
        index++;
      }  
    }
  } 
}  

void turn(Axis axis, int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Square sq = cube[i];
    PMatrix2D matrix = new PMatrix2D();
    matrix.rotate(dir*HALF_PI);
    switch (axis) {
      case X:
        if (sq.x == index) {
           matrix.translate(sq.y,sq.z ); 
           sq.update(sq.x,round(matrix.m02),round(matrix.m12));
           sq.turnFaces(axis,dir);
        } 
        break;
      case Y:
        if (sq.y == index) { 
        matrix.translate(sq.x,sq.z ); 
        sq.update(round(matrix.m02),sq.y,round(matrix.m12)); 
        sq.turnFaces(axis,dir);
        }
        break;
      case Z:
        if (sq.z == index) {
          matrix.rotate(dir*HALF_PI);  
          matrix.translate(sq.x,sq.y); 
          sq.turnFaces(axis,dir);
        }
        break;
    }
  }  
}  


    
void keyPressed() {
  madeMove = true;
  switch (key) {
    case 'q': //back
      currentMove = moves[11];
      currentMove.start();
      break;
    case 'Q': //back prime
      currentMove = moves[10];
      currentMove.start();
      break;
    case 'w': //front
      currentMove = moves[8];
      currentMove.start();
      break;
    case 'W': //front prime
      currentMove = moves[9];
      currentMove.start();
      break;
    case 'e': //up
      currentMove = moves[2];
      currentMove.start();
      break;
    case 'E': //up prime
      currentMove = moves[3];
      currentMove.start();
      break;      
    case 'a': //down
      currentMove = moves[1];
      currentMove.start();
      break;
    case 'A': //down prime
      currentMove = moves[0];
      currentMove.start();    
      break;      
    case 's': //left
      currentMove = moves[7];
      currentMove.start();
      break; 
    case 'S': //left prime
      currentMove = moves[6];
      currentMove.start();
      break;       
    case 'd': //right
      currentMove = moves[4];
      currentMove.start();
      break;
    case 'D': //right prime
      currentMove = moves[5];
      currentMove.start();
      break;    
    case '1': //restart
      init();
      break;
    case '2': //start
      currentMove.start();
      break;
  }  
}

void draw() {
  background(50);
  
  //Text messages
  cam.beginHUD();
  fill(255);
  textSize(15);
  text("Key Commands", 10, 40);
  text("1 = Start", 10, 60);
  text("2 = Restart", 10, 80);
  text("q = rotate blue", 10, 120);
  text("w = rotate green", 10, 140);
  text("e = rotate yellow", 10, 160);
  text("a = rotate white", 10, 180);
  text("s = rotate red", 10, 200);
  text("d = rotate orange", 10, 220);
  text("shift+q|w|e|a|s|d \n= counterclockwise", 10, 260);
  cam.endHUD();
  
  scale(50);
  currentMove.update();
  for (int i = 0; i < cube.length; i++) {
    push();
    if (madeMove) {
      if (abs(cube[i].x) > 0 && cube[i].x == currentMove.x) {
        rotateX(currentMove.angle);
      } else if (abs(cube[i].y) > 0 && cube[i].y == currentMove.y) {
        rotateY(-currentMove.angle);
      } else if (abs(cube[i].z) > 0 && cube[i].z == currentMove.z) {
        rotateZ(currentMove.angle );
      }  
    }   
    cube[i].show();
    pop();
  }
 
  
  //if (start) {
  //  text(myWatch.start(),-20,200);
  //}

}
