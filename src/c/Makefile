CC=gcc -std=c11
CFLAGS=-pedantic -Wall -O1 -mavx2

all: lib link run

lib:
	$(CC) $(CFLAGS) -c simd.c

link:
	$(CC) $(CFLAGS) -L. -lsimd.o main.c -o main

run:
	./main

clean:
	rm simd.o main
