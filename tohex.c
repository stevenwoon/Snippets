// Convert a byte value to hexadecimal
// Example 165 (0xa5) => "A5"
void tohex (const uint8_t mychar, char* out)
{  
   char *p = out; 
   char *hex = "0123456789ABCDEF";
   *p = hex[(mychar >> 4)];
   *(p+1) = hex[(mychar & 0x0f)];
}
