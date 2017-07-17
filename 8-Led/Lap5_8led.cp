#line 1 "C:/Users/Muslim/Desktop/8Led/c/Lap5_8led.c"
int x = 0 ;






void ioConfi();
void initialValues();
void stepA () ;
void stepB () ;
void stepC () ;

void main()
{
 int i =0;
 int j =0;

 ioConfi(void) ;
 initialValues(void);

 while (1)
 {
 for (i=0; i<2 ; i++)
 {

 stepA ;
 }
  portB  = 0 ;

 for (j=0; j<2 ; j++)
 {
 stepB();
 stepC();
 x = 0 ;
 }
 }
}

void ioConfi(void)
{
 trisB  =  0  ;
}

void initialValues(void)
{
  portB  =0 ;
}

void stepA(void)
{
  portB  = 0b00001111 ;
 delay_ms(200);
  portB  = 0b11110000 ;
 delay_ms(200);
}

void stepB (void)
{
 int i =0;
 for (i=0 ; i<8 ; i++)
 {
 x = (x)+ (2^i);
  portB  = x ;
 delay_ms(200);
 }
}

void stepC (void)
{
 int i =0;
 for (i=0; i<8 ;i++)
 {
 x = (x)-(2^i);
  portB  = x;
 delay_ms(200);
 }
}
