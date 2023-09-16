#!/bin/sh

killall wf-recorder
wf-recorder --muxer=mpegts --codec=libx264 --file=udp://0.0.0.0:1111 & mpv -vo=xv udp://0.0.0.0:1111 --no-cache --untimed --no-demuxer-thread --video-sync=audio --vd-lavc-threads=1y      
