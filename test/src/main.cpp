#include <cstdio>
#include "pico/stdlib.h"

int main() {
	stdio_init_all();

    while (true) {
        printf("Hello World");
        sleep_ms(1000);
    }

	return 0;
}
