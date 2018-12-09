Spaceship ship;
PImage phantom;
PImage explosion;

// The array below will carry information about which walls are going to spawn.
ArrayList<Wall_Obstacle> wallArray = new ArrayList<Wall_Obstacle>();

// This function adds walls into the walls array
  void addWall() {
    Wall_Obstacle obs = new Wall_Obstacle();
    wallArray.add(obs);
  }

void setup() {
  // Sets up the size of the game.
  size(300,800);
  // Creating a class instance for the file to use.
  ship = new Spaceship();
  // Add a wall in the beginning of the game.
  addWall();

  phantom = loadImage("phantom000.png");           // loads the spaceship image, but doesn't SHOW it
  explosion = loadImage("fireFlare000.png");       // loads the explosion image, but doesn't SHOW it
}

void draw() {
  background(255);
  ship.show();          // Create the ship the player will control.
 
  // Displays the score
  textSize(15);
  text("current Score: " + ship.score, 10, 15);

  // This if statement controls how often the walls will spawn.
  if(frameCount % 35 == 0){
    addWall();
    ship.scoreTracker();
  }

  // Generate walls the player will dodge
  for(int i = 0; i < wallArray.size(); i++){
    wallArray.get(i).obstacle(i+60);

    int shipX = ship.x;
    int shipY = ship.y;
    float wallX = wallArray.get(i).posX;
    float wallY = wallArray.get(i).posY;

    // This if statement will check to see if the ship has collided with a wall.
    if(wallArray.get(i).collide(shipX, shipY, wallX, wallY)){
      noLoop();
      ship.mutate();
      textSize(40);
      text("GAME OVER", 50, 400);
    }
  }
  // Calling the AI function
  //ship.dodgingAI();
}

// Controls for the Human player to use
void keyPressed() {

  // If the player presses the left key, the ship will move left. The second condition prevents the ship from going offscreen on the left.
  if (keyCode == LEFT && ship.x > 75){
    ship.x -= 150;
  }
  // Same idea as the previous except it controls how the ship will move right.
  if (keyCode == RIGHT && ship.x < width-75){
    ship.x += 150;
  }
  if (keyCode == ' '){        // Pressing the spacebar will pause the game
    noLoop();
  }
   if (key == 'u'){          // Pressing the 'u' button will UNpause the game
    loop();
  }
  if (key == 'm'){          // Press 'm' to self-destruct
    noLoop();
    ship.mutate();
  }
}
