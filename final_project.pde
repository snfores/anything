String s = new String("game over");
String f= new String("game clear");
String ep= new String("Please click");
String p= new String("Please click A or B");
String a= new String("A");
String b= new String("B");
String g= new String("↓G");
int i =0, end=0, j=0, count=0;

void mouseClicked() {
  if (count==0) {
    if (  (mouseX<45)&& (0<mouseX)) {
      if ( (mouseY<45) && (0<mouseY)) {
        background(#FFFFFF);
      }
    }
    if ((mouseX<width)&&(width-45<mouseX)) {
      if ((mouseY<height)&&(height-45<mouseY)) {
        background(#FFFFFF);
      }
    }
  }
  if (  (mouseX<45)&& (0<mouseX)) {
    if ( (mouseY<45) && (0<mouseY)) {
      count=1;
    }
  }
  if ((mouseX<width)&&(width-45<mouseX)) {
    if ((mouseY<height)&&(height-45<mouseY)) {
      count=1;
    }
  }
  if (end==1) {
    exit();
  }
}

void draw() { 
  int X=mouseX, Y=mouseY;

  if (end==0) {
    stroke(#000000);
    fill(#98FB98);
    rect(3, 3, 45, 45);
    rect(width-48, height-48, 45, 45);

    if (count==0) {
      textFont(createFont("Harrington", 24));
      int px=0;
      for (int j = 0; j<p.length(); j++) {
        fill(144, 238, 144);
        text(p.charAt(j), (width-textWidth(p))/2+px, height/2);
        px +=textWidth(p.charAt(j));
      }

      fill(#FFFFFF);
      text(a, 22.5, 22.5);
      text(b, width-22.5, height-22.5);
    }

    if (count==1) {
      game();
      color d = get(X, Y);
      if ( d == #FFFFFF) {
        gameover();
      }
      if ((X<width/2+12.5) && (width/2-12.5<X)  &&   (Y<height/2+12.5) && (height/2-12.5<Y)) {
        finish();
      }
    }
  }
}

void game() {
  stroke(#000000);
  fill(#98FB98);
  rect(width/2-12.5, height/2-12.5, 25, 25);

  noStroke();
  beginShape();
  vertex(45, 0);
  vertex(95, 40);
  vertex(145, 40);
  vertex(200, 0);
  vertex(250, 40);
  vertex(300, 80);
  vertex(250, 120);
  vertex(230, 120);
  vertex(280, 80);
  vertex(250, 60);
  vertex(200, 20);
  vertex(145, 60);
  vertex(95, 60);
  vertex(75, 45);
  vertex(45, 45);
  endShape();


  rect(0, 90, 250, 30);
  rect(0, 120, 60, 45);
  fill(#FFFFFF);
  ellipseMode(CORNER);
  ellipse(220, 75, 30, 38);
  ellipse(170, 75, 30, 38);
  ellipse(120, 75, 30, 38);
  ellipse(70, 75, 30, 38);
  triangle(210, 105, 225, 120, 195, 120);
  triangle(160, 105, 175, 120, 145, 120);
  triangle(110, 105, 125, 120, 95, 120);
  ellipse(5, 100, 70, 60);
  beginShape();
  fill(#98FB98);
  vertex(width/2, height/2);
  vertex(width/2, height/2+5);
  vertex(60, 165);
  vertex(60, 155);
  endShape();



  rect(215, 265, 50, 10);//b

  int r = 58;
  float a, b, t = -HALF_PI, dt=PI*4/5;

  pushMatrix();
  translate(200, 250);
  beginShape();
  for (int j = 0; j < 5; j++) {
    a=r*cos(t);
    b=r*sin(t);
    vertex(a, b);
    t=t+dt;
  }
  endShape();
  fill(#FFFFFF);
  int R =35;
  beginShape();
  for (int j = 0; j < 5; j++) {
    a=R*cos(t);
    b=R*sin(t);
    vertex(a, b);
    t=t+dt;
  }
  endShape();
  popMatrix();
  
  fill(#98FB98);
  rect(33, 220, 120, 80);
  ellipseMode(CENTER);

  ball[1].draw(#FFFFFF);
  ball[1].move(153, 300, 33, 220);

  fill(#98FB98);
  rect(3, 290, 30, 10);

  rect(3, 170, 18, 130);
  rect(3, 170, 220, 20);

  stroke(#000000);
  fill(#FFFFFF);
  rect(203, 125, 97, 70);
  noStroke();
  fill(#98FB98);
  rect(3, 170, 220, 20);
  ball[2].draw(#98FB98);
  ball[2].move(300, 195, 203, 125);
  ball[0].draw(#98FB98);
  ball[0].move(300, 195, 203, 125);

  rect(279, 150, 20, 30);

  rect(160, height/2-10.5, 60, 18);

  textFont(createFont("Harrington", 14));
  fill(#000000);
  text(g, width/2-10, height/2-20);
}


void  gameover() {

  textFont(createFont("Harrington", 48));
  background(#FFFFFF);
  int x=0;
  for (int i = 0; i<s.length(); i++) {
    fill(144, 238, 144);
    text(s.charAt(i), (width-textWidth(s))/2+x, height/2);
    x +=textWidth(s.charAt(i));
  }
  textFont(createFont("Harrington", 20));
  int epxx=0;
  for (int i = 0; i<ep.length(); i++) {
    fill(144, 238, 144);
    text(ep.charAt(i), (width-textWidth(s))/2+epxx, height/2+40);
    epxx +=textWidth(ep.charAt(i));
  }

  end=1;
}

void  finish() {
  background(#FFFFFF);
  textFont(createFont("Harrington", 48));

  int xx=0;
  for (int j = 0; j<f.length(); j++) {
    fill(144, 238, 144);
    text(f.charAt(j), (width-textWidth(f))/2+xx, height/2);
    xx +=textWidth(f.charAt(j));
  }
  textFont(createFont("Harrington", 20));
  int epx=0;
  for (int j = 0; j<ep.length(); j++) {
    fill(144, 238, 144);
    text(ep.charAt(j), (width-textWidth(f))/2+epx, height/2+40);
    epx +=textWidth(ep.charAt(j));
  }



  end=1;
}

void setup() {
  size(300, 300);
  smooth();
  frameRate(30);
  rectMode(CORNER);
  background(#FFFFFF);
  fill(#FFFFFF);

  ball =new Ball[3];
  ball[1] =new Ball(22, 45, 250, 2, 2);
  ball[2] =new Ball(30, 233, 145, 1.5, 0);
  ball[0] =new Ball(20, 263, 185, 1, 0);
}

Ball[] ball;

class Ball {
  color ct;
  int dd;
  float xxx, yyy;
  float vx, vy;

  Ball() {
  };
  Ball(int dd, float xxx, float yyy, float vx, float vy) { 
    this.dd=dd;
    this.xxx=xxx; 
    this.yyy=yyy;
    this.vx=vx;
    this.vy=vy;
  }
  public void move(float w, float h, float W, float H) {
    xxx += vx;
    yyy += vy;
    if (xxx-W<dd/2|| xxx+dd/2>w) {
      vx *= -1;
      if (xxx-W<dd/2) xxx = dd-xxx+2*W;
      else if (xxx+dd/2>w)xxx = 2*(w-dd/2)-xxx;
    }
    if (yyy-H<dd/2 || yyy+dd/2>h) {
      vy *= -1;
      if (yyy-H<dd/2) yyy = dd-yyy+2*H;
      else if (yyy+dd/2>h)yyy = 2*(h-dd/2)-yyy;
    }
  }
  public void draw(color ct) {

    fill(ct);
    ellipse(xxx, yyy, dd, dd);
  }
}