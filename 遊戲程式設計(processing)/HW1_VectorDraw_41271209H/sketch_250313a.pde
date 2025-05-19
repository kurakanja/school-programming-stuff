PFont JPFont;
String w = "HW1_向量繪圖造型練習, 41271209H, 李佳璇";

void setup()
{
  size(800,800);
  JPFont = createFont("NotoSansJP-Regular.otf", 28);
}
void draw()
{
  fill(#d8eeff);
  square(0,0,800);
  fill(#78c7ff);
  square(0,510,800);

  textFont(JPFont);
  textSize(35);
  textAlign(CENTER, CENTER);
  fill(#000000);
  text(w, width/2, 100);

  fill(#b9fd9a);
  ellipse(400,400, 150,200);
  fill(#FFFFFF);
  ellipse(400,425, 120,150);
  
  fill(#b9fd9a);
  circle(450,300, 50);
  fill(#b9fd9a);
  circle(350,300, 50);
  
  fill(#b9fd9a);
  ellipse(460,500, 60,50);
  fill(#b9fd9a);
  ellipse(340,500, 60,50);
  
   fill(#000000);
  circle(450,300, 30);
  fill(#000000);
  circle(350,300, 30);

}
