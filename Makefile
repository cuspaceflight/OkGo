main: md5

md5: md5.c
	gcc -g -o md5 md5.c

clean: md5
	rm -f md5