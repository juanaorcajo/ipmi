PImage miObjetoFavorito;

void setup(){  
  size(800, 400);  
  background(200);   
  miObjetoFavorito = loadImage("migato.jpg");
  noLoop();
}

void draw(){  
  noStroke();
  fill(200);
  rect(400, 0, 400, 230);
  fill(230);
  rect(400, 230, 400, 170);
  image(miObjetoFavorito, 0, 0, 400, 400);  
  strokeWeight(10);
  line(400, 0, 400, 400);
  println(mouseX + " / " + mouseY); 

  noStroke();
  fill(220); 
  rect(400, 90, 150, 140, 5);

  fill(100); 
  rect(520, 130, 160, 100, 5);

  fill(40); 
  rect(650, 110, 150, 119, 5);
  drawFurryRect(520, 130, 160, 100);
  drawFabricTexture(230);

  noStroke();
  fill(255); 
  ellipse(510, 240, 190, 70);

  fill(255);
  stroke(247);       
  strokeWeight(3);
  ellipse(550, 270, 90, 15);
  strokeWeight(0);

  fill(255);
  ellipse(602, 240, 60, 60);
  ellipse(602, 257, 35, 40);

  fill(30);
  triangle(585, 220, 585, 198, 612, 220);
  fill(255);
  triangle(625, 220, 625, 198, 598, 220);

  fill(0);
  ellipse(510, 215, 100, 25);
  ellipse(490, 230, 15, 40);
  ellipse(477, 223, 10, 20);

  fill(30);
  arc(602, 240, 60, 60, PI, TWO_PI);

  fill(50);
  triangle(595, 260, 605, 260, 600, 267);

  stroke(50);
  strokeWeight(2);
  line(590, 250, 595, 250);
  line(605, 250, 610, 250);

  stroke(0);
  noFill();
  strokeWeight(15);
  bezier(415, 240, 420, 250, 420, 270, 440, 270);
}

void drawFurryRect(float x0, float y0, float w, float h) {
  int hairs = 8000;
  for (int i = 0; i < hairs; i++) {
    float x = random(x0, x0 + w);
    float y = random(y0, y0 + h);

    float angle = random(TWO_PI);
    float len = random(6, 18);
    float dx = x + cos(angle) * len;
    float dy = y + sin(angle) * len;

    float c = random(60, 120);
    stroke(c);
    strokeWeight(random(0.6, 1.5));
    line(x, y, dx, dy);
  }
}

void drawFabricTexture(float yStart) {
  int threads = 5000;
  for (int i = 0; i < threads; i++) {
    float x = random(400, width);
    float y = random(yStart, height);

    stroke(random(160, 210)); 
    strokeWeight(random(0.3, 0.8));

    float angle = random(TWO_PI);
    float len = random(2, 5);
    float dx = x + cos(angle) * len;
    float dy = y + sin(angle) * len;

    line(x, y, dx, dy);
  }
}
