main: main.c md5.c
	gcc -c md5.c
	gcc -c main.c
	gcc -o main md5.o main.o

clean: main
	rm -f main main.o md5.o
