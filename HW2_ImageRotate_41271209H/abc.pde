PFont JPFont;
String w = "HW1_向量繪圖造型練習, 41271209H, 李佳璇";
PImage img,img2;
int i = 0;
void setup() {
  size(800, 800);
  JPFont = createFont("NotoSansJP-Regular.otf", 28);
  img = loadImage("bug.png");
  img2 = loadImage("bug2.png");
  imageMode(CENTER);
}

void draw() {
  background(#d8eeff);
  //太陽
  noStroke();
  fill(#fff7b5);
  circle(0,0,300);
  

  // 文字
  textFont(JPFont);
  textSize(35);
  textAlign(CENTER, CENTER);
  fill(#000000);
  text(w, width / 2, 100);

  // 身體
  stroke(#4b8b5e);
  fill(#b9fd9a);
  ellipse(400, 400, 150, 200);
  fill(#FFFFFF);
  ellipse(400, 425, 120, 150);

  // 眼睛
  fill(#b9fd9a);
  circle(450, 300, 50);
  circle(350, 300, 50);
  fill(#000000);
  circle(450, 300, 30);
  circle(350, 300, 30);

  // 搖擺腳
  float angle = sin(frameCount * 0.5) * 5; 
  float leftArmX = 340 + angle; // 左手
  float rightArmX = 460 - angle; // 右手

  fill(#b9fd9a);
  ellipse(rightArmX, 500, 70, 50);
  ellipse(leftArmX, 500, 70, 50);
  
  //草
  fill(#73cd74);
  rect(600, 400, 10, 1000);

if (i <= 360){
    pushMatrix();
    translate(600, 400);
    fill(#73cd74);
    rotate(radians(i));
    rect(-50, -25, 100, 50);
    
    println("i = "+i+", ang ="+radians(i));
    popMatrix();
    i += 5;
  }
  else{
    i = 0;
  }
   fill(#73cd74);
  rect(200, 400, 10, 1000);

if (i <= 360){
    pushMatrix();
    translate(200, 400);
    fill(#73cd74);
    rotate(radians(i));
    rect(-50, -25, 100, 50);
    
    println("i = "+i+", ang ="+radians(i));
    popMatrix();
    i += 5;
  }
  else{
    i = 0;
  }
  
  // 地面
  noStroke();
  fill(#78c7ff,60);
  rect(0, 510, 800, 290);
  
 //蟲
  if (mousePressed) {
    image(img2, mouseX, mouseY, 80, 80); // 顯示 img2
  } else {
    image(img, mouseX, mouseY, 80, 80); // 顯示 img
  }


}
