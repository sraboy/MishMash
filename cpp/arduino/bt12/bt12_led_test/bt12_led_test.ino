/*
 * Copyright: Steven Lavoie (2018)
 * License: CC0 1.0 Universal (CC0 1.0) [Public Domain] (https://creativecommons.org/publicdomain/zero/1.0/)
 * 
 * 
 * Generally speaking, follow HC-05 tutorials but note possible differences in
 * default communication speed or supply voltage. Also, check the breakout board's
 * model number for help in identifying pins. Mine is a ZS-040, like the one shown
 * here: https://howtomechatronics.com/tutorials/arduino/arduino-and-hc-05-bluetooth-module-tutorial/
 * 
 * --------------------------------------------------------------------
 *  Pin Connection:
 *
 *   |  BT12 Pin  | Arduino Pin |        Notes        |
 *   | ---------- | ----------- | ------------------- |
 *   | STATUS_IND | Not Connex  |                     |
 *   | RXD        | D1 (TX)     |                     |
 *   | TXD        | D0 (RX)     | Vx Div to 3.3V      |
 *   | VCC        | 3.3V        | 50mA draw           |
 *   | GND        | GND         |                     |
 *   
 * --------------------------------------------------------------------
 * Uploading:
 *  Disconnect (at least) GND and TXD or it will interfere with the upload. You may
 *  need to disconnect more. Afterwards, reattach the wires and reset your Arduino.
 *  You might also need to power cycle (i.e., unplug/replug the USB cable) and re-open
 *  your serial monitor.
 * --------------------------------------------------------------------
 * Bluetooh Serial Terminal Connection:
 * 
 *  Mac OS X/Linux:
 *    Connecting via bluetooth serial can be done in the terminal, after
 *    pairing with the device (default password was 1234 for mine. You might try 0000 too.
 *      > ls /dev/tty.*
 *      [check for something with the words "bluetooth" or "BT12" and "serial"]
 *      > screen /dev/tty.BT12-SerialPort 9600
 *      > 1
 *      [now your LED should be on and you should see "LED: ON" in your terminal]
 * Android:
 *    This app worked well: https://play.google.com/store/apps/details?id=de.kai_morich.serial_bluetooth_terminal
 *    
 *    First, pair with the device, then launch the app, choose the device
 *    from the menu on the left, hit the connect button up top and, once it's
 *    succeeded, just pass 0 or 1 to switch the LED on and off.
 * --------------------------------------------------------------------
 */

#include <Arduino.h>

int led_state = 0;

void setup() {
	pinMode(LED_BUILTIN, OUTPUT);
	digitalWrite(LED_BUILTIN, LOW);
	Serial.begin(9600); // HC05 is 38400 but DX-BT12 is 9600
	Serial.println("Setup done");
}
void loop() {
	if (Serial.available() > 0){ 
		led_state = Serial.read();
	}
	
	if (led_state == '0') {
		digitalWrite(LED_BUILTIN, LOW);
		Serial.println("LED: OFF");
		led_state = 0;
	} else if (led_state == '1') {
		digitalWrite(LED_BUILTIN, HIGH);
		Serial.println("LED: ON");
		led_state = 0;
	} 
}

