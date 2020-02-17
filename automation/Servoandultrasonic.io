#include<Servo.h>
Servo servo;

long duration,distance;
const int trigP = 5;  //D1 Or GPIO-2 of nodemcu yellow colour wire
const int echoP = 4;  //D2 Or GPIO-0 of nodemcu black colour wire white vcc,bluegnd

void setup()
{
  
pinMode(trigP, OUTPUT);  // Sets the trigPin as an Output
pinMode(echoP, INPUT);   // Sets the echoPin as an Input
Serial.begin(9600);      // Open serial channel at 9600 baud rate

servo.attach(2);

servo.write(20);

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
Serial.println(distance);
delay(100);   
//Pause for 3 seconds and start measuring distance again


 if (distance > 70)
  {
    
    servo.write(180);
    delay(100);
  }
  else 
  {
    
      servo.write(0);
  }
  
}
