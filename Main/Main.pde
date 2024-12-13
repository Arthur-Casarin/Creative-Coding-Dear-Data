/* 
  Creative Coding: Dear Data - Arthur Casarin
  The data I recorded is of many aspects of matches of the game:
  "Plants vs. Zombies™ Garden Warfare 2"
  where I played and recorded one match a day. This version of the program currently uses
  7 days of that data, but the code is written to be suited for more to be added in the future.
  In this code, the term "Vanquish" refer to when a player character in the game is 
  defeated temporarily.
*/

// Raw data which will have each row in a single element
String[] fullData;
// Will contain the same data as above, but with every cell split in order
// to manipulate the individual data items
String[][] splitData; 

// Hold position of next symbol to be drawn
int posX;
int posY;


// Calculated in the excel, how well I did using my vanquishes, assisted vanquishes
// (meaning vanquishes I did not get the final hit on) and times vanquished by an enemy
float matchPerformance; 
// How close the match was, calculated differently based on the game mode of the match
float matchIntensity;
// The game mode of the match or in other words, the main objective
String matchType;
// If my team won the match or not
boolean win;
// Scores for ally team and enemy team respectively
int allyScore;
int enemyScore;

// Which symbol to draw next, not initialised to 0 as first row in excel are headings
int currentSymbol = 1;

// Symbol objects created outside setup() as they need to be used in draw().
Symbol match1;
Symbol match2;
Symbol match3;
Symbol match4;
Symbol match5;
Symbol match6;
Symbol match7;

void setup() {
  // General setup
  rectMode(CENTER);
  size(1800,1000);
  background(230);
  
  // For current version, there is only 1 week of data, but
  // posY would be calculated for each week if more data is added.
  posY = height/2;
  // If more data from the videos is to be added to the excel sheet, increment 
  // value below to new amount of columns.
  int dataValuesNum = 15;
  
  fullData = loadStrings("Dear Data - Data.csv");
  splitData = new String[fullData.length][dataValuesNum];
  
  // Iterates through data and adds each individual cell to "splitData"
  for (int i=0; i<fullData.length; i++) {
    String[] tempData = split(fullData[i], ",");
    
    for (int j=0; j<dataValuesNum; j++) {
      splitData[i][j] = tempData[j];
    }
  }
  
  // Initialises Symbol objects with the data needed.
  match1 = new Symbol(float(splitData[1][6]), splitData[1][14], boolean(int(splitData[1][7])), int(splitData[1][4]), int(splitData[1][5]));
  match2 = new Symbol(float(splitData[2][6]), splitData[2][14], boolean(int(splitData[2][7])), int(splitData[2][4]), int(splitData[2][5]));
  match3 = new Symbol(float(splitData[3][6]), splitData[3][14], boolean(int(splitData[3][7])), int(splitData[3][4]), int(splitData[3][5]));
  match4 = new Symbol(float(splitData[4][6]), splitData[4][14], boolean(int(splitData[4][7])), int(splitData[4][4]), int(splitData[4][5]));
  match5 = new Symbol(float(splitData[5][6]), splitData[5][14], boolean(int(splitData[5][7])), int(splitData[5][4]), int(splitData[5][5]));
  match6 = new Symbol(float(splitData[6][6]), splitData[6][14], boolean(int(splitData[6][7])), int(splitData[6][4]), int(splitData[6][5]));
  match7 = new Symbol(float(splitData[7][6]), splitData[7][14], boolean(int(splitData[7][7])), int(splitData[7][4]), int(splitData[7][5]));
}

void draw() {
  match1.drawSymbol();
  match2.drawSymbol();
  match3.drawSymbol();
  match4.drawSymbol();
  match5.drawSymbol();
  match6.drawSymbol();
  match7.drawSymbol();
}
