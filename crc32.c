// Creates a crc32 checksum
uint32_t crc32b(uint8_t *message, const int length) {
#define SEED 0xEDB88320
   int i, j;
   uint32_t byte, crc, mask;

   i = 0;
   crc = 0xFFFFFFFF;
   for (i = 0; i < length; i++) {
       byte = message[i];
       crc = crc ^ byte;
       for (j = 7; j >= 0; j--) {
          mask = -(crc & 1);
          crc = (crc >> 1) ^ (SEED & mask);
       }
   }
   return ~crc;
}
