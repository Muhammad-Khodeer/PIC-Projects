//Driver
//Inputs

//
//Muhammad_Khodeer.
//

//Driver
//Inputs
int i = 0;
char txt[7];
char *res;
// Lcd pinout settings
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;
// LCD Pin direction
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

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
  Lcd_Init();
  initialValues(void);
  ioConfiguration(void);
  mainCode (void);
}
//
void initialValues(void)
{
 sev_seg = seg_mat[0];
  i = 0 ;
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
if (ButtonUP == pushed && (i != 9) )
   {
    i++ ;
    inCrement(void) ;
    while (ButtonUP == pushed) ;
   }

else if(ButtonDOWN == pushed && (i != 0) )
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