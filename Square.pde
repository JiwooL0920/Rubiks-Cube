class Square {
  PMatrix matrix;
  int x = 0;
  int y = 0;
  int z = 0;
  Face[] faces = new Face[6];

  
  //Constructor
   Square(PMatrix3D m, int x1, int y1, int z1) {
     this.matrix = m;
     this.x = x1;
     this.y = y1;
     this.z = z1;
     faces[0] = new Face(new PVector(0,0,-1),color(0,0,255)); //blue face
     faces[1] = new Face(new PVector(0,0,1),color(0,255,0)); //Green
     faces[2] = new Face(new PVector(0,1,0),color(255,255,255)); //white
     faces[3] = new Face(new PVector(0,-1,0),color(255,255,0)); //Yellow
     faces[4] = new Face(new PVector(1,0,0),color(255,150,0)); //orange
     faces[5] = new Face(new PVector(-1,0,0),color(255,0,0)); //red

   }
   
   
   void turnFaces(Axis axis,int dir) {
     for (Face f : faces) {
       f.turn(axis,dir*HALF_PI);
     }
   }
   
   void update(int x, int y, int z) {
      matrix.reset();
      matrix.translate(x,y,z);
      this.x = x;
      this.y = y;
      this.z = z;
   }  
   
   void show() {
     noFill();
     stroke(0);
     strokeWeight(0.1);
     pushMatrix(); //save transformation states
     applyMatrix(matrix);
     box(1);     
     for (Face f : faces) { f.show(); }
     popMatrix(); //restore transformation state
   }   
}  
