

class player {
  //alle variabler til spilleren
  PVector location;
  PVector velocity;
  PVector acceleration;
  PShape shipForm;
  float rotate;
  float heading;
  boolean isAlive = true;
  float shipsize;
  PVector hitboxloc;

  player() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    hitboxloc = new PVector(0,0);
    heading = 0;
    keys = new boolean[5];
// laver formen til skibet
    shipForm = createShape();
    shipForm.beginShape();
    shipForm.fill(255, 0, 0);
    shipForm.strokeWeight(0.5);
    shipForm.vertex(0, -4);
    shipForm.vertex(3, 0);
    shipForm.vertex(3, 3);
    shipForm.vertex(0, 0);
    shipForm.vertex(-3, 3);
    shipForm.vertex(-3, 0);
    shipForm.vertex(0, -4);
    shipForm.endShape();
    shipsize = 20;
  }

  void display() {
    //hvis spilleren lever så skal vi opdatere location og hitbox
    if (!isAlive) return;
    //kalder update for hver frame istaren af display
    update();
    shipForm.resetMatrix();
    shipForm.rotate(radians(heading));
    hitboxloc.x = location.x;
    hitboxloc.y = location.y;
    shape(shipForm, location.x, location.y, 10, 10);
    println(location.x, location.y);
    rectMode(CENTER);
    noFill();
    square(hitboxloc.x, hitboxloc.y, shipsize);
    fill(255);
    println(hitboxloc.x, hitboxloc.y);
  }



  void update() {
    // vi sæætter acceleration til 0 i starten af update så farten ikke bare stiger for evigt. På den måde kan spilleren sænke farten
    acceleration.x = 0;
    acceleration.y= 0;
    //hvis key 0 som er "w" er true så skal acceleration accelererer i retningen af skibet 
    if (keys[0]) {
      acceleration.x = 0.1*cos(radians(heading)-PI/2);
      acceleration.y = 0.1*sin(radians(heading)-PI/2);
    }
    // hvis "a" er true så rotere vi skibet til venstre med 5 pr frame hvor key er trukket ned 
    if (keys[2]) {
      heading -= 5;
    }// samme men til højre hvor "d" er trykket
    if (keys[3]) {
      heading += 5;
    }
    //her tilføjer vi accelerationen til fart
    velocity.add(acceleration);
   //her tilføjer vi farten med acceleration til location
   // dette er med til at få skibet til at bevæge sig
    location.add(velocity);
    //hitboxes, sørger for at spilleren ikke kan flyve ud af spildevinduet. Spillerens x og y værdi må ikke være styre end vindues højde og bredde
    if (hitboxloc.x > 1248) {
      location.x = 1247;
    }
    if (hitboxloc.x < 2) {
      location.x = 3;
    }
    if (hitboxloc.y > 898) {
      location.y = 897;
    }     
    if (hitboxloc.y < 2) {
      location.y = 3;
    }
  }
}
