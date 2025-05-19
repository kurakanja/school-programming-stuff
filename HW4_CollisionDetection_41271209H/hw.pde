PImage img, img2, img3, img4;
PImage currentChar;
int foodX, foodY;
boolean isJumping = false;
int lastJumpTime = 0;
int score = 0;
boolean useChar1 = true;

void setup() {
  size(1024, 768);
  img = loadImage("食物.png");
  img2 = loadImage("charactor1.png");
  img3 = loadImage("charactor2.png");
  img4 = loadImage("charactor jump.png");
  currentChar = img2;
  foodX = int(random(width - img.width/4));
  foodY = int(random(height - img.height/4));
  background(#C8C8C8);
  textSize(32);
  fill(0);
}

void draw() {
  background(#C8C8C8);
  
  // 畫食物 
  image(img, foodX, foodY, img.width/4, img.height/4);
  
  // 分數
  text("Food Collected: " + score, 20, 40);
  
  if (isJumping && millis() - lastJumpTime > 1000) {
    isJumping = false;
  }
  
  // 切換角色圖片
  if (!isJumping) {
    if (frameCount % 30 == 0) {
      useChar1 = !useChar1;
    }
    currentChar = useChar1 ? img2 : img3;
  } else {
    currentChar = img4;
  }
  
  // 畫角色
  image(currentChar, mouseX, mouseY, currentChar.width/4, currentChar.height/4);
  
  // 碰撞偵測
  float charW = currentChar.width/4;
  float charH = currentChar.height/4;
  float foodW = img.width/4;
  float foodH = img.height/4;
  
  if (!isJumping &&
      mouseX < foodX + foodW &&
      mouseX + charW > foodX &&
      mouseY < foodY + foodH &&
      mouseY + charH > foodY) {
      
    isJumping = true;
    lastJumpTime = millis();
    score++;
    println("Food Collected: " + score);
    
    // 吃到才換位置
    foodX = int(random(width - img.width/4));
    foodY = int(random(height - img.height/4));
  }
}
