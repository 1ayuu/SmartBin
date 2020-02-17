
#include <OLED_SSD1306_Chart.h>

#include <ESP8266WiFi.h>
#include <Wire.h>  // Only needed for Arduino 1.6.5 and earlier
#include "SSD1306Wire.h" // legacy include: `#include "SSD1306.h"`
SSD1306Wire  display(0x3c, D2, D1);  //D2=SDK  D1=SCK  As per labeling on NodeMCU



long duration ,distance, level,percentage;
const float Maxrange=28;//Maxrange is max height of dustbin
const int trigP = 5;  //D1Or GPIO-2 of nodemcu
const int echoP = 4;  //D2 Or GPIO-0 of nodemcu

void setup()
{
  
pinMode(trigP, OUTPUT);  // Sets the trigPin as an Output
pinMode(echoP, INPUT);   // Sets the echoPin as an Input
Serial.begin(9600);      // Open serial channel at 9600 baud rate
display.init();
   display.flipScreenVertically();
  display.setFont(Aclonica_10);
}

void loop() {

digitalWrite(trigP, LOW);   // Makes trigPin low
delayMicroseconds(2);       // 2 micro second delay 

digitalWrite(trigP, HIGH);  // tigPin high
delayMicroseconds(10);      // trigPin high for 10 micro seconds
digitalWrite(trigP, LOW);   // trigPin low

duration = pulseIn(echoP, HIGH);   //Read echo pin, time in microseconds
distance= duration*0.034/2;        //Calculating actual/real distance

Serial.print("Distance = ");        //Output distance on arduino serial monitor 
Serial.print(distance);
Serial.println("cm");
   
delay(1000);
//Pause for 3 seconds and start measuring distance again
level=Maxrange-distance;

percentage=level*100/28;


Serial.print("dustbin is ");
Serial.print(percentage);
Serial.println("% full");
delay(1000);
drawFontFaceDemo();
  delay(1000);
//if (percentage >80){
  //
  //alert()
  //}
delay(1000);
}
void drawFontFaceDemo() {
  // clear the display
  display.clear();
    // Font Demo1
    // create more fonts at http://oleddisplay.squix.ch/
    display.setTextAlignment(TEXT_ALIGN_LEFT);
    //display.setFont(ArialMT_Plain_10);
    //display.drawString(0, 5, "GCES ");
    display.setFont(ArialMT_Plain_16);
    display.drawString(0, 10, "percentage");
    display.setFont(ArialMT_Plain_24);
    display.drawString(0, 35, percentage);
  // write the buffer to the display
  display.display();
}
