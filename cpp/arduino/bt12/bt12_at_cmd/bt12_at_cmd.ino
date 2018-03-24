/*
 * Copyright: Steven Lavoie (2018)
 * License: CC0 1.0 Universal (CC0 1.0) [Public Domain] (https://creativecommons.org/publicdomain/zero/1.0/)
 * 
 *
 */


#include <Arduino.h>
#include <SoftwareSerial.h>

#define ROBOT_NAME "RandomBot"

// Default baudrate for DX-BT12
#define BLUETOOTH_SPEED 9600

SoftwareSerial mySerial(10, 11); // RX, TX

/*
  The possible baudrates are:
    AT+UART=1200,0,0 -------1200
    AT+UART=2400,0,0 -------2400
    AT+UART=4800,0,0 -------4800
    AT+UART=9600,0,0 -------9600 - Default for hc-06
    AT+UART=19200,0,0 ------19200
    AT+UART=38400,0,0 ------38400
    AT+UART=57600,0,0 ------57600 - Johnny-five speed
    AT+UART=115200,0,0 -----115200
    AT+UART=230400,0,0 -----230400
    AT+UART=460800,0,0 -----460800
    AT+UART=921600,0,0 -----921600
    AT+UART=1382400,0,0 ----1382400
*/

void setup() {
  //pinMode(9, OUTPUT);  // this pin will pull the HC-05 pin 34 (key pin) HIGH to switch module to AT mode
  //digitalWrite(9, HIGH);
  Serial.begin(9600);

  Serial.println("Starting config");
  mySerial.begin(BLUETOOTH_SPEED);
  delay(1000);

  // Should respond with its version
  Serial.println("Version:");
  mySerial.print("AT+VERSION\r\n");
  waitForResponse();
  
  Serial.print("Current SPP name: ");
  mySerial.print("AT+SPPNAME\r\n");
  waitForResponse();
  //Serial.println("Set SPP name: TANKBOT");
  //mySerial.print("AT+SPPNAMETANKBOT\r\n");
  //waitForResponse();

  Serial.print("SPP MAC: ");
  mySerial.print("AT+SPPMAC\r\n");
  waitForResponse();
  Serial.print("LE MAC: ");
  mySerial.print("AT+LEMAC\r\n");
  waitForResponse();
  
  Serial.println("Done!");
}

void waitForResponse() {
    delay(1000);
    while (mySerial.available()) {
      Serial.write(mySerial.read());
    }
    Serial.write("\n");
}

void loop() {}
