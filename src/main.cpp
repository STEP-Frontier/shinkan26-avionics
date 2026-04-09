#include <Arduino.h>

void setup() {
  pinMode(PA1, OUTPUT);
  Serial.begin(115200);
}

void loop() {
  digitalWrite(PA1, HIGH);
  Serial.println("PA1 HIGH");
  delay(500);
  digitalWrite(PA1, LOW);
  Serial.println("PA1 LOW");
  delay(500);
}