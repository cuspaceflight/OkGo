#ifndef MD5_H
#define MD5_H

#include <stdint.h>
 
/* Produces the MD5 digest of the message stored at *message (length
 * message_len) and places the result in the 16-byte buffer at *hash */
void md5(const uint8_t *message, size_t message_len, uint8_t *hash);

#endif
