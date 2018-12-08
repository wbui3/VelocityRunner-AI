class Spaceship {
  int x = 75;  // x coordinate of where the ship will start
  int y = 700;  // y coordinate

  // ship dimensions
  int h = 45;  // height of ship
  int w = 45;  // width of ship

  int score = 0;
  // Prototype of the ship of whom the player will be controlling
  void show() {
    // Next 3 lines of code was for the placeholder rectangle during early development
    // fill(0);
    // rectMode(CENTER);
    // rect(x,y,w,h);

    // Now we show the spacecship
    imageMode(CENTER);
    image(phantom, x, y, w, h);
  }

  void mutate(){
    image(explosion, x, y, w, h);
  }

  // Note: addWall() function has been moved to the "Velocity_Runner" file. Makes no sense to put that function in the "Spaceship" file :/
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // This is the function for a heuristic AI.
  void dodgingAI(){
    for (int i = 0; i < wallArray.size(); i++){

      // if (obstacle is less than X distance away && obstacle will collide with the ship...)
      if ((ship.y - wallArray.get(i).posY < 100) && wallArray.get(i).posX == 225 && ship.x > 75){   // this is for moving the ship to the left
        ship.x -= 150;
      }
      if ((ship.y - wallArray.get(i).posY < 100) && wallArray.get(i).posX == 75 && ship.x < 225){  // this is for moving the ship to the right
        ship.x += 150;
      }
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void scoreTracker(){
    score++;
  }
}
