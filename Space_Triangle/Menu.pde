class menu {

  int page = 1;

  void display() {
//giver ikke så meget mening når det kun er en side, men hvis man skulle lave flere menuer kunne de give mening
    switch(page) {
    case 1:
      frontpage();
      break;
    }
  }
  //hvis 
  void keyPressed() {
    if (key == ' ') page = 0;
//hvis r er trykket nustiller vi alt. Dvs fjerne fjender og nustiller score og scoretoadd og tilføjer en fjende til at starte med
    if (key == 'r'|| key == 'R') { 
      page = 1;
      score = 0;
      enemies.clear();
      enemies.add(new enemy(width/2, height/2, random(16, 32)));
      scoreToAdd = 2;
    }
  }
//hvad der er på front page
  void frontpage() {
    textSize(50);
    textAlign(CENTER);
    text("Space Rush", width/2, 400);
    textSize(30);
    text("Press space to start", width/2, 450);
  }
}
