import java.net.URLEncoder;
import java.net.URL;
import java.net.HttpURLConnection;
import java.io.OutputStreamWriter;

PFont JPFont;
String[] csvLines;
String stuff = "餅乾";
String money = "50";

// 表單位置與欄位 ID
String formURL = "https://docs.google.com/forms/d/e/1FAIpQLSeREaLNc4UnqGOuf5f1RT__EeetTlStXCNa1K_c6vytKRyvXw/formResponse";
String entryProduct = "entry.1747408415";
String entryPrice = "entry.1348118742";

// 試算表
String sheetURL = "https://docs.google.com/spreadsheets/d/1b5nORmS3BoPR_7lCJx4vHN3qkDpE235zUS8QN6MAcio/export?format=csv";

void setup() {
  size(600, 400);
  JPFont = createFont("NotoSansJP-Regular.otf", 20);
  textFont(JPFont);

  submitToGoogleForm(stuff, money);

  // 等待 2~3 秒讓表單寫入試算表
  delay(3000);
  csvLines = loadStrings(sheetURL); 
  println("載入資料共 " + csvLines.length + " 行");
}

void draw() {
  background(255);
  fill(0);
  textSize(20);
  text("商品清單：", 20, 40);

  if (csvLines != null && csvLines.length > 1) {
    for (int i = 1; i < csvLines.length; i++) {
      String[] parts = split(csvLines[i], ',');
      if (parts.length >= 3) {
        String product = parts[1];
        String price = parts[2];
        text(product + " - $" + price, 40, 80 + (i - 1) * 30);
      }
    }
  }
}

//送資料到 Google 表單
void submitToGoogleForm(String product, String price) {
  try {
    String data = entryProduct + "=" + URLEncoder.encode(product, "UTF-8") +
                  "&" + entryPrice + "=" + URLEncoder.encode(price, "UTF-8");

    URL url = new URL(formURL);
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod("POST");
    conn.setDoOutput(true);
    conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

    OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
    writer.write(data);
    writer.flush();
    writer.close();

    int responseCode = conn.getResponseCode();
    println("表單送出結果：" + responseCode);
    conn.disconnect();
  } catch (Exception e) {
    e.printStackTrace();
  }
}
