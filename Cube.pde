import peasy.*;


PeasyCam cam;


int d = 3; //dimension

Square[] cube = new Square[d*d*d];

void setup() {
  size(1000,1000,P3D);
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

int index = 0;

void turnX(int index,int dir)  {
  for (int i = 0; i < cube.length; i++) {
    Square sq = cube[i];
    if (sq.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);  
      matrix.translate(sq.y,sq.z ); 
      sq.update(sq.x,round(matrix.m02),round(matrix.m12));
      sq.turnFacesX(dir);
    }
  }
}

void turnY(int index, int dir)  {
  for (int i = 0; i < cube.length; i++) {
    Square sq = cube[i];
    if (sq.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);  
      matrix.translate(sq.x,sq.z ); 
      sq.update(round(matrix.m02),sq.y,round(matrix.m12)); 
      sq.turnFacesY(dir);
    }
  }
}

void turnZ(int index, int dir)  {
  for (int i = 0; i < cube.length; i++) {
    Square sq = cube[i];
    if (sq.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);  
      matrix.translate(sq.x,sq.y); 
      sq.update(round(matrix.m02),round(matrix.m12),sq.z); 
      sq.turnFacesZ(dir);
    }
  }
}

void keyPressed() {
  switch (key) {
    case 'b': //back
      turnZ(-1,1);
      break;
    case 'B': //back prime
      turnZ(-1,-1);
      break;
    case 'g': //front
      turnZ(1,1);
      break;
    case 'G': //front prime
      turnZ(1,-1);
      turnY(-1,-1);
    case 'y': //up
      turnY(-1,1);
      break;
    case 'Y': //up prime
      turnY(-1,-1);
      break;      
    case 'w': //down
      turnY(1,1);
      break;
    case 'W': //down prime
      turnY(1,-1);
      break;      
    case 'r': //left
      turnX(-1,1);
      break; 
    case 'R': //left prime
      turnX(-1,-1);
      break;       
    case 'o': //right
      turnX(1,1);
      break;
    case 'O': //right prime
      turnX(1,-1);
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
