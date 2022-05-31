//Libraries: uses Sketch / Import library / Add Library/Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //Creates object to access all functions
AudioPlayer song1; //Creates "Playlist" variables holding extensions WAV, AIFF, AU, SND, & MP3
//
void setup() 
{
 fullScreen();
 minim = new Minim(this);//leads from data directory, loadFile should also load from project folder, like loadImage();
  song1 = minim.loadFile("Music Download/White River - Aakash Gandhi.mp3");
  song1.loop(1);//Parameter is number of repeats
}//End setup
//
void draw() {}//End draw
//
void keyPressed() 
{
  //Only press a number for this code
 String keystr = String.valueOf(key);
 println("Number of Repeats is", keystr);
 int num = int(keystr);
  song1.loop(num);
  //
  /*int loopNum= 2;//Local Variables plays once and loops twice
 //song1.play();Parameter is milli-seconds from start of audio file to star of playing 
  if (key=='l' || key=='L') song1.loop(loopNum);
  */
}//End keyPressed
//
void mousePressed() {}//End mousePressed
//
//End MAIN
//
