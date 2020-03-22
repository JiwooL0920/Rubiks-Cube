class Stopwatch {
  float time;
  float startTime;
  
  //Constructor for timer object
  Stopwatch (float init) {
    this.time = init;
  }
  
  //Getter for time 
  float getTime() {
    return this.time; 
  }  
  
  //Setter for time
  void setTime(float t) {
    this.time = t;
  }
  
  //Update the timer by counting up 
  //Call within draw() function in cube 
  void start() {
    this.time += 1/frameRate;
  }  
}  
