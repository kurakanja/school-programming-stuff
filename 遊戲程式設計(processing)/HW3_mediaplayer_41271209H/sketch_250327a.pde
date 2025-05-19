import ddf.minim.*;

Minim minim;
AudioPlayer in;

boolean playPressed = false;
boolean pausePressed = false;
boolean mutePressed = false;
boolean stopPressed = false;
boolean replayPressed = false;
boolean isMuted = false;  // 追蹤
PFont JPFont;
String w = "HW3_media player, 41271209H, 李佳璇";

void setup() {
  size(800, 600);
  JPFont = createFont("NotoSansJP-Regular.otf", 28);

  minim = new Minim(this);
  in = minim.loadFile("calm-waves-soft-piano.mp3");
}

void draw() {
  background(220);

  // 外框
  fill(50);
  rect(125, 100, 550, 300, 30);

  // 標題
  textFont(JPFont);
  textSize(30);
  textAlign(CENTER, CENTER);
  fill(0);
  text(w, width / 2, 50);

  // 音樂
  stroke(255);
  for (int i = 0; i < in.bufferSize() - 1; i++) {
    float x1 = map(i, 0, in.bufferSize(), 130, 670);
    float y1 = 250 + in.left.get(i) * 50;
    float x2 = map(i + 1, 0, in.bufferSize(), 130, 670);
    float y2 = 250 + in.left.get(i + 1) * 50;
    line(x1, y1, x2, y2);
  }

  // 按鈕
  drawButton(100, 450, "播放", playPressed ? color(0, 255, 0) : color(180));
  drawButton(225, 450, "暫停", pausePressed ? color(0, 255, 0) : color(180));
  drawButton(350, 450, "重新播放", replayPressed ? color(0, 255, 0) : color(180));
  drawButton(475, 450, "靜音", mutePressed ? color(0, 255, 0) : color(180));
  drawButton(600, 450, "停止", stopPressed ? color(0, 255, 0) : color(180));

  // 按鈕變色
  resetButtons();
}

void drawButton(int x, int y, String label, int btnColor) {
  fill(btnColor);
  rect(x, y, 100, 50, 15);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(22);
  text(label, x + 50, y + 25);
}

void mousePressed() {
  if (mouseY > 450 && mouseY < 500) {
    if (mouseX > 100 && mouseX < 200) { // 播放
      playPressed = true;
      if (!in.isPlaying()) {
        in.play();
      }
    } else if (mouseX > 225 && mouseX < 325) { // 暫停
      pausePressed = true;
      if (in.isPlaying()) {
        in.pause();
      }
    } else if (mouseX > 350 && mouseX < 450) { // 重新播放
      replayPressed = true;
      in.rewind();
      in.play();
    } else if (mouseX > 475 && mouseX < 575) { // 靜音
      mutePressed = true;
      isMuted = !isMuted;
      if (isMuted) {
        in.setGain(-80); 
      } else {
        in.setGain(0);
      }
    } else if (mouseX > 600 && mouseX < 700) { // 停止
      stopPressed = true;
      in.pause();
      in.rewind();
    }
  }
}

void resetButtons() {
  delay(200); // 按鈕變色
  playPressed = false;
  pausePressed = false;
  mutePressed = false;
  stopPressed = false;
  replayPressed = false;
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}
