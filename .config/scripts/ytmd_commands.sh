#!/bin/zsh

case $1 in
  track)
    COMMAND="track"
    REQUEST="GET"
    ;;
  player)
    COMMAND="player"
    REQUEST="GET"
    ;;
  play)
    COMMAND="track-play"
    REQUEST="POST"
    ;;
  pause)
    COMMAND="track-pause"
    REQUEST="POST"
    ;;
  next)
    COMMAND="track-next"
    REQUEST="POST"
    ;;
  previous)
    COMMAND="track-previous"
    REQUEST="POST"
    ;;
  like)
    COMMAND="track-thumbs-up"
    REQUEST="POST"
    ;;
  dislike)
    COMMAND="track-thumbs-down"
    REQUEST="POST"
    ;;
  volume-up)
    COMMAND="player-volume-up"
    REQUEST="POST"
    ;;
  volume-down)
    COMMAND="player-volume-down"
    REQUEST="POST"
    ;;
  ff)
    COMMAND="player-forward"
    REQUEST="POST"
    ;;
  rw)
    COMMAND="player-rewind"
    REQUEST="POST"
    ;;
  repeat)
    COMMAND="player-repeat"
    REQUEST="POST"
    ;;
  shuffle)
    COMMAND="player-shuffle"
    REQUEST="POST"
    ;;
  add-library)
    COMMAND="player-add-library"
    REQUEST="POST"
    ;;
  add-playlist)
    COMMAND="player-add-playlist"
    REQUEST="POST"
    ;;
  set-seekbar)
    COMMAND="player-set-seekbar"
    REQUEST="POST"
    ;;
  set-volume)
    COMMAND="player-set-volume"
    REQUEST="POST"
    ;;
  set-queue)
    COMMAND="player-set-queue"
    REQUEST="POST"
    ;;
  *)
    if [[ -z "$1" ]]
    then
      COMMAND="track"
      REQUEST="GET"
    else
      echo unknown command: $1
      exit
    fi
    ;;
esac


if [[ -z "$2" ]]  
then
  PAYLOAD="{\"command\": \"$COMMAND\"}"
else
  PAYLOAD="{\"command\": \"$COMMAND\", \"value\": \"$2\"}"
fi

if [ $REQUEST = 'POST' ]; then
  curl -d "$PAYLOAD" -H "Content-Type: application/json" -X $REQUEST http://localhost:9863/query
elif [ $REQUEST = 'GET' ]; then
  curl -H "Accept: application/json" http://localhost:9863/query/"$COMMAND" | jq
fi
  


# Available Commands
# https://github.com/ytmdesktop/ytmdesktop/wiki/Remote-Control-API
#######################
# show-lyrics-hidden - Open hidden lyrics window to provide data
# track-play - Play music
# track-pause - Pause music
# track-next - Next track
# track-previous - Previous track
# track-thumbs-up - Like current track
# track-thumbs-down - Dislike current track
# player-volume-up - Increase the player volume
# player-volume-down - Decrease the player volume
# player-forward - Forward 10 seconds
# player-rewind - Rewind 10 seconds
# player-repeat - Toggle NONE or ONE or ALL
# player-shuffle - Shuffle queue
# player-add-library - Add track to library
# player-add-playlist - Add track to playlist (Needs value: Playlist index)
# player-set-seekbar - Set value for seekbar (Needs value: 0 ~ Track duration)
# player-set-volume - Set value for volume (Needs value: 0 ~ 100)
# player-set-queue - Set index of queue to play track (Needs value: 0 ~ Queue length)
