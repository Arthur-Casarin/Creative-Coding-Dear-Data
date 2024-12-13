class Symbol {
  // Variables below are used in the drawing logic and hold a specific data item of the excel.
  // Description above each.

  // Calculated in the excel, how well I did considering my vanquishes, assisted vanquishes
  // (meaning vanquishes I did not get the final hit on) and times vanquished by an enemy.
  private float matchPerformance; 
  // How close the match was, calculated differently based on the game mode of the match.
  private float matchIntensity;
  // The game mode of the match or in other words, the main objective.
  private String matchType;
  // If my team won or not.
  private boolean win;
  // Scores for ally team and enemy team respectively.
  private int allyScore;
  private int enemyScore;
  
  // Constructor
  public Symbol(float performance, String type, boolean win, int allyScore, int enemyScore) {
    matchPerformance = performance;
    matchType = type;
    this.win = win;
    this.allyScore = allyScore;
    this.enemyScore = enemyScore;
  }
  
  // Drawing logic
  public void drawSymbol() {
    // x position split between 7 points equally spaced to represent each day
    posX = (currentSymbol-1)%7*width/7 + width/14;
    
    matchIntensity = 100/abs(allyScore - enemyScore);
    // Scores in "Herbal Assault" and "Gardens & Graveyards" game mode always add up to 6,
    // meaning a different calculation is used. Time spent in these game modes directly
    // correlates with how close the match was. This is because this game mode is based on 
    // attacking and defending locations and it can end in any of the 6 locations,
    // which is why it is used below in this way
    if (matchType.equals("Herbal Assault") || matchType.equals("Gardens & Graveyards")) {
      matchIntensity = 0.01 *float(splitData[currentSymbol][3]); // <---- Match time
    }
    
    // Thickness of main shape determined by my performance.
    strokeWeight(matchPerformance-1);
  
    // Colour saturation based on how close match was.
    // All matches were played on the plants side so if the match in won, the main
    // shape is green, the plants' colour. If the zombies won instead, 
    // the shape is purple, the zombies' colour.
    if (win) {
      stroke(0, matchIntensity * 40, matchIntensity);
    } else {
      stroke(matchIntensity * 35, 0, matchIntensity * 30);
    }
    noFill();
    
    // Main shape determined by game mode. 
    if (matchType.equals("Herbal Assault")) {
      triangle(posX, posY-100, posX+80, posY+60, posX-80, posY+60);
    } else if (matchType.equals("Gardens & Graveyards")) {
      triangle(posX, posY+100, posX+80, posY-60, posX-80, posY-60);
    } else if (matchType.equals("Suburbination")) {
        circle(posX, posY, 200);
    } else if (matchType.equals("Vanquish Confirmed")) {
      square(posX, posY, 140);
    } else if (matchType.equals("Team Vanquish")) {
      quad(posX, posY-100, posX-100, posY, posX, posY+100, posX+100, posY);
    } else if (matchType.equals("Gnome Bomb")) {
      line(posX+100, posY, posX-100, posY);
      line(posX, posY+100, posX, posY-100);
    } 
    
    // Increments value so the next symbol is in the right position
    currentSymbol = (currentSymbol)%7 +1;
  }
}
