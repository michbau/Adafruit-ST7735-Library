/*************************************************** 
  This is an example sketch for the Adafruit 1.8" SPI display.
  This library works with the Adafruit 1.8" TFT Breakout w/SD card  
  ----> http://www.adafruit.com/products/358  
  as well as Adafruit raw 1.8" TFT display  
  ----> http://www.adafruit.com/products/618
 
  Check out the links above for our tutorials and wiring diagrams 
  These displays use SPI to communicate, 4 or 5 pins are required to  
  interface (RST is optional) 
  Adafruit invests time and resources providing this open source code, 
  please support Adafruit and open-source hardware by purchasing 
  products from Adafruit!

  Written by Limor Fried/Ladyada for Adafruit Industries.  
  MIT license, all text above must be included in any redistribution
 ****************************************************/

// You can use any (4 or) 5 pins 
#define sclk 4
#define mosi 5
#define cs 6
#define dc 7
#define rst 8  // you can also connect this to the Arduino reset

// Color definitions
#define	BLACK           0x0000
#define	BLUE            0x001F
#define	RED             0xF800
#define	GREEN           0x07E0
#define CYAN            0x07FF
#define MAGENTA         0xF81F
#define YELLOW          0xFFE0 
#define WHITE           0xFFFF

#include <Adafruit_ST7735.h>
#include <SPI.h>

// Option 1: use any pins but a little slower
Adafruit_ST7735 tft = Adafruit_ST7735(cs, dc, mosi, sclk, rst);  
// Option 2: must use the hardware SPI pins 
// (for UNO thats sclk = 13 and sid = 11) and pin 10 must be 
// an output. This is much faster - also required if you want
// to use the microSD card (see the image drawing example)
//Adafruit_ST7735 tft = Adafruit_ST7735(cs, dc, rst);    

void setup(void) {
  Serial.begin(9600);
  Serial.print("hello!");

  // Our supplier changed the 1.8" display slightly after Jan 10, 2012
  // so that the alignment of the TFT had to be shifted by a few pixels
  // this just means the init code is slightly different. Check the
  // color of the tab to see which init code to try. If the display is
  // cut off or has extra 'random' pixels on the top & left, try the
  // other option!

  // If your TFT's plastic wrap has a Green Tab, use the following
  tft.initR(INITR_GREENTAB);               // initialize a ST7735R chip
  // If your TFT's plastic wrap has a Red Tab, use the following
  // since the display is shifted a little in memory
  //tft.initR(INITR_REDTAB);               // initialize a ST7735R chip
  
  Serial.println("init");
  tft.writecommand(ST7735_DISPON);
  
  tft.fillScreen(BLACK);

  Serial.println("This is a test of the rotation capabilities of the TFT library!");
  Serial.println("Press <SEND> (or type a character) to advance");
}

void loop(void) {
  rotateLine();
  rotateText();
  rotatePixel();
  rotateFastline();
  rotateDrawrect();
  rotateFillrect();
  rotateDrawcircle();
  rotateFillcircle();
  rotateTriangle();
  rotateFillTriangle();
  rotateRoundRect();
  rotateFillRoundRect();
  rotateChar();
  rotateString();
}

void rotateText() {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);

    tft.setCursor(0, 30);
    tft.setTextColor(RED);  
    tft.setTextSize(1);
    tft.println("Hello World!");
    tft.setTextColor(YELLOW);
    tft.setTextSize(2);
    tft.println("Hello World!");
    tft.setTextColor(GREEN);
    tft.setTextSize(3);
    tft.println("Hello World!");
    tft.setTextColor(BLUE);
    tft.setTextSize(4);
    tft.print(1234.567);
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}

void rotateFillcircle(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);
  
    tft.fillCircle(10, 30, 10, YELLOW);
 
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}

void rotateDrawcircle(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);

    tft.drawCircle(10, 30, 10, YELLOW);
 
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}

void rotateFillrect(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);
  
    tft.fillRect(10, 20, 10, 20, GREEN);
 
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}


void rotateDrawrect(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);

  
    tft.drawRect(10, 20, 10, 20, GREEN);
 
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}



void rotateFastline(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);
  
    tft.drawHorizontalLine(0, 20, tft.width(), RED);
    tft.drawVerticalLine(20, 0, tft.height(), BLUE);
  
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}


void rotateLine(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);

    tft.drawLine(tft.width()/2, tft.height()/2, 0, 0, RED);
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}

void rotatePixel(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);

    tft.drawPixel(10,20, WHITE);
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}

void rotateTriangle(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);

    tft.drawTriangle(20, 10, 10, 30, 30, 30, GREEN);
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}

void rotateFillTriangle(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);

    tft.fillTriangle(20, 10, 10, 30, 30, 30, RED);
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}

void rotateRoundRect(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);

    tft.drawRoundRect(20, 10, 25, 15, 5, BLUE);
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}

void rotateFillRoundRect(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);

    tft.fillRoundRect(20, 10, 25, 15, 5, CYAN);
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}

void rotateChar(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);

    tft.drawChar(25, 15, 'A', WHITE);
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}

void rotateString(void) {
  for (uint8_t i=0; i<4; i++) {
    tft.fillScreen(BLACK);
    Serial.println(tft.getRotation(), DEC);

    tft.drawString(8, 25, "Adafruit Industries", WHITE);
    while (!Serial.available());
    Serial.read();  Serial.read();  Serial.read();
  
    tft.setRotation(tft.getRotation()+1);
  }
}
