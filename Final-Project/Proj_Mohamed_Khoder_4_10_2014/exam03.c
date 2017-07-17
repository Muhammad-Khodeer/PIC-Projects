//Exam01.
//Muhammad_Khodeer.
//10_2014.

//---------------------------------------------------------------  Driver  -------------------------------->
//Inputs
//------ PORT--------->
sbit B_up at portB.b7;
sbit B_down at portB.b6;
sbit B_ok1 at portB.b5;
sbit B_ok2 at portB.b4;
sbit B_back at portB.b3;
//------ TRIS --------->
sbit B_up_dir at trisB.b7;
sbit B_down_dir at trisB.b6;
sbit B_ok1_dir at trisB.b5;
sbit B_ok2_dir at trisB.b4;
sbit B_back_dir at trisB.b3;
//Outputs .
//------ PORT--------->
sbit MoveL at portB.b0;
sbit MoveR at portB.b1;
//------ TRIS --------->
sbit MoveL_dir at trisB.b0;
sbit MoveR_dir at trisB.b1;
//LCD
//------ Lcd pinout settings--- >
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;
//------ LCD Pin direction----->
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;
//The_Dictionary.
#define in 1
#define out 0
#define pushed 1
#define off 0
#define on 1
#define ad trisA// analog to digital inputs .

//function_Prototypes.
void ioConfiguration(void) ;
void initialValues(void) ;
void goBack (void);
void mainCode (void);
void getUpdown(void);
void checkOk_buttons (void);
void changeMenu(void) ;
void moveMotorL (void) ;
void moveMotorR (void)  ;
void stopMotor (void) ;
void displayLCD_12 (void);
void displayLCD_23(void);
void displayLCD_34(void) ;
void displayLCD_ML(void);
void displayLCD_MR(void);
void displayLCD_MS(void) ;
void displayLCD_MT(void);
void getTemperature (void);
void displayTemperature (void);
void closeError (void);

///////////////////////////////////
//Variables.
int i = 0 ;
char v = 1;
char x4[15];
char x3[15];
int y;
int m;
char *l;
char *k;
unsigned int level;
float volte;

//---------------------------------------------------------  Main_Application.------------------------>
void main()
{
 Lcd_Init();
 ADC_Init();
 ioConfiguration();
 initialValues();
 mainCode();
}
//-----------------------------------------------------  Firmware_(Functions).------------------------>
//---------------  ----------------->
void ioConfiguration(void)
{
 B_up_dir = in ;
 B_down_dir = in ;
 B_ok1_dir = in ;
 B_ok2_dir = in ;
 B_back_dir = in ;

 MoveL_dir = out;
 MoveR_dir = out;

 ad = 0xff;
}
//---------------  ----------------->
void initialValues(void)
{
 stopMotor (void) ;
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 i=0;
 displayLCD_12 (void);
}
//---------------  ----------------->
void mainCode (void)                // ÇáßæÏ ÇáÑÆíÓí
{
 while (1)
 {
  getUpdown(void);
  checkOk_buttons (void);
  goBack (void);
  closeError (void);
 }
}
 //>------------------------------------------------------->
void getUpdown(void)                  //  up down ÏÇáå ÊÊÛíÑ ÞíãÉ   ÊÊÛíÑ ÞíãÉ ÇáãÊÛíÑ ÈÇáÖÛØ Úáì
{
 if (B_up == pushed && (i != 0))
  {
   i-- ;
   changeMenu(void);
   while (B_up == pushed) ;
  }
  else if(B_down == pushed && (i != 2) )
  {
   i++ ;
   changeMenu(void);
   while (B_down == pushed) ;
  }
}
//>------------------------------------------------------->
void changeMenu(void)       //ÍÓÈ ÞíãÉ ÇáãÊÛíÑ ÊÊÛíÑ ÇáÞÇÆãÉ
{
  if (i == 0)
  {
   displayLCD_12 (void);    // åÔÙåÑ ÔÇÔÉ ßÐÇ
  }
  if (i == 1)
  {
   displayLCD_23 (void);    // åÔÙåÑ ÔÇÔÉ ßÐÇ
  }
  if (i == 2)
  {
   displayLCD_34 (void); // åÔÙåÑ ÔÇÔÉ ßÐÇ
  }
}
//>------------------------------------------------------->
void checkOk_buttons (void)         //okíÚØí ÇæÇãÑ ÍÓÈ ÞíãÉ ÇáãÊÛíÑ æÞíãÉ ÒÑ
{
 if ((i==0) &&  (B_ok1 == pushed) )
 {
  moveMotorL (void);
  displayLCD_ML(void);
  while (B_ok1 == pushed);
  i = 5;                        // ÚáÔÇä ãíäÝÐÔ ÇãÑ ÊÇäí ÛíÑ áãÇ ÇÖÛØ ÈÇß ÇáÇæá .
 }
  if ((i==0) &&  (B_ok2 == pushed) )
 {
  moveMotorR (void);
  displayLCD_MR(void);
  while (B_ok2 == pushed);
  i = 5;
 }
  if ((i==1) &&  (B_ok1 == pushed) )
 {
  moveMotorR (void);
  displayLCD_MR(void);
  while (B_ok1 == pushed);
  i = 5;
 }
  if ((i==1) &&  (B_ok2 == pushed) )
 {
  stopMotor (void);
  displayLCD_MS(void);
  while (B_ok2 == pushed);
  i = 5;
 }
  if ((i==2) &&  (B_ok1 == pushed) )
 {
  stopMotor (void);
  displayLCD_MS(void);
  while (B_ok1 == pushed);
  i = 5;
 }
  if ((i==2) &&  (B_ok2 == pushed) )
 {
  stopMotor (void);
  getTemperature (void);
  displayTemperature (void);
  while (B_ok1 == pushed);
  i = 5;
 }
}
//---------------  ----------------->
void goBack (void)                    // ÏÇáÉ ÒÑÇÑ ÇáÈÇß
{
 if (B_back == pushed )
 {
  Lcd_Cmd(_LCD_CLEAR);
  i=0;
  displayLCD_12 (void);
  while (B_back == pushed );
 }
}
//--------------------------------------------------------- Motor Functions  ------>

//---------------  ----------------->
void moveMotorL (void)
{
 MoveR = off ;
 MoveL = on ;
}
//---------------  ----------------->
void moveMotorR (void)
{
 MoveL = off ;
 MoveR = on ;
}
//---------------  ----------------->
void stopMotor (void)
{
 MoveL = off ;
 MoveR = off ;
}

//--------------------------------------------------- display Functions  ----------------->
void displayLCD_12 (void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "1- Motor left.");
 Lcd_Out(2, 1, "2- Motor right.");
}
//---------------  ----------------->
void displayLCD_23(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "2- Motor right.");
 Lcd_Out(2, 1, "3- Motor stop.");
}
//---------------  ----------------->
void displayLCD_34(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "3- Motor stop.");
 Lcd_Out(2, 1, "4- temperature");
}
//---------------  ----------------->
void displayLCD_ML(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Motor rotates Left");
}
//---------------  ----------------->
void displayLCD_MR(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Motor rotates Right");
}
//---------------  ----------------->
void displayLCD_MS(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Motor Stop");
}
//---------------  ----------------->
void displayLCD_MT(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Motor Tempe");
}
//--------------------------------------------------------- Temperature sensor  Functions  ------>
//---------------  ----------------->
void getTemperature (void)
{
 level = ADC_Get_Sample(0);
 volte = (level * 4.883)/10;
 y = volte;
 m = ((volte - y )*10);
 IntToStr(y, x3);
 l = Ltrim(x3);         // ÇáÌÒÁ ÇáÕÍíÍ
 IntToStr(m, x4);
 k = Ltrim(x4);      // ÇáÌÒÁ ÇáÚÔÑí
}

void displayTemperature (void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Motor Tempe");
 Lcd_Out(2, 1, "T=");
 Lcd_Out(2, 4, x3);
 Lcd_Out_CP( ".");
 Lcd_Out_CP( x4);
 Lcd_Out_CP( "c");
}

void closeError (void)
{
 getTemperature (void);
 if (y > 30)
 {
  stopMotor (void);
  i =5 ;
  trisB = out ;
  Lcd_Cmd(_LCD_CLEAR);
 // delay_ms(300);
  Lcd_Out(1, 1, "ERROR");
 }

}