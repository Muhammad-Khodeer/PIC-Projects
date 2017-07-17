// Lcd pinout settings
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;
char res[15];
char re[15];
int y;
int m;
char *x;
char *x1;
char *x2;
unsigned int level;
float volte;
#define vl 4.883
#define ad trisA
//----------------functions prototype
void ioconfigeration(void);
void calculatvolt(void);
void ADconfigeration(void);
void main()
{
  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  ADC_Init();
  ioconfigeration();
 /// ADconfigeration();
  while(1)
  {
    calculatvolt();
    delay_ms(400);
   }
 }
void ioconfigeration(void)
{
  ad = 0xff;
 }
void calculatvolt(void)
{
  level = ADC_Get_Sample(0);
  volte = (level * 4.88)/10;
  X = Ltrim(res);
  y = volte;
  X1 = Ltrim(y);
  m = ((volte - y )*10);
  X2 = Ltrim(m);
  IntToStr(y, res);
  X1 = Ltrim(res);
  IntToStr(m, X1);
  Lcd_Out(1, 1, "T=");
  Lcd_Out_CP( X1);
  Lcd_Out_CP( ".");
  Lcd_Out_CP( re);
  Lcd_Out_CP( "c");
 }
void ADconfigeration(void)
{
  ADCON0 = 0X10000001;
  ADCON1 = 0X11000000;
 }