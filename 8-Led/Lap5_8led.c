int x = 0 ;
//
#define leds portB
#define leds_dir trisB
#define in 1
#define out 0
//
void ioConfi();
void initialValues();
void stepA () ;
void stepB () ;
void stepC () ;
//
void main() 
{
 int i =0;
 int j =0;
//
 ioConfi(void) ;
 initialValues(void);
//
 while (1)
 {
  for (i=0; i<2 ; i++)
  {

   stepA ;
  }
  leds = 0 ;
  
  for (j=0; j<2 ; j++)
  {
   stepB();
   stepC();
   x = 0 ;
  }
 }
}
//
void ioConfi(void)
{
leds_dir = out ;
}
//
void initialValues(void)
{
 leds =0 ;
}
//
void stepA(void)
{
 leds = 0b00001111 ;
 delay_ms(200);
 leds = 0b11110000 ;
 delay_ms(200);
}
//
void stepB (void)
{
 int i =0;
 for (i=0 ; i<8 ; i++)
 {
  x = (x)+ (2^i);
  leds = x ;
  delay_ms(200);
 }
}
//
void stepC (void)
{
  int i =0;
  for (i=0; i<8 ;i++)
  {
   x = (x)-(2^i);
   leds = x;
   delay_ms(200);
  }
}