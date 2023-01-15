#include "pico/stdlib.h"
#include "pico/cyw43_arch.h"

const int ledPin = CYW43_WL_GPIO_LED_PIN;

int main() {
    stdio_init_all();
    if (cyw43_arch_init()) {
        printf("WiFi init failed");
        return -1;
    }

    bool isLedOn = false;
    int sleepDelay = 300;

    while (true) {
        isLedOn = !isLedOn;
        gpio_put(ledPin, isLedOn ? 1 : 0);
        sleep_ms(sleepDelay);
    }
}
