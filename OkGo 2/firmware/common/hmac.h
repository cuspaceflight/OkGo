#ifndef HMAC_H
#define HMAC_H

/* Generate an HMAC-MD5 signature for *message, length message_len, with
 * key *key, length key_len, and store the result in the 16-byte buffer at
 * *hash */
void hmac_md5(const uint8_t *message, uint8_t message_len, const uint8_t *key,
              uint8_t key_len, uint8_t *hash);

/* Generate a truncated HMAC-MD5-80 signature for *message, length message_len,
 * with key *key, length key_len, and store the result in the 10-byte buffer at
 * *hash */
void hmac_md5_80(const uint8_t *message, uint8_t message_len,
                 const uint8_t *key, uint8_t key_len, uint8_t *hash);


#endif
