#include <wiringPi.h>
#include <stdio.h>

#define PIN 0
int main (void)
{
	if (wiringPiSetup() == -1) {
		printf("WiringPi failed!\n");
		return -1;
	}
	
	pinMode(PIN, OUTPUT);
	for (;;) {
		digitalWrite(PIN, LOW); 
		delay (1000);
		digitalWrite(PIN, HIGH); 
		delay(1000);
	}
	
	return 0;
}
