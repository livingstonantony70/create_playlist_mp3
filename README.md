# create_playlist_mp3
Get all songs from your directory and create a playlist
```
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
```
bash Shell/create_playlist.sh -m /Users/livingstonantony/Music/All\ Song -d /Users/livingstonantony/Music/All\ Song/My\ Playlists 

```
Usage: Shell/create_playlist.sh -m PATH_OF_YOUR_MUSIC -p PATH_TO_SAVE_YOUR_PLAYLISTS
	-h help
	-m path to read mp3 files from directory and it's sub files
	-d path to save your playlists
```

```
.
├── 90s Hits.m3u
├── Aadukalam-320kbps-MassTamilan.m3u
├── Aaytha-Ezhuthu-320kbps-MassTamilan.m3u
├── Album.m3u
├── All Song.m3u
├── Attack on Titans.m3u
├── Avengers_ Endgame (Original Motion Picture Soundtrack) [2019-Album].m3u
├── Bachelor-320kbps-MassTamilan.fm.m3u
├── Cover Songs.m3u
├── Cruella (2021) Mp3 320kbps [PMEDIA] \25520️.m3u
├── Eminem - Venom (2018).m3u
├── English.m3u
├── Far Cry 5 Original Game Soundtrack [MP3].m3u
├── Far Cry 5 Presents - We Will Rise Again Original Game Soundtrack.m3u
├── Far Cry New Dawn Original Game Soundtrack.m3u
├── GV Prakash.m3u
├── Gulu-Gulu-320kbps-MassTamilan.m3u
├── InglouriousBasterdsSoundtrack.m3u
├── John Wick Chapter 2 (Original Motion Picture Soundtrack)-2017-320 kbps.m3u
├── Joker-320kbps-MassTamilan.m3u
├── Junkie XL - Tomb Raider [OST] (2018).m3u
├── Kaadhal-Solla-Vandhen-320kbps-MassTamilan.m3u
├── Kadhal-Konden-320kbps-MassTamilan.m3u
├── Kadhalan-320kbps-MassTamilan.m3u
├── Kettavan.m3u
├── Kuthu-320kbps-MassTamilan.m3u
├── Latest English Songs 2022.m3u
├── Love-Today-320kbps-MassTamilan.m3u
├── Mahaan-320kbps-MassTamilan.m3u
├── Mehandi-Circus-320kbps-MassTamilan.m3u
├── Minnale-320kbps-MassTamilan.m3u
├── Movie song collection.m3u
├── Nattamai BGM.m3u
├── Nattamai-320kbps-MassTamilan.m3u
├── Nee-Varuvai-Ena-320kbps-MassTamilan.m3u
├── Ninaivo-Oru-Paravai-128kbps-MassTamilan.io.m3u
├── Outlast Soundtrack.m3u
├── Prince-320kbps-MassTamilan.dev.m3u
├── Priyamana-Thozhi-320kbps-MassTamilan.com.m3u
├── Psycho-320kbps-MassTamilan.m3u
├── Pulivaal-320kbps-MassTamilan.com.m3u
├── Sad.m3u
├── Sarvam-320kbps-MassTamilan.m3u
├── Savarakathi-320kbps-MassTamilan.m3u
├── Shell
│   └── create_playlist.sh
├── Songs.m3u
├── Soundtrack - Joker (2019) YG.m3u
├── Spider-Man - Into the Spider-Verse.m3u
├── Sub Cover Songs.m3u
├── Tamil Songs.m3u
├── The Game of Thrones.m3u
├── The Harder They Fall - The Harder They Fall (2021) Mp3 320kbps [PMEDIA] \25520️.m3u
├── Thiruchitrambalam-320kbps-MassTamilan.m3u
├── Thulluvadho-Ilamai-320kbps-MassTamilan.m3u
├── Tyler Bates - John Wick Chapter 3 – Parabellum ( Soundtrack) (2019) [320].m3u
├── Udhayam-NH4-320kbps-MassTamilan.m3u
├── Unakkaga-Ellam-Unakkaga-320kbps-MassTamilan.m3u
├── Unnale-Unnale-320kbps-MassTamilan.m3u
├── VA - Birds of Prey- The Album (Soundtrack) (2020) Mp3 320kbps [PMEDIA] â­\220ï¸\217.m3u
├── VA - Spider-Man Into the Spider-Verse.m3u
├── VA - The Greatest Showman (2017) [Original Motion Picture Soundtrack] [320kbps] vtwin88cube.m3u
├── VA- Black Panther The Album (2018).m3u
├── Vada-Chennai-320kbps-MassTamilan.com.m3u
├── Voice of Yuvan Shankar.m3u
├── Yaaradi-Nee-Mohini-320kbps-MassTamilan.m3u
└── directories.txt

```
