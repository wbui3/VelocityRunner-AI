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
    float actualSpeed = speed/3;      // originally 10, not 3
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
  void obstacle(float speed) {
    switch(r){
      case 0:
        leftWall();
        move(speed);
        break;
      case 1:
        rightWall();
        move(speed);
        break;
      }
  }

  // This function will determine if the ship has collided with a wall
  boolean collide(int spaceX, int spaceY, float wallX, float wallY) {
    // wallYRange variable is needed as the wall still extends up by the amount determined by wallH
    float wallYRange = wallY + wallH;
    // Function will first check if the ship and wall are on the same x coordinate.
    if (spaceX == wallX){
       // If the ship is within the wall's y coordinate (along with being within its x coordinate), the ship has indeed collided with the wall and this function will return true.
       if ( spaceY  >= wallY && spaceY <= wallYRange) {
         return true;
       }
       else {
         return false;
       }
    }
    else {
       return false;
    }
  }
}
