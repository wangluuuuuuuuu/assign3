
//declare variables

PImage HPImg;
PImage enemyImg;
PImage fighterImg;
PImage treasureImg;
PImage bg1Img,bg2Img;
PImage start1Img,start2Img;
PImage end1Img,end2Img;

int enemyNum=5;
int spacing = width/2/enemyNum;



boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

final int START_PAGE=0;
final int GAME_BEGIN=2;
final int GAME_OVER=3;

final int GAME_INITIALIZATION=1;//to reinvent new position of bloodbar and fighter
int game;
int x=floor(random(150)) ;
int treasurex=floor(random(610));
int treasurey=floor(random(450));

int a=4;
int b=-640;
int i ;

boolean isPlaying=false;
boolean startImgDark=true;
boolean startImgShine=false;

int fighterX=600;
int fighterY=320;

int enemyX=1;
int enemyY;
//int enemyY=floor(random(480));
int enemyWidth=50;


boolean endPicDark=true;
boolean endPicShine=false;
void setup()
{
  
  size(640,480);
//load image
  HPImg=loadImage("img/hp.png");
  enemyImg=loadImage("img/enemy.png");
  fighterImg=loadImage("img/fighter.png");
  treasureImg=loadImage("img/treasure.png");
  bg1Img=loadImage("img/bg1.png");
  bg2Img=loadImage("img/bg2.png");
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png");
  end1Img=loadImage("img/end1.png");
  end2Img=loadImage("img/end2.png");
  

 }

void draw()

{
/*  //GAME SITUATION  
 if (isPlaying==false)
 {
   
  image(start2Img,0,0);
  if(mouseX<500&&mouseX>200||mouseY<380&&mouseY>400)
  {
  image(start1Img,0,0);
  image(start2Img,-1000,0);
  }


  } 
*/


switch(game){
  



case START_PAGE://0

  if(startImgDark){
  image(start2Img,0,0);}
   if(mouseX<=490 && mouseX>=200 && mouseY>=380 && mouseY<=420){
     startImgDark=false;
     startImgShine=true;
     if (startImgShine){
     image(start1Img,0,0);
     image(start2Img,-1000,0);}
    if(mousePressed){
    game=1;
   }
   else{startImgDark=true;}
   }
  
  

      
  
 /* image(start2Img,0,0);
  if(mouseX<=500 && mouseX>=200 && mouseY<=380 && mouseY>=400)
  {
    image(start1Img,0,0);
    image(start2Img,-640,0);
    if(mousePressed){
    game=GAME_START;
  }*/
  
  

break  ;



case GAME_INITIALIZATION://1
image(bg1Img,0,0);
fighterX=600;
fighterY=320;

enemyX=1;
//blood bar
  rectMode(CORNERS);
  rect(15,13,15+x,20);
  noStroke();
  colorMode(RGB);
  fill(255,0,0,190);
  
  image(HPImg,0,0); 
  game=2;
  

break;

case GAME_BEGIN://2
//mouse moves the fighter

if(upPressed){fighterY-=2;}
if(downPressed){fighterY+=2;}
if(fighterY>height-50){fighterY=height-50;}
if (leftPressed){fighterX-=2;}
if(rightPressed){fighterX+=2;}
if(fighterX>width-50){fighterX=width-50;}
if(fighterX<0){fighterX=0;}
if(fighterY<0){fighterY=0;}



//bg1 position
  image(bg1Img,a,0);
//bg2 position
  image(bg2Img,b,0);
  
  rectMode(CORNERS);
  rect(15,13,15+x,20);
  noStroke();
  colorMode(RGB);
  fill(255,0,0,190);
  
  image(HPImg,0,0); 
  
  
  //position of img    
//  image(enemyImg,enemyX,enemyY);
  image(treasureImg,treasurex,treasurey);
  image(fighterImg,fighterX,fighterY);
  image(end1Img,-640,0);
  image(end2Img,-640,0);
  
  
//enemy's position's variable


enemyX+=2 ;
enemyX%=900; 

for (int i = 0 ; i <5 ;i ++){
float enemyNewPos=enemyX-enemyWidth*i;
image(enemyImg,enemyNewPos,enemyY);

 if (enemyX==899){
 enemyY=floor(random(300));
 }
 
}

//for(int j = 0 ;j <5;j+=3){float enemyY-=j;} 
 

//background img bg1 positon variable
if (a<638){
 a+=2;
 a%=width;}
 else
 {
   a=-640;
 }
 
//background img bg2 position variable
if (b<638){
b+=2;
b%=width;
}
else
{
  b=-640;
}
break;
//fighter touches the enemy and causes GAME OVER
// || enemyY<=fighterY+10 && enemyY>=fighterY-10

/*if ( enemyX+10>=fighterX)
{
  if( enemyY<=fighterY+20 || enemyY>=fighterY-20)
{game=3;}
else{game=2;}
}
break;
*/




case GAME_OVER://3
if(endPicDark){
image(end2Img,0,0);
}
if(mouseX<=500 && mouseX>=200 && mouseY>=320 && mouseY<=340)
{ 
endPicDark=false;
endPicShine=true;
if(endPicShine){
  image(end1Img,0,0);
    if(mousePressed)
    {
      game=1;
    }
else
{endPicDark=true;}
 }
}
break;
 


}
}

//  image(fighterImg,fighterX,mouseY);

void mousePressed(){
  //GAME START
  isPlaying=true;
}


void keyPressed(){
if(key==CODED){
switch(keyCode){
  case UP :
  upPressed=true;
  break;

case DOWN:
downPressed=true;
break;

case LEFT:
leftPressed=true;
break;

case RIGHT:
rightPressed=true;
break;

}
}
  
}

/*  if(fighterY>=480)
{
  fighterY=480;
}
if(fighterY<=0)
{
  fighterY=0;
}
if(fighterX<=0)
{
fighterX=0;
}

if(fighterX>=640)
{
fighterX=640;
}
if (key==CODED)
{if(keyCode==UP){
  fighterY-=5;
}
}
if(key==CODED){
if(keyCode==DOWN){
  fighterY+=5;

}
}

if(key==CODED)
{if(keyCode==LEFT)
{fighterX-=5;
}
if(key==CODED)
{if(keyCode==RIGHT)
{fighterX+=5;
}
}
}
*/
void keyReleased(){
if(key==CODED){
switch(keyCode){
  case UP :
  upPressed=false;
  break;

case DOWN:
downPressed=false;
break;

case LEFT:
leftPressed=false;
break;

case RIGHT:
rightPressed=false;
break;

}
}
}
