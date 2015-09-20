/*
 * Simple MD5 implementation
 *
 * Modified by David Turner, 2015-09-20
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "md5.h"
 
int main(int argc, char **argv)
{
    uint8_t i; /* for loop counter for display */
 
    if (argc < 2) {
        printf("usage: %s 'string'\n", argv[0]);
        return 1;
    }
 
    char *msg = argv[1];
    size_t len = strlen(msg);
    uint8_t hash[16];
 
    md5(msg, len, hash);
 
    // display result
    for(i=0; i<16; i++)
        printf("%2.2x", hash[i]);
    printf("\n");
 
    return 0;
}
