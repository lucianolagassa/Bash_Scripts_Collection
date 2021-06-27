#!/bin/sh
pkill vlc
sleep 0.5
vlc --global-key-clear-playlist &
vlc --random --qt-start-minimized $HOME/Música/Varios &
