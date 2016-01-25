#ifndef KEY_H
#define KEY_H

#include <stdint.h>

/* Put your key here, replacing the zeros.
 * Generate on with:
 * dd count=1 if=/dev/random | hexdump
 * and use the first line of output.
const uint8_t key[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
*/

/* Key size of 16 recommended with MD5.
 * Longer gets you not much benefit, shorter is bad. */
const uint8_t key_len = 16;

#endif
