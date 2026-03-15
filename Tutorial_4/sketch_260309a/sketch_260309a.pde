import processing.video.*;
Capture video;

void setup(){
  size (640, 480);
  String[] cameras = Capture.list();
  
  if (cameras.length==0){
    println("No camera found");
    exit();
  }else{
    video = new Capture(this, cameras[0]);
    video.start();
  }
}

void draw(){
  if (video.available() == true) {
    video.read();
  } 
  tint (mouseX, mouseY, 255);
  image(video, 0, 0);
}
