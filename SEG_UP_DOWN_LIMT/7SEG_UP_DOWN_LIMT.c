//Driver
//Inputs

sbit ButtonUP at portB.b7;
sbit ButtonDOWN at portB.b6;
sbit ButtonCLEAR at portB.b5;
sbit ButtonUP_dir at trisB.b7;
sbit ButtonDOWN_dir at trisB.b6;
sbit ButtonCLEAR_dir at trisB.b5;
//
#define sev_seg PortC
#define sev_seg_dir TrisC
#define in 1
#define out 0
#define pushed 1
#define off 0
#define on 1
//
int i = 0 ;
char seg_mat[] = {0XFC ,0X60 ,0XDA ,0XF2 ,0X66 ,0XB6 ,0XBE ,0XE0 , 0XFE ,0XF6 }   ;
//
void initialValues(void)  ;
void ioConfiguration(void) ;
void inCrement(void);
void deCrement(void);
void mainCode (void);
//
void main()
{
  initialValues(void);
  ioConfiguration(void);
  mainCode (void);
}
//
void initialValues(void)
{
 sev_seg = seg_mat[0];
 delay_ms (400) ;
}
//
void ioConfiguration(void)
{
 sev_seg_dir = out ;
}
//--------
void inCrement(void)
     {
      sev_seg = seg_mat[i];
      delay_ms(400);
     }
//-------
void deCrement(void)
     {
      sev_seg = seg_mat[i];
      delay_ms(400);
     }
//-----------
void mainCode (void)
{
while (1)
{
if (ButtonUP == pushed )
   {
    if (i == 9)
    {
    i = -1 ;
    }
    i++ ;
    inCrement(void) ;
    while (ButtonUP == pushed) ;
   }

else if(ButtonDOWN == pushed )
   {
    if (i == 0)
    {
    i = 10;
    }
    i-- ;
    deCrement(void) ;
    while (ButtonDOWN == pushed) ;
   }
else if(ButtonCLEAR == pushed )
   {
    initialValues(void)  ;
    while (ButtonDOWN == pushed) ;
   }
}
}