/*
 * Copyright: Steven Lavoie (2018)
 * License: CC0 1.0 Universal (CC0 1.0) [Public Domain] (https://creativecommons.org/publicdomain/zero/1.0/)
 */


#include <Arduino.h>
#include <SoftwareSerial.h>

SoftwareSerial bt_serial(10, 11); // RX, TX

void waitForResponse() {
    delay(1000);
    while (bt_serial.available()) {
      Serial.write(bt_serial.read());
    }
    Serial.write("\n");
}

void setup() {

  Serial.begin(9600);

  Serial.println("Configuring BT12 module");
  bt_serial.begin(9600);
  delay(1000);

  Serial.println("Version:");
  bt_serial.print("AT+VERSION\r\n");
  waitForResponse();
  
  Serial.print("Current SPP name: ");
  bt_serial.print("AT+SPPNAME\r\n");
  waitForResponse();
  //Serial.println("Set SPP name: TANKBOT");
  //bt_serial.print("AT+SPPNAMETANKBOT\r\n");
  //waitForResponse();

  Serial.print("SPP MAC: ");
  bt_serial.print("AT+SPPMAC\r\n");
  waitForResponse();
  Serial.print("LE MAC: ");
  bt_serial.print("AT+LEMAC\r\n");
  waitForResponse();
  
  Serial.println("Done!");
}

void loop() {}
