PFont fontMenu, fontTitulo;
PImage img, maca;

ArrayList <PImage> cabeca1 = new ArrayList<PImage>();
ArrayList <PImage> cabeca2 = new ArrayList<PImage>();
ArrayList <PImage> cabeca3 = new ArrayList<PImage>();
ArrayList <PImage> cabeca4 = new ArrayList<PImage>();

boolean select0=false;
boolean select1=false;
boolean select2=false;
boolean select3=false;

int opc = 0;

void setup() {
  background(183, 232, 129);
  size(1300, 900);
  frameRate(60);
  
  // carregar imagens
  maca = loadImage("img/maca.png");
  // cabeca
  for (int i=1; i<5; i++){
    for (int a=0; a<2; a++){
      img = loadImage("img/cabeca"+i+"_"+a+".png");
      if(i==1)cabeca1.add(img);
      if(i==2)cabeca2.add(img);
      if(i==3)cabeca3.add(img);
      if(i==4)cabeca4.add(img);
    }
  }
  
  // fontes de texto
  fontMenu = loadFont("OCRAExtended-48.vlw");
  fontTitulo = loadFont("Monospaced.bold-130.vlw");
}

void draw(){
  if (opc==0) inicio();
  if (opc==1) jogar();
  if (opc==2) opcoes();
  if (opc==3) instrucoes();
  if (opc==4) exit();
}

void fundo(){
  noStroke();
  rectMode(CORNERS);
  fill(183, 232, 129);
  rect(0,0,width,height);
}

//--------------funcao para desenhar um butao personalizado------------

void butao(String text, int x, int y){
  boolean fillLetras;
  int size = 40;
  textFont(fontMenu);
  textSize(size);
  textAlign(CENTER,CENTER);
  float raioX = (1.24*textWidth(text)) / 2;
  if (text=="Jogar Novamente"){
    raioX-=20;
  }
  float raioY = 0.875*size;
  rectMode(RADIUS);
  
  //voltar inicio
  if(mouseX>x-raioX && mouseX<x+raioX && mouseY>y-raioY && mouseY<y+raioY) {
    fill(124, 158, 250);
    fillLetras = true;
    if (mousePressed==true){
      if (text=="Voltar"){
        initJogo=true;
        gameover = false;
        t0 = second();
        count = 1;
        fundo();
        opc=0;
      }else if(text=="Jogar Novamente"){
        initJogo=true;
        gameover = false;
      }
    }
  }else{
    fill(255,255,255);
    fillLetras = false;  
  }
  
  stroke(124, 158, 250);
  strokeWeight(7);
  strokeJoin(ROUND);
  
  if(opc!=0)rect(x,y,raioX,raioY);
  
  if (fillLetras){
    fill(255, 255, 255);
  }else{
    fill(10, 44, 137);
  }
  if(opc!=0)text(text,x,y);
}
