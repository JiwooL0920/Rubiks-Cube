import peasy.*;
PeasyCam cam; //for mouse driven camera control

enum Axis {
  X,
  Y,
  Z
}  

Square[] cube = new Square[27];

void setup() {
  size(600,600,P3D);
  cam = new PeasyCam(this,400);
  //initialize our cube 
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
           sq.turnFacesX(dir);
        } 
        break;
      case Y:
        if (sq.y == index) { 
        matrix.translate(sq.x,sq.z ); 
        sq.update(round(matrix.m02),sq.y,round(matrix.m12)); 
        sq.turnFacesY(dir);
        }
        break;
      case Z:
        if (sq.z == index) {
          matrix.rotate(dir*HALF_PI);  
          matrix.translate(sq.x,sq.y); 
          sq.turnFacesZ(dir);
        }
        break;
    }
  }  
}  
    
    
void keyPressed() {
  switch (key) {
    case 'b': //back
      turn(Axis.Z,-1,1);
      break;
    case 'B': //back prime
      turn(Axis.Z,-1,-1);
      break;
    case 'g': //front
      turn(Axis.Z,1,1);
      break;
    case 'G': //front prime
      turn(Axis.Z,1,-1);
      turn(Axis.Y,-1,-1);
    case 'y': //up
      turn(Axis.Y,-1,1);
      break;
    case 'Y': //up prime
      turn(Axis.Y,-1,-1);
      break;      
    case 'w': //down
      turn(Axis.Y,1,1);
      break;
    case 'W': //down prime
      turn(Axis.Y,1,-1);
      break;      
    case 'r': //left
      turn(Axis.X,-1,1);
      break; 
    case 'R': //left prime
      turn(Axis.X,-1,-1);
      break;       
    case 'o': //right
      turn(Axis.X,1,1);
      break;
    case 'O': //right prime
      turn(Axis.X,1,-1);
      break;      
  }  
}

void draw() {
  background(50);
  scale(50);
  for (int i = 0; i < cube.length; i++) {
        cube[i].show();
  }
}
