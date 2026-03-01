size(200, 200);
background(255);
smooth();
color c1 = color(255,0,0);
// Set ellipses and rets to Center mode
ellipseMode(CENTER);
rectMode(CENTER);
// Draw Human's body
stroke(0);
fill(0,255,127);
rect(100,90, 15,80);
// draw Human's head
fill(255);
ellipse(100,40,60,60);
// draw Human's face
fill(0);
ellipse(81,35,16,16);
ellipse(119,35,16,16);
fill(c1);
ellipse(81,35,8,8);
ellipse(119,35,8,8);
fill(c1);
ellipse(100,40,10,10);
fill(255,255,255);
bezier(80,50, 93,63, 103,63, 120,50);

// draw Human's arms
line(92,70,85,135);
line(107,70,114,135);
// draw Human's legs
stroke(0);
line(92,119,85,180);
line(85,180, 73,180);
line(107,119,114,180);
line(114,180,126,180);
