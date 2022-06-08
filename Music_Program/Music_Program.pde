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
int numberOfSongs = 4;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //creates "Play List" variables holding extensions WAV, AIFF, AU, SND, & MP3
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]; //song1's meta data
int currentSong = numberOfSongs - numberOfSongs;
color black=0, purple=#2C08FF;
PFont titleFont;
//
void setup() 

{
 size(600, 500);
 minim = new Minim(this);//leads from data directory, loadFile should also load from project folder, like loadImage();
  song[currentSong] = minim.loadFile("Music Download/White River - Aakash Gandhi.mp3");
  song[currentSong+=1] = minim.loadFile("Music Download/Gunpowder Tea - Mini Vandals.mp3");
  song[currentSong+=1] = minim.loadFile("Music Download/Golden Empire - The 126ers.mp3");
  song[currentSong+=1] = minim.loadFile("Music Download/Down With Your Getup - Mini Vandals.mp3");
  //
  currentSong-=currentSong;
  //
  for( int i=currentSong; i<song.length; i++) {
  songMetaData[i] = song[i].getMetaData();
  }//End Meta Data
  //
  /*songMetaData[0] = song[0].getMetaData();
  songMetaData[1] = song[1].getMetaData();
  songMetaData[2] = song[2].getMetaData();
  songMetaData[3] = song[3].getMetaData();
  //
  */
  
  titleFont = createFont("Harrington",55 );
  //
println("Start of Console");
println("Click the console to Finish Starting this Program");
println("title:", songMetaData[currentSong].title());
  //song1.loop(1);//Parameter is number of repeats
}//End setup
//
void draw() {
  if( song[currentSong].isLooping() ) println("There are", song[currentSong].loopCount(), "loops left.");
if(song[currentSong].isPlaying() && !song[currentSong].isLooping() ) println("Playing Once");
//
println("Computer Number of Current Song:", currentSong);
println("Song Position", song[currentSong].position(), "Song Length", song[currentSong].length());
  background(black);
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(purple);
  textAlign(CENTER, CENTER);
  textFont(titleFont, 30);
  text(songMetaData[currentSong].title(), width*1/4, height*0 , width*1/2, height*1/10);
  fill(255);
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
  song[currentSong].loop(num);
  }//End LOOP
  if( key=='l' || key=='L') song[currentSong].loop();
  if(key>='2' && key!='9') println("I do not loop that much! Try again.");
  //
  //
  if(key=='p' || key=='P'){//NOTE THIS IF STATEMENT
  if(song[currentSong].isPlaying()) {
    song[currentSong].pause();
  }else if (song[currentSong].position() >= song[currentSong].length()-song[currentSong].length()*1/5) {
    song[currentSong].rewind();
    song[currentSong].play();
  }else{
    song[currentSong].play();
  }
}//PLAY PAUSE END
//
if(key=='f' || key=='F') song[currentSong].skip(1000);
if(key=='r' || key=='R') song[currentSong].skip(-1000);
  /*int loopNum= 2;//Local Variables plays once and loops twice
 //song1.play();Parameter is milli-seconds from start of audio file to star of playing 
  if (key=='l' || key=='L') song1.loop(loopNum);
  */
  if( key=='m' || key=='M' ){
  if(song[currentSong].isMuted()) {
    song[currentSong].unmute();//MUTE Button
  } else{
    song[currentSong].mute();
  }
  }//End MUTE
  if(key=='s' || key=='S') {
  if(song[currentSong].isPlaying()){ 
   song[currentSong].pause();
   song[currentSong].rewind();
  }else{
    song[currentSong].rewind();
}//End PAUSE
  }
  
  if(key=='n' || key=='N') {
    if( song[currentSong].isPlaying() ) {
  song[currentSong].pause();
  song[currentSong].rewind();
      nextButtonArrayCatch();
      song[currentSong].play();
    } else{
       song[currentSong].rewind();
       nextButtonArrayCatch();
         song[currentSong].play();
       }
}//End Next Button
//
if() {}//End Previous Button
}//End keyPressed
//
void mousePressed() {
currentSong++;
}//End mousePressed
//
//End MAIN
//
