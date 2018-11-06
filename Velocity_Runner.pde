Spaceship ship;

// The array below will carry information about which walls are going to spawn.
ArrayList<Wall_Obstacle> walls = new ArrayList<Wall_Obstacle>();

void setup() {
  // Sets up the size of the game.
  size(300,800);
  // Creating a class instance for the file to use.
  ship = new Spaceship();
  // Add a wall in the beginning of the game. 
  ship.addWall();
}

void draw() {
  background(255);
  // Create the ship the player will control.
  ship.show();
  
  // This if statement controls how often the walls will spawn.
  if(frameCount % 35 == 0){
    ship.addWall();
  }
    
  // Generate walls the player will dodge
  for(int i = 0; i < walls.size(); i++){
    walls.get(i).obstacle(i+60);
    }
}

// Controls the movement of the ship
void keyPressed() {
  // If the player presses the left key, the ship will move left. The second condition prevents the ship from going offscreen on the left.
  if (keyCode == LEFT && ship.x > 75){
    ship.x -= 150;
  }
  // Same idea as the previous except it controls how the ship will move right.
  if (keyCode == RIGHT && ship.x < width-75){
    ship.x += 150;
  }
}
