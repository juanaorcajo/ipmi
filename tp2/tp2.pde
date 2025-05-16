PImage[] imagenes = new PImage[4]; // imágenes
PFont fuente;                      // Fuente del texto
int pantalla = -1;                 // Empieza en pantalla inicial -1
int tiempoCambio = 15000;          // Tiempo entre cada pantalla
int ultimoCambio;                  // Tiempo del último cambio
boolean mostrarReinicio = false;   // Botón de reiniciar

// Variables para efectos
int alphaImg = 0;              // "despintado"
float imgX = 0;                // "se desliza"
float imgScale = 1.0;          // "efecto zoom"

void setup() {
  size(640, 480);
  
  imagenes[0] = loadImage("ajedreztp2portada.jpg");
  imagenes[1] = loadImage("ajedreztp2fot2.jpg");
  imagenes[2] = loadImage("ajedreztp2fot3.jpg");
  imagenes[3] = loadImage("ajedreztp2fot1.jpg");
  
  fuente = loadFont("BodoniMT-Italic-33.vlw");
  textFont(fuente);
  
  ultimoCambio = millis();
  
  // Inicio de efectos
  alphaImg = 0;
  imgX = 640;
  imgScale = 0.5;
}

void draw() {
  background(0);
  textSize(25); // Establece el tamaño que el texto tendrá siempre

  if (pantalla == -1) {
    // Pantalla negra con botón "Iniciar"
    drawBotonInicio();

  } else if (pantalla == 0) {
    alphaImg = min(alphaImg + 5, 255);
    tint(255, alphaImg);
    image(imagenes[0], 0, 0, 640, 480);
    noTint();
    
    float alpha = map(sin(radians(frameCount * 2)), -1, 1, 50, 255);
    fill(255, alpha);
    String mensaje = "AJEDREZ: juego de mesa para 2 jugadores. El objetivo es dar jaque mate al rey oponente, lo que significa que no puede moverse a ninguna casilla segura. Se utiliza un tablero de 8x8 casillas alternando colores, generalmente blanco y negro.";
    textAlign(CENTER); 
    textLeading(28);
    text(mensaje, 50, 150, 540, 250);
    
  } else if (pantalla == 1) {
    imgX = max(imgX - 10, 0);
    image(imagenes[1], imgX, 0, 640, 480);
    
    String mensaje = "Piezas por equipo: 1 Rey, 1 Reina, 2 Alfiles, 2 Caballos, 2 Torres y 8 Peones";
    fill(0);
    float x = 640 + 400 - ((millis() - ultimoCambio) / 15.0) % (640 + 2000);
    text(mensaje, x, 48);
    String mensaje1 = "Rey    Reina    Alfil    Caballo    Torre    Peon";
    text(mensaje1, 50, 450, 540, 250);
    String mensaje2 = "cada pieza tiene un movimiento propio con el cual el jugador puede matar piezas del oponente";
    text(mensaje2, 100, 100, 520, 250);
    
  } else if (pantalla == 2) {
    fill(0);
    textAlign(CENTER);
    textLeading(30);

    int duracionZoom = 2000;
    int tiempoEnPantalla = millis() - ultimoCambio;

    float tam;
    if (tiempoEnPantalla < duracionZoom) {
      tam = map(tiempoEnPantalla, 0, duracionZoom, 10, 28); // zoom desde 10 a 28
    } else {
      tam = 20;
    }
    textSize(tam);
    image(imagenes[2], 0, 0, 640, 480);
    String mensaje = "Se juega enfrentados en una mesa, y las piezas eliminadas se dejan a un costado del tablero. El jugador debe pensar sus movimientos con estrategia para ganar.";
    text(mensaje, 50, 20, 540, 330);

  } else if (pantalla == 3) {
    float alpha = map(sin(radians(frameCount * 2)), -1, 1, 100, 255);
    tint(255, alpha);
    image(imagenes[3], 0, 0, 640, 480);
    noTint();

    textAlign(CENTER);
    textLeading(30);
    float y = map(millis() - ultimoCambio, 0, tiempoCambio, -100, 160);
    String mensaje = "El juego acaba cuando un jugador derrota al Rey del otro, sin importar las piezas que se hayan eliminado.";
    fill(255);
    text(mensaje, 50, constrain(y, -100, 160), 540, 200);
  }

  // Mostrar botón "Reiniciar" solo en la última pantalla
  if (pantalla == 3) {
    mostrarReinicio = true;
    drawBotonReiniciar();
  } else {
    mostrarReinicio = false;
  }

  // Cambio automático de pantalla (no para pantalla inicial -1, ya que esa es con el botón)
  if (pantalla >= 0 && millis() - ultimoCambio > tiempoCambio && pantalla < 3) {
    pantalla++;
    ultimoCambio = millis();
    alphaImg = 0;
    imgX = 640;
    imgScale = 0.5;
  }
}

void drawBotonInicio() {
  fill(200);
  rect(260, 220, 120, 40); 
  fill(0);
  textAlign(CENTER, CENTER);
  text("Iniciar", 320, 240);
}

void drawBotonReiniciar() {
  fill(200);
  rect(270, 420, 100, 40);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Reiniciar", 320, 440);
}

void mousePressed() {
  if (pantalla == -1) {
    if (mouseX > 260 && mouseX < 380 && mouseY > 220 && mouseY < 260) {
      pantalla = 0;
      ultimoCambio = millis();
      alphaImg = 0;
      imgX = 640;
      imgScale = 0.5;
    }
  }

  if (mostrarReinicio) {
    if (mouseX > 270 && mouseX < 370 && mouseY > 420 && mouseY < 460) {
      pantalla = -1;
      mostrarReinicio = false;
      ultimoCambio = millis();
      alphaImg = 0;
      imgX = 640;
      imgScale = 0.5;
    }
  }
}
