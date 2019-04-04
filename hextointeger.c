// Takes a two byte char and convert that to an integer.
// Example a5 => 165
unsigned int tointeger(const char* c) {
   int i;
   int length = strlen(c);
   unsigned int value = 0;
   unsigned int bytevalue;

   if (length == 0) return 0;

   for (i = 0; i < length; ++i) {
          bytevalue = tobytevalue(c[i]);
          if (bytevalue == 255) {
                 value = 0;
                 break;
          }
          bytevalue <<= (4 * (length - i - 1));
          value += bytevalue;
   }

   return value;
}
