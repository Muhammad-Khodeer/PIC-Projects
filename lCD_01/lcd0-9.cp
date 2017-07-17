#line 1 "C:/Users/Muslim/Desktop/PIC_Tasks/lcd0_1/c/lcd0-9.c"






int i = 0;
char txt[7];
char *res;

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;







void ioConfiguration(void);
void initialValues(void);
void offMoveL(void);
void onMoveL(void) ;
void offMoveR(void);
void onMoveR(void) ;
void checkButtons(void);
void stopButton(void);
void lcddisplayRight (void);
void lcddisplayLight (void);
void lcddisplayStop (void);



void main()
{


 Lcd_Init();
 while(1)
 {
 for (i=0; i<=9; i++)
 {

 IntToStr(i, txt);
 res = Ltrim(txt);
 Lcd_Out(1, 1, res);

 delay_ms(400);
 }
 }
}
