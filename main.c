/*
 * Simple MD5 implementation
 *
 * Modified by David Turner, 2015-09-20
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "hmac.h"
 
int main(int argc, char **argv)
{
    uint8_t i; /* for loop counter for display */
    uint8_t key[16] = {0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
                       0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b};
    uint8_t key_len = 16;
    uint8_t *msg;
    uint8_t len;
    uint8_t hash[16];
 
    if (argc < 2) {
        printf("usage: %s 'string'\n", argv[0]);
        return 1;
    }
 
    msg = (uint8_t *)argv[1];
    len = strlen(msg);
 
    hmac_md5(msg, len, key, key_len, hash);
 
    // display result
    printf("HMAC-MD5:\t");
    for(i=0; i<16; i++)
        printf("%2.2x", hash[i]);
    printf("\n");

    return 0;
}
