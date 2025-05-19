PFont TCFont, JPFont;
String MyTitle = "HW1_向量繪圖造型練習, 410123456E, 王大明";

void setup(){
  size(800,600);
  TCFont = createFont("NotoSansTC-Black.otf", 28);
  JPFont = createFont("NotoSansJP-Regular.otf", 28);
}

void draw(){
  background(160, 160, 160);
  textFont(JPFont);
  textSize(25);
  textAlign(CENTER, CENTER);
  fill(#0000FF);
  text(MyTitle, width/2, 100);
  noStroke();
  fill(#FFE0CC);
  circle(mouseX, mouseY, 100);
  stroke(#7EDEFF);
  strokeWeight(5);
  fill(#3E5CFF);
  rect(250, 200, 300, 200, 30);
  textFont(TCFont);
  fill(255);
  text("月亮躲在牆後面", width/2, 350);
}
