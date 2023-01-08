#include <cstdio>
#include "pico/stdlib.h"
#include "pico/multicore.h"

const int flagValue{ 123 };

void core1_entry();

int main() {
	stdio_init_all();
	printf("Hello, multicore!\n");

    multicore_launch_core1(core1_entry);

    // wait for it to start up

    uint32_t g = multicore_fifo_pop_blocking();

    if (g != flagValue) {
        printf("Hmm, thats not right on core 0!\n");
    }
    else {
        multicore_fifo_push_blocking(flagValue);
        printf("its all gone well on core 0!");
    }

	return 0;
}

void core1_entry() {
    multicore_fifo_push_blocking(flagValue);
    uint32_t g = multicore_fifo_pop_blocking();

    if (g != flagValue) {
        printf("Hmm, thats not right on core 1!\n");
    }
    else {
        printf("its all gone well on core 1!");
    }

    while (1) {
        tight_loop_contents();
    }
}
