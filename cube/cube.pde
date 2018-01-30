import processing.sound.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

Amplitude amp;
AudioIn in;
SoundFile file;

Minim minim;
AudioPlayer glitch;
float prevLevel = 0;
float x = 0;
float noiseScale = 0.02;
float lastTime = 0;

void setup() {
  size(500, 500, P3D);
  background(255);
  frameRate(60);
  
  minim = new Minim(this);
  glitch = minim.loadFile("glitch.mp3", 1024);
  glitch.play();
}

void draw() {
  colorMode(RGB, 255);
  background(255);
  float currTime = millis();
  lastTime = currTime;
  
  float level = glitch.left.level();
  float l = lerp(prevLevel, level, 0.60);
  prevLevel = l;
  
  colorMode(HSB, 360);
  strokeWeight(6);
  strokeCap(PROJECT);
  fill(
    0,
    0,
    360
  );
  stroke(
    map(sin(currTime/(750))+1,
      0, 2, 0, 360) * noise(100*noiseScale+x, 100*noiseScale+x),
    250, //map(level, 0, 1, 0, 30)+40,
    360 //50+noise(100*canvasScale+x, 100*canvasScale+x)*50
  );
  x += 0.001;
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.01);
  rotateX(frameCount * 0.01);
  float boxW = map(l, 0, 1, 50, 150);
  box(boxW);
  saveFrame("box/box-######.png");
}