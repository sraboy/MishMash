/*
 * Copyright: Steven Lavoie (2018)
 * BT12 with BlueTooth Serial Controller
 * -------------------------------------------------------------------------------------------
 * App: https://play.google.com/store/apps/details?id=nextprototypes.BTSerialController&hl=en
 * Controller: See "tankbot_controller.dat". You'll need to load the settings in the app or
 *             create your own and adjust Commands as needed.
 * -------------------------------------------------------------------------------------------
 */

#include <Arduino.h>
#include <SoftwareSerial.h>

SoftwareSerial bt_serial(10, 11); // RX, TX

enum Commands {
  //
  // When movement buttons are released, this is sent
  // so we know to stop driving the motors.
  STOP = 0x0,
  FWD = 0x1,
  REV = 0x2,
  LEFT = 0x3,
  RIGHT = 0x4
};

Commands last_cmd = Commands::STOP;

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
  Serial.begin(9600);
  bt_serial.begin(9600);
  Serial.println("Setup done");
}

void loop() {

  if(bt_serial.available() > 0){
    int cur_cmd = bt_serial.read();
    if (cur_cmd != last_cmd) {
      Serial.print("New command: ");
      Serial.println(cur_cmd);
      last_cmd = cur_cmd;
    }
  }

  switch(last_cmd) {
    case Commands::STOP:
      digitalWrite(LED_BUILTIN, LOW);
      break;
    case Commands::FWD:
      digitalWrite(LED_BUILTIN, HIGH);
      break;
    default:
      digitalWrite(LED_BUILTIN, HIGH);
      break;
  }
}

