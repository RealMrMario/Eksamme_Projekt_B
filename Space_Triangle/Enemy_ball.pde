class enemy {
  float enemyX;
  float enemyY;
  float enemySize;
  float speedX;
  float speedY;
  float Xdirection;
  float Ydirection;
  boolean isRestarted;

  enemy(float tempX, float tempY, float tempS) {

    enemyX = 0;
    enemyY = 0;
    enemySize = 0;
    enemyX =tempX;
    enemyY = tempY;
    enemySize = tempS;
    speedX = random(-5, 5);
    speedY = random(-5, 5);
    Xdirection = 1;
    Ydirection = 1;
  }
//checker om spillet er genstarted for så skal alle bolde fjernes
  void display() {
    if (!isRestarted);
    ellipseMode(RADIUS);
    ellipse(enemyX, enemyY, enemySize, enemySize);
    //println(enemyX,enemyY);
  }
  void update() {
    //simpel bevægelse for fjenden
    enemyX = enemyX + (speedX * Xdirection);
    enemyY = enemyY + (speedY * Ydirection);
    //gør at fjenden bouncer på væggende 
    if (enemyX > width - enemySize || enemyX < enemySize) {
      Xdirection *= -1;
    }
    if (enemyY > height - enemySize || enemyY < enemySize) {
      Ydirection *= -1;
    }
  }
}
