size(600, 500, P3D); 
background(0);
lights();

noStroke();
pushMatrix();
translate(130, 130, 0);
rotateY(1.25);
rotateX(-0.4);
box(100);
popMatrix();

noFill();
stroke(255);
pushMatrix();
translate(500, height*0.4, -200);
sphere(250);
popMatrix();
fill(0, 100, 250);
pushMatrix();
translate(160, height*0.7, -200);
sphereDetail(30);
sphere(100);
popMatrix();
