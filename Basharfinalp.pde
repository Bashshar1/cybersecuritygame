
/* By Bashar Atif 
 Started on: January, 9,2019
 Due: January, 23, 2019
 Title: The End of Hackerman!
 The program starts of as a video, using a video clip from the actual movie. Later the startup menu is there. The menu includes three options (to hack, to quit, and instructions).
 If the user selects play the story line advances to hacker man inside to the internet where he goes around hacking computers. 
 After level one he is stopped as the cybersecurity has increased. After, the game is even more difficult….
 After level two, the final level is presented. In the final level hackerman is not able to hack no longer because of protected computers and the cybersecurity police OR the hackerman wins!
 */
import ddf.minim.*;                           //Importing libraries so the video or audio can function
import processing.video.*;
Movie video;                                   // Initailizing the varibales for the video
Movie video2;
int   l, w, level, font;
int state=10;
int x=0, y=390;
float y2= int(random(0, 500)), difx, dify;
float x2= 1200;
float x3 =  1200; 
boolean hitx = false, hity= false;
PImage bill;
PImage menu; 
PImage hack1;
PImage henothappy;
PImage hackcaught;
PImage controls;
PImage background;
PImage kung1;
PImage bender;
PImage robot1;
PImage robot2;
PImage robot3;
PImage robot4;
PImage won;
PImage ohno;
AudioSnippet music;                     //The varibles for the audio
AudioSnippet hackerman2;
AudioSnippet hackerman1;
AudioSnippet robot1b;
AudioSnippet robot2b;
AudioSnippet fill1;
AudioSnippet bill2;



Minim minim;                      //The minim library's instance 

void setup () {  
  size (1280, 700);
  menu = loadImage("menu.jpg");           //Importing Images
  bender = loadImage ("bender.png");
  kung1 = loadImage ("kung1.png");
  background = loadImage ("Background.jpg"); 
  hack1 = loadImage ("hack1.jpg");
  robot1 = loadImage ("robot1.png");
  robot2= loadImage ("robot2.jpg");
  robot3= loadImage ("robot3.jpg");
  robot4= loadImage ("robot4.jpg");
  hackcaught= loadImage ("hackcaught.jpg");
  bill= loadImage ("bill.jpg");
  controls = loadImage ("controls.jpg");
  won=loadImage("won.jpg");
  ohno= loadImage("ohno.jpg");
  PFont Font;                                                            // Importing the font
  Font = loadFont("Monospaced.bold-48.vlw");
  textFont(Font);
  minim= new Minim(this);                                               //A new instance 
  music = minim.loadSnippet("lostyears.wav");
  hackerman2= minim.loadSnippet("hackerman2.wav");
  hackerman1= minim.loadSnippet("hackerman1.wav");
  robot1b= minim.loadSnippet("robot1.wav");
  robot2b= minim.loadSnippet("robot2.wav");
  bill2=minim.loadSnippet("bill2.wav");
  fill1=minim.loadSnippet("fill1.wav");
  // A new instance and getting the video loaded
  video = new Movie(this, "itshackingtime.mov"); 
  video2= new Movie (this, "hackermanisgone.mov");
  w= 150;
  l= 150;
}

void movieEvent(Movie video) {  //This code reads each frame of the video when the image(video,0,0) line is prompted
  if (state==10) {
    video.read();
  }
  if (state==13) {
    video2.read();
  }
}



void keyPressed() {
  //Moves the character up or down.
  if (key == CODED) {                   
    if ((keyCode == UP)&&(y>60)) {
      y=y-60;
      x=x+20;
    }
    //Restarting the game or skipping the video
    if ((keyCode == RIGHT)&&(state!=10)) {
      state =2;
    }  
    if ((keyCode == RIGHT)&&(state==10)) {
      state =1;
      level=0;
    }
    if (keyCode == DOWN) {

      if (y<=  455) {
        y=y+60;
        x=x+20;
      }
    }
  }
}


void draw () {
  if ((mouseButton == LEFT) && (((mouseX > 1131 && (mouseX < 1218)) && ((mouseY > 662 && (mouseY < 676)&&(state==8)))))) {
    //The second transition slide for the final level
    // Transitioning through a slide
    state=4;
  } 

  if ((mouseButton == LEFT) && (((mouseX > 1077 && (mouseX < 1155)) && ((mouseY > 582 && (mouseY < 598)&&(state==11)))))) {
    //The second transition slide for the final level
    // Transitioning through a slide
    state=12;
  } 
  if (state==6) {
    //Transition slide
    fill1.pause();
    robot1b.play();
    image (robot3, 0, 0, 1280, 700);
    fill(0);
    strokeWeight(10);
    rect(0, 413, 900, 500);
    fill(255, 0, 0);
    rect(800, 570, 1000, 598);    
    fill(255);
    strokeWeight(10);
    text ("Don't worry, Mr.Gates,", 0, 430);
    text ( "I'm ganna get him with advanced cybersecurity!", 0, 480);
  }
  if (state==13) {
    bill2.pause();                            
    hackerman2.pause();
    video2.play();
    image(video2, 0, 0);                       // Making the prompt for the video to play
  }
  if (state==11) {
    //A transition slide
    image(ohno, 0, 0, 1280, 700);
    fill(0);
    strokeWeight(10);
    rect(0, 623, 927, 700);
    fill(255);
    text ( "OH NOOO YOU HACKED ALL MY COMPUTERS!!!", 0, 675);
    fill(255, 0, 0);
    rect(1077, 582, 1155, 598);
  }
  if (state==12) {
    //The last slide
    image(won, 0, 0, 1280, 700);
  }
  if (state==8) {
    //Trasition slide
    robot2b.play();
    image (robot4, 0, 0, 1280, 700);
    fill(0);
    strokeWeight(10);
    rect(0, 623, 927, 700);
    fill(255, 0, 0);
    rect(1131, 662, 1218, 676);
    fill(255);
    strokeWeight(10);
    text ("So you got through?", 0, 650);
    text ( "I got more cybersecurity, you won't stand a chance!", 0, 675);
  }



  if (state==10) {
    //Playing a video
    video.play();
    image  (video, 0, 0);

    textSize(20);
    text ( "Right arrow key to skip...", 0, 675);
  }
  if ((state >1&&state<10)) {
    //Background music
    music.play();
  }

  if (state==1) {
    //Stoping all audio and videos
    hackerman1.pause();
    hackerman1.rewind();
    hackerman2.pause();
    hackerman2.rewind();
    robot1b.pause();
    robot1b.rewind();
    robot2b.pause();
    robot2b.rewind();
    fill1.pause();
    fill1.rewind();
    bill2.pause();
    bill2.rewind();

    video.stop();
    video2.stop();
    //Reseting all the variables 
    image(menu, 0, 0, 1280, 700); 
    x=0;
    y=390;
    y2= int(random(0, 500));  
    x2= 1200;
    x3 =  1200; 
    hitx = false; 
    hity= false;
  }

  if (state == 2) {
    hackerman1.pause();
    hackerman1.rewind();
    hackerman2.pause();
    hackerman2.rewind();
    robot1b.pause();
    robot1b.rewind();
    robot2b.pause();
    robot2b.rewind();
    fill1.pause();
    fill1.rewind();
    bill2.pause();
    bill2.rewind();
    video.stop();
    video2.stop();

    image(menu, 0, 0, 1280, 700); 
    //Resetting the variables
    x=0;
    y=390;
    y2= int(random(0, 500));  
    x2= 1200;
    x3 =  1200; 
    hitx = false; 
    hity= false;
    level=0;
    image (controls, 0, 0, 1280, 700);
    rectMode (CORNERS);
    fill(0);
    rect(3, 180, 830, 255);
    rect(2, 325, 676, 380);
    rect( 3, 71, 496, 95);
    rect(0, 450, 864, 500);
    fill(255, 0, 0);
    rect(1077, 582, 1155, 598);
    textSize(40);
    fill(255);
    text ("CONTROLS", 0, 100);
    textSize (30);
    text ("Use up and down arrow keys ", 0, 200);
    text ("to move hackerman to avoid encrypted computers", 0, 250); 
    text ("Click on the red button on your screen", 0, 350);
    text (" for advancing through the story...", 0, 375);
    text(" Press on the right arrow key to reset the game.", 0, 480);
    textSize (30);
  }
  if (state == 3) { 
    hackerman1.play();
    image (hack1, 0, 0, 1280, 700);
    strokeWeight(10);
    textSize (80);
    text ("Hackerman Ain't Happy", 0, 400);
  }
  if (state ==4) {
    image (background, 0, 0, 1280, 700);

    image(bender, x2, y2, w, l);

    image(robot1, x3, y2, w, l);
    //The movement of the images through the game 
    x=x+20;
    //The higher the level, the faster the enemy moves... The levels are defined by the varible level
    if ((level==0)&&(hity==false)&&(hitx==false)) {
      x2=x2-80;
    }

    if ((level ==1)&&(hity==false)&&(hitx==false)) {
      x2=x2-100;
    }

    if ((level ==2)&&(hity==false)&&(hitx==false)) {
      x2=x2-225;
    }

    image (kung1, x, y, w, l);
    //Getting the space between the coordinates of the two characters. 
    float   diffx=x2-x;
    float   diffy=y-y2;
    //  Getting the absolute values
    diffx= abs(diffx);
    diffy = abs(diffy);
    if (x2<-50)
    {
      //Spawning multiple enemies
      x2 =  1280;
      y2 = int(random(500));
    }

    if (((((hitx==false)&&(hity==false)&&(diffx<=100)&&(diffy<=100)&&(diffx>0)&&(diffy>0)&&(x< 1280))))) {
      //If they images hit each other. With some adjusments to the size.
      hitx = true;
      hity = true;
    }
    if ((hitx==true) && (hity==true)) {
      //The transition slides after the impact.They also depend on the level
      if (level<2)
      {
        hackerman2.play();
        image (hackcaught, 0, 0, 1280, 700);
        strokeWeight(10);
        textSize (40);
        fill(255);
        text ("You got caught, you're on your own.", 0, 600);
        text("C'ya in jail buddy...", 0, 640);
        strokeWeight(10);
        fill(255, 0, 0);
        rect(1077, 582, 1155, 598);
      }
      if (level>=2) {
        robot2b.pause();
        bill2.play();
        image (bill, 0, 0, 1280, 700);
        strokeWeight(20);
        textSize (40);
        fill(0);
        strokeWeight(10);
        rect(0, 650, 1180, 700);
        fill(255);
        text ("Thank you Mr. Robot, I knew I could count on you", 0, 675);
        text("Cybersecurity is just the greatest! ", 0, 700);
        strokeWeight(10);
        fill(255, 0, 0);
        rect(1077, 582, 1155, 598);
      }
    }

    if ((x>= 1280)&&(state==4)) {
      while ((x>= 1280)) {        
        //Reseting Kung Fury's position
        x=0;
        //Advancing the level
        level++;
      }
      if ((level==1)&&(hitx==false)&&(hity==false)) {
        state=5;
      } else if ((level==2)&&(hitx==false)&&(hity==false)) {
        state=8;
      } else if ((level>=3)&&(hitx==false)&&(hity==false)) {
        state=11; 
        for (x=0; x>1280; ) {
          //Making Kung Fury move to the right.
          x++;
        }
      }
    }
  }
    if (state==5) {
      //The first transition Slide for level one
      hackerman2.pause();                                                                                     
      fill1.play();
      image (robot2, 0, 0, 1280, 700);
      fill(255);
      textSize(30);
      text ("You hacked away too many of my precious computers!", 0, 630);
      fill(255, 0, 0);
      strokeWeight(10);
      rect(100, 582, 200, 598);
    }

    if ((mouseButton == LEFT) && (mouseX > 100) && (mouseX < 200) && (mouseY > 550) && (mouseY < 600)&&(state==5)) 
    {  //The second transition slide
      state=6;
    }

    if ((mouseButton == LEFT) && (((mouseX > 800 && (mouseX < 1000)) && ((mouseY > 570) && (mouseY < 598)&&(state==6))))) {  
      state=7;
    }

    if (state == 7) {
      //Resetting the variables to advance in the levels
      x2=x2+10;
      x=0;
      y=390;
      y2= int(random(0, 500));  
      x2= 1200;
      x3 =  1200; 
      hitx = false; 
      hity= false;
      state=4;
    }
  }



void mouseClicked() {
  //All the transitions made by the clicking the mouse
  if ((mouseButton == LEFT) && (((mouseX > 305 && (mouseX < 553)) && ((mouseY > 390) && (mouseY < 444))))) {   //Yes
    state = 2;
  }
  if  ((mouseButton == LEFT) && (state ==2) && (((mouseX > 1077 && (mouseX < 1155)) && ((mouseY > 582) && (mouseY < 598))))) { 
    //Making the state 4 so the background can be created in void draw.
    state = 4;
  }        
  if ((mouseButton == LEFT) && (mouseX > 100) && (mouseX < 200) && (mouseY > 550) && (mouseY < 600)&&(state==5)) 
  {  //The second transition slide
    state=6;
  }
  if ((mouseButton == LEFT) && (((mouseX > 1077 && (mouseX < 1155)) && ((mouseY >582 ) && (mouseY < 598)&&(state==11))))) {   
    state = 12;
  } 

  if ((mouseButton == LEFT) && (((mouseX > 724 && (mouseX < 834)) && ((mouseY >410 ) && (mouseY < 455)&&(state==1))))) {  //No
    state = 3;
  } 
  if ((mouseButton == LEFT) && (((mouseX > 1077 && (mouseX < 1155)) && ((mouseY >582 ) && (mouseY < 598)&&(hitx==true))))) {
    state = 13;
  }
}
