//Libraries: uses Sketch / Import library / Add Library/Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1; //creates "Play List" variables holding extensions WAV, AIFF, AU, SND, & MP3
AudioMetaData songMetaData1; //song1's meta data
//
void setup() 

{
 size(600, 500);
 minim = new Minim(this);//leads from data directory, loadFile should also load from project folder, like loadImage();
  song1 = minim.loadFile("Music Download/White River - Aakash Gandhi.mp3");
  songMetaData1 = song1.getMetaData();
  //
println("Start of Console");
println("Click the console to Finish Starting this Program");
println("title:", songMetaData1.title());
  //song1.loop(1);//Parameter is number of repeats
}//End setup
//
void draw() {
if( song1.isLooping() ) println("There are", song1.loopCount(), "loops left.");
if(song1.isPlaying() && !song1.isLooping() ) println("Playing Once");
//
//println("song Position", song1.position(), "song length", song1.length());
}//End draw
//
void keyPressed() 
{
  //Only press a number for this code
  println(key);
  if(key=='1'  || key=='9'){
    //9 is assumed to be massive!
  if (key=='1') println("looping 1 times");
  if (key=='9') println("looping 9 times");
 String keystr = String.valueOf(key);
 println("Number of Repeats is", keystr);
 int num = int(keystr);
  song1.loop(num);
  }//End LOOP
  if( key=='l' || key=='L') song1.loop();
  if(key>='2' && key!='9') println("I do not loop that much! Try again.");
  //
  //
  if(key=='p' || key=='P'){//NOTE THIS IF STATEMENT
  if(song1.isPlaying()) {
    song1.pause();
  }else if (song1.position() >= song1.length()-song1.length()*1/5) {
    song1.rewind();
    song1.play();
  }else{
    song1.play(100000);
  }
}//PLAY PAUSE END
//
if(key=='f' || key=='F') song1.skip(1000);
if(key=='r' || key=='R') song1.skip(-1000);
  /*int loopNum= 2;//Local Variables plays once and loops twice
 //song1.play();Parameter is milli-seconds from start of audio file to star of playing 
  if (key=='l' || key=='L') song1.loop(loopNum);
  */
  if( key=='m' || key=='M' ){
  if(song1.isMuted()) {
    song1.unmute();//MUTE Button
  } else{
    song1.mute();
  }
  }//End MUTE
  if(key=='s' || key=='S') {
  if(song1.isPlaying()){ 
   song1.pause();
   song1.rewind();
  }else{
    song1.rewind();
}//End PAUSE
  }
}//End keyPressed
//
void mousePressed() {}//End mousePressed
//
//End MAIN
//
