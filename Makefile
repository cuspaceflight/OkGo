main: main.c md5.c hmac.c
	gcc -c md5.c
	gcc -c hmac.c
	gcc -c main.c
	gcc -o main md5.o hmac.o main.o

clean: main
	rm -f main main.o md5.o hmac.o
