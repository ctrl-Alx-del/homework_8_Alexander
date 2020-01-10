Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;  // the second instance of the Flower class
Flower myFlower3;
Flower myFlower4;
Flower myFlower5;
boolean switchColor = false;

void setup() {
  size(1600, 1200);

  int _r1= 60;
  int _r2 = 100;
  int _r3 = 120;
  int _r5 = 15;
  int _petals=7;
  float _x=width/2;
  float _y=height/2;
  int _pc=#FFA000;
  int offset = 350;

  //Regular flower
  myFlower1 = new Flower(_r1, _petals, _x, _y, _pc, 2); 
  myFlower2 = new Flower(_r2, _petals, _x+random(-500, 500), _y+offset, _pc, 5);
  myFlower3 = new Flower(_r3, _petals, _x+50, _y-offset, _pc, 7);
  myFlower5 = new Flower(_r5, _petals, _x+50, _y-offset, _pc, 7); 

  //rectangular flower
  myFlower4 = new Flower(_petals, _x+50, _y-offset/2, _pc, 7, 50);
}

void draw() {
  background(#43AF76);

  myFlower1.display();
  myFlower1.move();  //Denne løsning virkede ikke da den i draw hele tiden satte valuen af blomstens speed tilbage til 2 selv når den nåede til hvor den skulle "bounce", altså reverse sin speed.
  myFlower1.bounce();
  myFlower1.coloring();
  myFlower2.display();
  myFlower2.move();
  myFlower2.bounce();
  myFlower3.display();
  myFlower3.move();
  myFlower3.bounce();
  myFlower4.display();
  myFlower4.move();
  myFlower4.bounce();

  myFlower5.mouseControl(mouseX, mouseY);

  if(myFlower3.overlaps(myFlower2)){
   background(255,0,0); 
  }
  
  println(myFlower5.overlaps2(myFlower2));

  if(myFlower5.overlaps2(myFlower2)){
    background(255,0,0);
  }
    

  if (mousePressed) {
    switchColor = true;
  } else {
    switchColor = false;
  }
}
