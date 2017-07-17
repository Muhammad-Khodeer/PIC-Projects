#define sev_seg PortC
#define sev_seg_dir TrisC
#define out 0

int i =0 ;
char seg_mat[] = {0XFC ,0X60 ,0XDA ,0XF2 ,0X66 ,0XB6 ,0XBE ,0XE0 , 0XFE ,0XF6 }   ;
 void initialValues(void)  ;
 void ioConfiguration(void) ;
 void  inCrement(void);
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
 sev_seg = 0 ;
}
void ioConfiguration(void)
{
 sev_seg_dir = out ;
}
void inCrement(void)
{
 for (i=0; i<=9; i++)
     {
      sev_seg = seg_mat[i];
      delay_ms(400);
     }
}
void deCrement(void)
{
 for (i=9; i>=0; i--)
     {
      sev_seg = seg_mat[i];
      delay_ms(400);
     }
}