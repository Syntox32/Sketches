# Sketches
A catalog for my processing sketches

## Catalog

  1. [Cube](https://github.com/Syntox32/Sketches/tree/master/cube)

# Image sequence to video

This FFmpeg command takes an image sequence, couples it with audio, and creates a `.mp4`. The pixel format and audio codec has been tested, and works for uploading videos to Instagram.

```
ffmpeg -framerate 30 -i .\sketch-1\render-%06d.png -i .\data\song.mp3 -c:v libx264 -preset veryslow -c:a libvo_aacenc -af volume=0.4 -vb 10M -ss 00:00:00 -to 00:00:60 -pix_fmt yuv420p -r 30 video.mp4
```

[https://processing.org/reference/saveFrame_.html](https://processing.org/reference/saveFrame_.html)  
[https://en.wikibooks.org/wiki/FFMPEG_An_Intermediate_Guide/image_sequence](https://en.wikibooks.org/wiki/FFMPEG_An_Intermediate_Guide/image_sequence)  
[https://stackoverflow.com/a/11783474](https://stackoverflow.com/a/11783474)  
[https://video.stackexchange.com/a/13074](https://video.stackexchange.com/a/13074)  
