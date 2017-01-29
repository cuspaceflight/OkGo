#include <stdint.h>
#include <string.h>

#include "hmac.h"
#include "md5.h"

/* Generate an HMAC-MD5 signature for *message, length message_len, with
 * key *key, length key_len, and store the result in the 16-byte buffer at
 * *hash */
void hmac_md5(const uint8_t *message, uint8_t message_len, const uint8_t *key,
			  uint8_t key_len, uint8_t *hash)
{
	/*
     * the HMAC_MD5 transform looks like:
     *
     * MD5(K XOR opad, MD5(K XOR ipad, text))
     *
     * where K is an n byte key
     * ipad is the byte 0x36 repeated 64 times
     * opad is the byte 0x5c repeated 64 times
     * and text is the data being protected
     */

    uint8_t k_ipad[64]; /* inner padding: key XORd with ipad */
    uint8_t k_opad[64]; /* outer padding:  key XORd with opad */
    uint8_t i;
    /* In liu of an iterative interface to MD5 we need to store the concatenated
     * message and padded key, i.e. k_ipad+message and k_opad+digest,
     * so we need a buffer of size max(64+message_len, 64+16)
     * Assume 64 bytes is sufficient message size: */
    uint8_t cat_buffer[128];

    /* If key is longer than 64 bytes reform it to key=MD5(key) */
    uint8_t shrunk_key[16];
    if (key_len > 64)
    {
        md5(key, key_len, shrunk_key);
        key = shrunk_key;
        key_len = 16;
    }

    /* start out by storing key in pads */
    memset(k_ipad, 0, 64);
    memset(k_opad, 0, 64);
    memcpy(k_ipad, key, key_len);
    memcpy(k_opad, key, key_len);

    /* XOR key with ipad and opad values */
    for (i=0; i<64; i++)
    {
        k_ipad[i] ^= 0x36;
        k_opad[i] ^= 0x5c;
    }


    /* perform inner MD5 */
    memcpy(cat_buffer, k_ipad, 64);
    memcpy(cat_buffer + 64, message, message_len);
    md5(cat_buffer, message_len + 64, hash);

    /* perform outer MD5 */
    memcpy(cat_buffer, k_opad, 64);
    memcpy(cat_buffer + 64, hash, 16);
    md5(cat_buffer, 64 + 16, hash);
}

/* Generate a truncated HMAC-MD5-80 signature for *message, length message_len,
 * with key *key, length key_len, and store the result in the 10-byte buffer at
 * *hash */
void hmac_md5_80(const uint8_t *message, uint8_t message_len,
                 const uint8_t *key, uint8_t key_len, uint8_t *hash)
{
	uint8_t full_hash[16];

	hmac_md5(message, message_len, key, key_len, full_hash);
	memcpy(hash, full_hash, 10);
}

