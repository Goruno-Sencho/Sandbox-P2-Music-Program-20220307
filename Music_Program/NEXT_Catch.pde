void nextButtonArrayCatch() 
{
  if( currentSong >= song.length-1){
         currentSong -= currentSong;
       }else{
         currentSong++;
       }
}//End nextButtonArrayCatch
