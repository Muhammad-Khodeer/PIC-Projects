#line 1 "C:/Users/Muslim/Desktop/PIC_Tasks/7Segment/C/7Segment.c"




int i =0 ;
char seg_mat[] = {0XFC ,0X60 ,0XDA ,0XF2 ,0X66 ,0XB6 ,0XBE ,0XE0 , 0XFE ,0XF6 } ;
 void initialValues(void) ;
 void ioConfiguration(void) ;
 void inCrement(void);
 void deCrement(void);



void main()
{
 initialValues(void);
 ioConfiguration(void);
 while (1)
 {
 inCrement(void);
 deCrement(void);
 }


}

void initialValues(void)
{
  PortC  = 0 ;
}
void ioConfiguration(void)
{
  TrisC  =  0  ;
}
void inCrement(void)
{
 for (i=0; i<=9; i++)
 {
  PortC  = seg_mat[i];
 delay_ms(400);
 }
}
void deCrement(void)
{
 for (i=9; i>=0; i--)
 {
  PortC  = seg_mat[i];
 delay_ms(400);
 }
}
