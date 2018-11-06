class Wall_Obstacle {
  // posX & posY controls where the walls will spawn.
  float posX;        
  float posY = 30;
  // wallH (height) & wallW (width) controls how big the walls are.
  int wallH = 30;  
  int wallW = 150;
  // int r will control where the wall is going to spawn, the left or right, through a random number generator.
  int r = floor(int(random(2)));
  
  // Moves the walls down at a certain speed.
  void move(float speed) {
    float actualSpeed = speed/10;
    posY += actualSpeed;
  }
  
  // Displays walls on the left.
  void leftWall() {
    posX = 75;
    fill(0);
    rectMode(CENTER);
    rect(posX,posY,wallW,wallH);
  }
  
  // Displays walls on the right
  void rightWall() {
    posX = 225;
    fill(0);
    rectMode(CENTER);
    rect(posX,posY,wallW,wallH);
  }
  
  // Main function
  void obstacle(float speed) {  //<>//
    switch(r){ //<>//
      case 0:
        leftWall();
        move(speed);
        break;
      case 1:
        rightWall();
        move(speed);
        break;
      }
  }  //<>//
}
