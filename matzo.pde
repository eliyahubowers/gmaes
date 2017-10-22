//pictiures
PImage page0;
PImage playing;
PImage fridge;
PImage death;

PImage clive;

PImage carrot;
PImage leg;
PImage turnip;

PImage normal;
//-
static int x;     //matzo positions
int Y = 50;       //ladle position
//dont mess with!!{{
int y = 210;    //matzo positions
static int w, h;     // dimensions
static int ww, hh;   // radii
static int gw, gh;   // canvas - radii
//}}
//obstacles position
float Carrotx = random(700)+50;
int Carroty = 850;
float Lx = random(700)+50; 
int Ly = 870;
float Tx = random(700)+50; 
int Ty = 800;
//timers
int startTime=-1;
//page number
int page = 0;
// white = transparent
int i;
int wi;
int hi;
//speed of object;
float speed = 5;
// Object's constants:
final static byte  SPX  = 30 ; // speed movement
final static byte  BOLD = 4;            // border thickness
final static color COLOUR = #0000FF;    // #blue
 
// General constants:
final static byte  FPS = 60;
 
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
   page0 = loadImage("Matzah_fall_home.jpg");
   death = loadImage("Untitled_Artwork.png");
   fridge = loadImage("The_fridge.png");   
   playing = loadImage("g_back.png");
   
   clive = loadImage("Clive_the_instagram_snail.jpg");
   
   normal = loadImage("Matzah_ball.png");
   
   carrot = loadImage("Carrot.png");
   leg = loadImage("Chicken_leg.png");
   turnip = loadImage("Radish.png");
  size(800, 800);
  smooth();            // turn on drawing smoothness
  frameRate(FPS);      // set frames / second
  ellipseMode(CENTER);   // coordinates are relative from center

 loadPixels();
  initVars(width, height);
}
void draw() {//////////////////////////////////////////////////////////////////////
if(page==0){
int ii = 0;
if(ii == 0){
image(page0,0,0,800,800);
ii ++;
}
ii = 11;
}
if(page==1){
  page1();
}
 if(page==3){
   speed+=.002;
   page3();
  } 
 if(page == 4){
   String time = ""+((millis()-startTime)/1000);
   int xxx = 355;
   int xofput = time.length();
   if(xofput == 1){
   xxx = 413;}
   if(xofput == 2){
   xxx = 389;}
   if(xofput == 3){
   xxx = 371;}
   if(xofput == 4){
   xxx = 355;}
image(death,0,0,800,800);
fill(250,0,0);
textSize(20);
text(time ,xxx,410, 1000, 300);
noLoop();
  }
}//--------|
 void mouseClicked() {
  if(page==0 && mouseX < 775 && mouseX > 28 && mouseY < 701 && mouseY > 656){
    page = 3;
    startTime = millis();
  }
  //to fridge
  if(page == 0 &&  mouseX < 478 && mouseX > 340 && mouseY < 794 && mouseY > 758){
  page = 1; 
  }
  println(mouseX,mouseY);  
}/////////////////////////////////////////////////////////////////////////////
void page1(){
  image(fridge,0,0,800,800);
}
void page3(){
 image(playing,0,0,800,800);
 fill(250);
 for(int ii = 0; ii <= 2; ii++){
  moveObject();
  confineToEdges();
  displayObject();
  fill(150);
  rect(x+30,Y-200,20,200);
  ellipse(x+40,Y,70,90);
    //-----
     image(carrot,Carrotx-25,Carroty-32,50,75);
  Carroty-=speed;
  if(Carroty<0){
    Carroty = 800;
    Carrotx = random(700)+50;
  }
  if(Carrotx-25 < x+w && Carrotx+25 > x-w+100 && Carroty-32 < y+h-8 && Carroty+32 >y-h){
    y-=50;
    Carroty=870;
   Carrotx = random(700)+50;
    }
    //-------
  image(leg,Lx-50,Ly-75,100,150);
  Ly-=speed;
  if(Ly<0){
    Ly = 800;
    Lx = random(800);
  }
  if(Lx-50 < x+w && Lx+50 > x-w+100 && Ly-75 < y+h-8 && Ly+75 >y-h){
    y-=50;
    Ly=870;
    Lx = random(700)+50;
    }
    //------
        image(turnip,Tx-45,Ty-50,90,100);
  Ty-=speed;
  if(Ty<0){
    Ty = 800;
    Tx = random(800);
  }
  if(Tx-45 < x+w && Tx+45 > x-w+100 && Ty-50 < y+h-8 && Ty+50 >y-h){
    y-=50;
    Ty=870;
    Tx = random(800);
    }
    //------
  if(y<=Y){ 
    page = 4;
  }
 }
}
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
   image(normal,x,y,w,h);
}