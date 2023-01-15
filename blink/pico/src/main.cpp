#include "pico/stdlib.h"

#ifndef PICO_DEFAULT_LED_PIN
#warning blink example requires a board with a regular led, set variable below to correct pin
const int ledPin = -1;
#else
const int ledPin = PICO_DEFAULT_LED_PIN;
#endif

int main() {
    stdio_init_all();
    gpio_init(ledPin);
    gpio_set_dir(ledPin, GPIO_OUT);
    bool isLedOn = false;
    int sleepDelay = 300;

    while (true) {
        isLedOn = !isLedOn;
        gpio_put(ledPin, isLedOn ? 1 : 0);
        sleep_ms(sleepDelay);
    }
}
