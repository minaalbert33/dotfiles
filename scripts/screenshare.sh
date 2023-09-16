#!/bin/sh

killall wf-recorder
# Start wf-recorder
wf-recorder --muxer=mpegts --codec=libx264 --file=udp://0.0.0.0:1111 &

# Start mpv
mpv udp://0.0.0.0:1111 --no-cache --untimed --no-demuxer-thread --video-sync=audio --vd-lavc-threads=1
