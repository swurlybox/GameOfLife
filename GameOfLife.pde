import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
public int NUM_ROWS = 50;
public int NUM_COLS = 50;
private Life[][] buttons; //2d array of Life buttons each representing one cell
private boolean[][] buffer; //2d array of booleans to store state of buttons array
private boolean running = true; //used to start and stop program

public void setup () {
  size(1000, 1000);
  frameRate(10);
  // make the manager
  Interactive.make( this );

  //your code to initialize buttons goes here
  buttons = new Life[NUM_ROWS][NUM_COLS];
  for(int j = 0; j < NUM_ROWS; j++){
    for(int i = 0; i < NUM_COLS; i++){
      buttons[j][i] = new Life(j,i);
      
    }
  }
  //your code to initialize buffer goes here
  buffer = new boolean[NUM_ROWS][NUM_COLS];
}

public void draw () {
  background( 0 );
  if (running == false){ //pause the program
    return;
  }
  copyFromButtonsToBuffer();

  //use nested loops to draw the buttons here
  for(int j = 0; j < NUM_ROWS; j++){
    for(int i = 0; i < NUM_COLS; i++){
      if(countNeighbors(j,i) == 3){
        buffer[j][i] = true;
      }
      else if(countNeighbors(j,i) == 2 && buttons[j][i].getLife() == true){
        buffer[j][i] = true;
      }
      else{
        buffer[j][i] = false;
      }
      buttons[j][i].draw();
    }
  }
  copyFromBufferToButtons();
}

public void keyPressed() {
  //your code here
  running = !running;
}

public void copyFromBufferToButtons() {
  //your code here
  for(int j = 0; j < NUM_ROWS; j++){
    for(int i = 0; i < NUM_COLS; i++){
      if(buffer[j][i] == true){
        buttons[j][i].setLife(true);
      }
      else if(buffer[j][i] == false){
      buttons[j][i].setLife(false);
      }
    }
  }
}

public void copyFromButtonsToBuffer() {
  //your code here
  for(int j = 0; j < NUM_ROWS; j++){
    for(int i = 0; i < NUM_COLS; i++){
      if(buttons[j][i].getLife() == true){
        buffer[j][i] = true;
      }
      else{
        buffer[j][i] = false;
      }
    }
  }
}

public boolean isValid(int r, int c) {
  //your code here
  if(r >= 0 && r < NUM_ROWS && c >= 0 && c < NUM_COLS){
    return true;
  }
  else{
  return false;
  }
}

public int countNeighbors(int row, int col) {
  int neighbors = 0;
  //your code here
  
                      //top left neighbor
  if(isValid(row - 1,col - 1) == true){
    if(buttons[row - 1][col - 1].getLife() == true){
      neighbors = neighbors + 1;
    } 
  }
  
                      //top neighbor
  if(isValid(row - 1,col) == true){
    if(buttons[row - 1][col].getLife() == true){
      neighbors = neighbors + 1;
    } 
  }
  
                      //top right neighbor
  if(isValid(row - 1,col + 1) == true){
    if(buttons[row - 1][col + 1].getLife() == true){
      neighbors = neighbors + 1;
    } 
  }
  
                      //left neighbor
  if(isValid(row,col - 1) == true){
    if(buttons[row][col - 1].getLife() == true){
      neighbors = neighbors + 1;
    } 
  }
  
                      //right neighbor
  if(isValid(row,col + 1) == true){
    if(buttons[row][col + 1].getLife() == true){
      neighbors = neighbors + 1;
    } 
  }
  
                      //bottom left neighbor
  if(isValid(row + 1,col - 1) == true){
    if(buttons[row + 1][col - 1].getLife() == true){
      neighbors = neighbors + 1;
    } 
  }
  
                      //bottom neighbor
  if(isValid(row + 1,col) == true){
    if(buttons[row + 1][col].getLife() == true){
      neighbors = neighbors + 1;
    } 
  }
  
                      //bottom right neighbor
  if(isValid(row + 1,col + 1) == true){
    if(buttons[row + 1][col + 1].getLife() == true){
      neighbors = neighbors + 1;
    } 
  }
  return neighbors;
}

public class Life {
  private int myRow, myCol;
  private float x, y, width, height;
  private boolean alive;

  public Life (int row, int col) {
    width = 1000/NUM_COLS;
    height = 1000/NUM_ROWS;
    myRow = row;
    myCol = col; 
    x = myCol*width;
    y = myRow*height;
    alive = Math.random() < .5; // 50/50 chance cell will be alive
    Interactive.add( this ); // register it with the manager
  }

  // called by manager
  public void mousePressed () {
    alive = !alive; //turn cell on and off with mouse press
  }
  public void draw () {    
    if (alive != true)
      fill(0);
    else 
      fill( 150 );
    rect(x, y, width, height);
  }
  public boolean getLife() {
    //replace the code one line below with your code
    if(alive){
      return true;
    }
    else{
    return false;
    }
  }
  public void setLife(boolean living) {
    //your code here
    if(living == true){
      alive = true;
    }
    else{
    alive = false;
    }
  }
}
