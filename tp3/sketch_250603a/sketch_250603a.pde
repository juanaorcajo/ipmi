PImage img;
float escala = 1.3;
float separacion = 12 * escala;

int nRed = 13;
int nYellow = 9;
int nCyan = 6;

float baseRedMin = 170 * escala;
float baseRedMax = 220 * escala;
float baseYellowMin = 130 * escala;
float baseYellowMax = 160 * escala;
float baseCyanMin = 90 * escala;
float baseCyanMax = 120 * escala;

float posXStart;

color red0, red1, red2, red3, red4, red5, red6, red7, red8, red9, red10, red11, red12;
color yellow0, yellow1, yellow2, yellow3, yellow4, yellow5, yellow6, yellow7, yellow8;
color cyan0, cyan1, cyan2, cyan3, cyan4, cyan5;

color colorFondo = color(0);

//https://youtu.be/_TI29Sbn9Gw

void setup() {
  size(800, 400);
  posXStart = 410 * escala;
  inicializarColores();
  resetVariables();
  noLoop();
}

void inicializarColores() {
  red0 = red1 = red2 = red3 = red4 = red5 = red6 = red7 = red8 = red9 = red10 = red11 = red12 = color(255, 0, 0);
  yellow0 = yellow1 = yellow2 = yellow3 = yellow4 = yellow5 = yellow6 = yellow7 = yellow8 = color(255, 255, 0);
  cyan0 = cyan1 = cyan2 = cyan3 = cyan4 = cyan5 = color(0, 255, 255);
}

void resetVariables() {
  colorFondo = color(0);
  background(colorFondo);
  img = loadImage("M_5.png");
  image(img, 0, 0, 400, 400);
  escala = 1.3;
}

void draw() {
  background(colorFondo);
  image(img, 0, 0, 400, 400);

  // ROJAS
  for (int i = 0; i < nRed; i++) {
    float x = posXStart + i * separacion;
    float altura = calcularAltura(i, nRed, baseRedMin, baseRedMax);
    color c = getRedColor(i);
    float grosor = 1 + i * 0.15f * escala;
    if (dist(x, height / 2, width / 2, height / 2) < 100) {
      grosor *= 1.2;
    }
    dibujarLinea(x, (height - altura) / 2, (height + altura) / 2, c, grosor);
  }

  // AMARILLAS
  for (int i = 0; i < nYellow; i++) {
    float x = posXStart + separacion * (i + 0.5);
    float altura = calcularAltura(nYellow - 1 - i, nYellow, baseYellowMin, baseYellowMax);
    color c = getYellowColor(i);
    float grosor = (1.5f - i * 0.1f) * escala;
    if (dist(x, height / 2, width / 2, height / 2) < 100) {
      grosor *= 1.2;
    }
    dibujarLinea(x, (height - altura) / 2, (height + altura) / 2, c, grosor);
  }

  // CELESTES
  for (int i = 0; i < nCyan; i++) {
    int cyanStartIndex = 3;
    int cyanEndIndex = nYellow - 1;
    float xStart = posXStart + separacion * (cyanStartIndex + 0.5);
    float xEnd = posXStart + separacion * (cyanEndIndex + 0.5);
    float x = map(i, 0, nCyan - 1, xStart, xEnd);
    float altura = map(i, 0, nCyan - 1, baseCyanMin, baseCyanMax);
    color c = getCyanColor(i);
    float grosor = map(i, 0, nCyan - 1, 0.5f, 1.5f) * escala;
    if (dist(x, height / 2, width / 2, height / 2) < 100) {
      grosor *= 1.2;
    }
    dibujarLinea(x, (height - altura) / 2, (height + altura) / 2, c, grosor);
  }
}

void dibujarLinea(float x, float y1, float y2, color c, float grosor) {
  stroke(c);
  strokeWeight(grosor);
  line(x, y1, x, y2);
}

float calcularAltura(int i, int n, float minAlt, float maxAlt) {
  return map(i, 0, n - 1, minAlt, maxAlt);
}

color getRedColor(int i) {
  switch(i) {
    case 0: return red0;
    case 1: return red1;
    case 2: return red2;
    case 3: return red3;
    case 4: return red4;
    case 5: return red5;
    case 6: return red6;
    case 7: return red7;
    case 8: return red8;
    case 9: return red9;
    case 10: return red10;
    case 11: return red11;
    case 12: return red12;
  }
  return color(255, 0, 0);  
}

color getYellowColor(int i) {
  switch(i) {
    case 0: return yellow0;
    case 1: return yellow1;
    case 2: return yellow2;
    case 3: return yellow3;
    case 4: return yellow4;
    case 5: return yellow5;
    case 6: return yellow6;
    case 7: return yellow7;
    case 8: return yellow8;
  }
  return color(255, 255, 0);
}

color getCyanColor(int i) {
  switch(i) {
    case 0: return cyan0;
    case 1: return cyan1;
    case 2: return cyan2;
    case 3: return cyan3;
    case 4: return cyan4;
    case 5: return cyan5;
  }
  return color(0, 255, 255);
}

void mousePressed() {
  red0 = color(random(150, 255), 0, 0);
  red1 = color(random(150, 255), 0, 0);
  red2 = color(random(150, 255), 0, 0);
  red3 = color(random(150, 255), 0, 0);
  red4 = color(random(150, 255), 0, 0);
  red5 = color(random(150, 255), 0, 0);
  red6 = color(random(150, 255), 0, 0);
  red7 = color(random(150, 255), 0, 0);
  red8 = color(random(150, 255), 0, 0);
  red9 = color(random(150, 255), 0, 0);
  red10 = color(random(150, 255), 0, 0);
  red11 = color(random(150, 255), 0, 0);
  red12 = color(random(150, 255), 0, 0);

  yellow0 = color(random(150, 255), random(150, 255), 0);
  yellow1 = color(random(150, 255), random(150, 255), 0);
  yellow2 = color(random(150, 255), random(150, 255), 0);
  yellow3 = color(random(150, 255), random(150, 255), 0);
  yellow4 = color(random(150, 255), random(150, 255), 0);
  yellow5 = color(random(150, 255), random(150, 255), 0);
  yellow6 = color(random(150, 255), random(150, 255), 0);
  yellow7 = color(random(150, 255), random(150, 255), 0);
  yellow8 = color(random(150, 255), random(150, 255), 0);

  cyan0 = color(0, random(150, 255), random(150, 255));
  cyan1 = color(0, random(150, 255), random(150, 255));
  cyan2 = color(0, random(150, 255), random(150, 255));
  cyan3 = color(0, random(150, 255), random(150, 255));
  cyan4 = color(0, random(150, 255), random(150, 255));
  cyan5 = color(0, random(150, 255), random(150, 255));

  redraw();
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    inicializarColores();
    resetVariables();
    redraw();
  }
}
