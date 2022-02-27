//OBS NÅR MAN STARTER SPILLET ER SPILLEREN ØVERST I VENSTRE HJØRNE. MAN SKAL LIGE VRIDE SPILLEREN UD AF DET HJØRNE. ROTER 180* CIRKA
ArrayList<enemy> enemies;
player n1;
int score;
int scoreToAdd;
ArrayList<point> points;
menu menu;
boolean[] keys;

void setup() {
  size(1250, 900);
  background(0);
// Vi laver nogle arraylist af points og fjender og tilføjer nogle andre ting som spillere og menuer
  n1 = new player();
  points = new ArrayList<point>();
  points.add(new point(random(50, 1200), random(50, 850), random(20, 30)));
  enemies  = new ArrayList<enemy>();
  enemies.add(new enemy(width/2, height/2, random(28, 48)));
  menu = new menu();

  score = 0;
  scoreToAdd +=2;
}

void draw() {
  clear();
  //hvis menu er et skal vi gøre den ene del af programmet ellers den anden del
  if (menu.page == 1) {
    menu.display();
  }
  if (menu.page == 0) {
    n1.display();

//viser ens score
    textSize(25);
    text("score:" + score, 1140, 40);
//går igennem array listen, checker om spilleren har rørt et point og hvis ja, tilføj et point til score, fjern det gamle point og lav et nyt point.
    for (int i = points.size()-1; i >= 0; i--) {
      point _point = points.get(i);
      if (_point.isNotCollected && dist(n1.location.x, n1.location.y, _point.pLocation.x, _point.pLocation.y) < _point.pointSize) {
        _point.isNotCollected = false;
        points.add(new point(random(50, 1200), random(50, 850), random(10, 20)));
        score++;
      } else if (_point.isNotCollected)_point.display();
    }    
//her updater vi enemy og for hver gang spilleren har samlet 2 points så spawner vi en ny fjende
    for (int i = enemies.size()-1; i >= 0; i--) {
      enemy _enemy = enemies.get(i);
      _enemy.display();
      _enemy.update();
      if (score == scoreToAdd) {

        enemies.add(new enemy(width/2, height/2, random(16, 32)));
        scoreToAdd +=2;
      }
      //check hvis spilleren har haft kontakt med spilleren med at se om værdierne fra spilleren og fjenden er mindre en størrelsen på fjenden
      if (n1.isAlive && dist(n1.location.x, n1.location.y, _enemy.enemyX, _enemy.enemyY) < _enemy.enemySize) {
        //så er spilleren ikke i live. 
        n1.isAlive = false;
      }
    }
  }

//hvis spilleren er død så tegn teksten nedeunder
  if (n1.isAlive == false) {
    println(n1.isAlive);
    textAlign(CENTER);
    textSize(125);
    text("GAME OVER", width/2, 450);
    textSize(60);
    text("Press r to restart", width/2, 520);
    textSize(40);
    text("Total score:" + score, width/2, 570);
  }
}

void keyPressed() {
  menu.keyPressed();
  if (key == 'r') {
    n1.isAlive = true;
  }

  if (key == 'w')
    keys[0] = true;
  if (key == 'a')
    keys[2] =true;
  if (key == 'd')
    keys[3] = true;
  if(keyCode == UP)
  keys[0] = true;
  if (keyCode == LEFT)
  keys[2] = true;
  if(keyCode == RIGHT)
  keys[3] = true;

}

void keyReleased() {
  if (key == 'w')
    keys[0] = false;
  if (key == 'a')
    keys[2] = false;
  if (key == 'd')
    keys[3] = false;
  if(keyCode == UP)
  keys[0] = false;
    if (keyCode == LEFT)
  keys[2] = false;
  if(keyCode == RIGHT)
  keys[3] = false;
}
