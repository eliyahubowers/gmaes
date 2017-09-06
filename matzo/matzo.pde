//pictiures
PImage black;
PImage page1; 
PImage clive;
//variables:
static int x;     // positions
int y = 50;
//dont mess with!!{{
int Y = 250;
static int w, h;     // dimensions
static int ww, hh;   // radii
static int gw, gh;   // canvas - radii
//}}
//obstacles position
float s = random(900);
int d = 870;
//timers
int startTime=-1;
//page number
int page = 0;
 
// Object's constants:
final static byte  SPX  = 10, SPY = 10; // speed movement
final static byte  BOLD = 4;            // border thickness
final static color COLOUR = #0000FF;    // #blue
 
// General constants:
final static byte  FPS = 60;
final static color BG  = #FFFF00;       // #yellow
 
// General boolean variables:
static boolean north, south, west, east;
 
static final void initVars(int wdt, int hgt) {
  x = wdt>>1;    // center of screen
  
   w = wdt/10;    // 1/10th size of screen
  h = hgt/10;
 
  ww = w>>1;     // distances from center (radii)
  hh = h>>1;
 
  gw = wdt - ww; // diff. of (canvas dimensions - obj. radii)
  gh = hgt - hh;
}
 
void setup() {
   black = loadImage("black.jpg");
   page1 = loadImage("Matzah_fall_home.jpg");
   clive = loadImage("Clive_the_instagram_snail.jpg");
  size(800, 800);
  smooth();            // turn on drawing smoothness
  frameRate(FPS);      // set frames / second
 
  rectMode(CENTER);    // coordinates are relative from center
  ellipseMode(CENTER);
 
  initVars(width, height);
}
 
void draw() {///////////////////////////////////////////////////////////////////////
if(page==0){
   image(page1,0,0,800,800);  
   image(clive,0,160,120,120);
}
if(page==1){
background(BG);
}
 if(x == 450){
  fill(0);
 }
 if(page==3){//------------------------this is the game part of the game{
   background(BG);
 fill(250);
  moveObject();
  confineToEdges();
  displayObject();
  fill(150);
  rect(x,y-140,20,200);
  ellipse(x,y,70,90);
    //-----
     image(black,s-75,d-75,150,150);
  d-=10;
  if(d<0){
    d = 800;
    s = random(800);
  }
  if(d+100>Y+5 && d-100 <Y-5 && s+100>x+5 && s-100<x-5){
    Y-=50;
    d=870;
    s = random(800);
    }
    //------
  if(Y<=y){ 
    page = 5;
  } }//-------------------------------------}game part of game
  if(page == 5){
fill(250,0,0);
textSize(100);
text("Game Over ",600,200, 800, 300);
fill(250);
textSize(50);
text("click to restart",670,530, 800, 300);
textAlign(CENTER, 450);
text("you got eaten after " +  ((millis()-startTime)/1000) + " seconds",450,450, 1000, 300);
noLoop();
  }
}//--------|
 void mouseClicked() {
  println(mouseX,mouseY);
  if(page==0 && mouseX < 593 && mouseX > 231 && mouseY < 64 ){
    link("https://forum.processing.org/one/topic/link-opening-hundreds-of-web-pages.html");
  }
  if(page==0 && mouseX < 775 && mouseX > 28 && mouseY < 701 && mouseY > 656){
    page = 3;
    startTime = millis();
  }
  if(page == 0 &&  mouseX < 478 && mouseX > 340 && mouseY < 794 && mouseY > 758){
  page = 1; 
  }
  println(mouseX,mouseY);  
}/////////////////////////////////////////////////////////////////////////////
void keyPressed() {
  final int k = keyCode;
   setDirection(k, true);
}
 
void keyReleased() {
  setDirection(keyCode, false);
}
 
static final void setDirection(int k, boolean decision) {
       if (k == LEFT  | k == 'A')   west  = decision;
  else if (k == RIGHT | k == 'D')   east  = decision;
}
 
static final void moveObject() {
  x += (east?  SPX : 0) - (west?  SPX : 0);
}
 
static final void confineToEdges() {
  x = constrain(x, ww, gw);
}
 
void displayObject() {
   ellipse(x, Y, w, h);
}