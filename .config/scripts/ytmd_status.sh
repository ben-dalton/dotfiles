#!/bin/zsh

ARTIST=$(curl -s http://localhost:9863/query/track | jq -r ".author")
SONG=$(curl -s http://localhost:9863/query/track | jq -r ".title")
HAS_SONG=$(curl -s http://localhost:9863/query/player | jq -r ".hasSong")
IS_PAUSED=$(curl -s http://localhost:9863/query/player | jq -r ".isPaused")

if [ $IS_PAUSED = 'true' ]
then
  ICON='॥'
else
  ICON='▷'
  # ICON='♫' 
fi

if [ $HAS_SONG = 'true' ]
then
  echo "$ICON $SONG by $ARTIST"
  exit
else
  echo ""
fi
