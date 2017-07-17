#line 1 "C:/Users/Muslim/Desktop/PIC_Tasks/7_seg_up_down/c2/limt.c"



sbit ButtonUP at portB.b7;
sbit ButtonDOWN at portB.b6;
sbit ButtonCLEAR at portB.b5;
sbit ButtonUP_dir at trisB.b7;
sbit ButtonDOWN_dir at trisB.b6;
sbit ButtonCLEAR_dir at trisB.b5;









int i = 0 ;
char seg_mat[] = {0XFC ,0X60 ,0XDA ,0XF2 ,0X66 ,0XB6 ,0XBE ,0XE0 , 0XFE ,0XF6 } ;

void initialValues(void) ;
void ioConfiguration(void) ;
void inCrement(void);
void deCrement(void);
void mainCode (void);

void main()
{
 initialValues(void);
 ioConfiguration(void);
 mainCode (void);
}

void initialValues(void)
{
  PortC  = seg_mat[0];
 i = 0 ;
 delay_ms (400) ;

}

void ioConfiguration(void)
{
  TrisC  =  0  ;
}

void inCrement(void)
 {
  PortC  = seg_mat[i];
 delay_ms(400);
 }

void deCrement(void)
 {
  PortC  = seg_mat[i];
 delay_ms(400);
 }

void mainCode (void)
{
while (1)
{
if (ButtonUP ==  1  && (i != 9) )
 {
 i++ ;
 inCrement(void) ;
 while (ButtonUP ==  1 ) ;
 }

else if(ButtonDOWN ==  1  && (i != 0) )
 {
 if (i == 0)
 {
 i = 10;
 }
 i-- ;
 deCrement(void) ;
 while (ButtonDOWN ==  1 ) ;
 }
else if(ButtonCLEAR ==  1  )
 {
 initialValues(void) ;
 while (ButtonDOWN ==  1 ) ;
 }
}
}
