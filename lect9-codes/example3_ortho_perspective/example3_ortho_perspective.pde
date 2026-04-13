void setup() {
  size(800, 500, P3D);
  noStroke();
}
void draw() {
  background(0);
  lights(); 
  if(mousePressed) {
    float fov = PI/2.0; 
    float cameraZ = (height/2.0)/tan(fov/3.0);
    float aspect = float(width)/float(height);
    perspective(fov, aspect, 
                cameraZ/10.0, cameraZ*10.0); 
  } 
  else {
    ortho(-width/2, width/2, -height/2, height/2, -1000, 1000); 
  }  
  translate(width/2, height/2, 0);
  rotateX(-PI/6); 
  rotateY(PI/3);
  fill(200);
  box(300); 
}