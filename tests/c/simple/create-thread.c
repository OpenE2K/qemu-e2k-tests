#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <pthread.h>

typedef struct {
    uint32_t x;
} args_t;

void *thread_entry(void *arg) {
    args_t *args = (args_t *) arg;
    args->x = 0xdeadbeef;
    return NULL;
}

int main(int argc, char *argv[]) {
    pthread_t th;
    args_t args = { 0 };
    int err;

    err = pthread_create(&th, NULL, thread_entry, (void *) &args);
    if (err != 0) {
        fprintf(stderr, "error: pthread_create %s\n", strerror(err));
        exit(EXIT_FAILURE);
    }

    err = pthread_join(th, NULL);
    if (err != 0) {
        fprintf(stderr, "error: pthread_join %s\n", strerror(err));
        exit(EXIT_FAILURE);
    }

    return args.x == 0xdeadbeef ? EXIT_SUCCESS : EXIT_FAILURE;
}
