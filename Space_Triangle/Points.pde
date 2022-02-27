

class point {
  PVector pLocation;
  float pointSize;
  boolean isNotCollected = true;
  //har nogle midlertidlige værdier så der kan skabes flere af dem og tilføje dem til en arraylist
  point(float tempX, float tempY, float tempS) {
    pLocation = new PVector(0, 0);
    pointSize = tempS;
    pLocation.x = tempX;
    pLocation.y = tempY;
  }



  void display() {
    //hvis den ikke er collected så tegn firkant.
    if (!isNotCollected) return;
    square(pLocation.x, pLocation.y, pointSize);
  }
}
