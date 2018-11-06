class Spaceship {
  int x = 75;  // x coordinate of where the ship will start
  int y = 700;  // y coordinate  
  int h = 45;  // height of ship
  int w = 27;  // width of ship
  
  // Prototype of the ship of whom the player will be controlling
  void show() {
    fill(0);
    rectMode(CENTER);
    rect(x,y,w,h); //<>//
  }
  
  // This function adds walls into the walls array
  void addWall() {
    Wall_Obstacle obs = new Wall_Obstacle();
    walls.add(obs);
  }
}
