#line 1 "G:/anolog/MyProject.c"


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

unsigned int level;
float volt;
char txt[15];
float level_volt=4.88;
char *res;


void mainCode();
void adconf();
void lcdd_ou ();
void main()
{
 Lcd_Init();
 ADC_Init();
 mainCode();

}
void mainCode()
{
 adconf();
 while(1)
 {
 level = ADC_Get_Sample(0);
 volt = level * level_volt ;
 volt = volt /10 ;
 Lcd_Cmd(_LCD_CLEAR);
 lcdd_ou ();
 }

}
void adconf()
{
  trisA  = 0xff ;
 Lcd_Cmd(_LCD_CURSOR_OFF);
}
void lcdd_ou ()
{
 FloatToStr(volt, txt);
 res = Ltrim(txt);
 Lcd_Out(1, 1 , res );
 delay_ms(400);
}
