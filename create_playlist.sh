#!/bin/sh

helpFunction()
{
   echo ""
   echo "Usage: $0 -m PATH_OF_YOUR_MUSIC -p PATH_TO_SAVE_YOUR_PLAYLISTS"
   echo -e "\t-h help"
   echo -e "\t-m path to read mp3 files from directory and it's sub files"
   echo -e "\t-d path to save your playlists"
   exit 1 # Exit script after printing help
}

createPlaylist(){
   PATH_SONGS="$music"
   PATH_PLAYLISTS="$playlists"
   find "$PATH_SONGS" -type d > "$PATH_PLAYLISTS/directories.txt"
   find "$PATH_PLAYLISTS" -name '*.m3u' -delete
   while read PATH_DIR; do    
      DIR_NAME=$(basename "$PATH_DIR")
#      echo "Name: $DIR_NAME, Path: $PATH_DIR"
      find "$PATH_DIR" -name '*.mp3' > "$PATH_PLAYLISTS/$DIR_NAME.m3u"
   done < "$PATH_PLAYLISTS/directories.txt"
}

while getopts h:m:d: flag
do
    case "${flag}" in
        h) helpFunction ;;
        m) music=${OPTARG};;
        d) playlists=${OPTARG};;
        ?) helpFunction ;;
    esac
done

# Print helpFunction in case parameters are empty
if [ -z "$music" ] || [ -z "$playlists" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

#echo "Music: $music"
#echo "Playlists: $playlists"
#echo ""
#echo ""
createPlaylist
find "$playlists" -type f -empty -delete
echo "Check>> $playlists"
tree "$playlists"
