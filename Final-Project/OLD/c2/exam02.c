//Exam01.
//Muhammad_Khodeer.
//9_2014.

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
#define adc_in trisA     // analog to digital inputs .

//function_Prototypes.

void ioConfiguration(void);
void initialValues(void);
void mainCode(void);
void goBack (void) ;
void check_OK_Buttons(void);
void caseiZero (void);
void caseiOne (void);
void caseiTwo (void);
void moveMotorL (void);
void moveMotorR (void);
void stopMotor (void);
void readTemperature (void);
void displayTemperature (void);
void displayLCD_12 (void);
void displayLCD_23 (void);
void displayLCD_34 (void);
void displayLCD_ML(void);
void displayLCD_MR(void);
void displayLCD_MS(void);
void displayLCD_MT(void);
void check_up_down_buttons(void);



//Variables.
int i = 0 ;
unsigned int level;
float volt;
char txt[15];
float level_volt=4.88;
char *res;

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
 B_up_dir = in;
 B_DOWN_dir = in;
 B_OK1_dir = in;
 B_OK2_dir = in;
 B_BACK_dir = in;
 MoveL_dir = out ;
 MoveR_dir = out ;
 adc_in = 0xff ;
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
void goBack (void)
{
 Lcd_Cmd(_LCD_CLEAR);
 i=0;
 displayLCD_12 (void);
}


//---------------  ----------------->
void mainCode (void)
{
 while (1)
 {
 if (B_up == pushed && (i != 0))
  {
   i-- ;
   check_OK_Buttons(void);
   while (B_up == pushed) ;
  }
  else if(B_down == pushed && (i != 2) )
  {
   i++ ;
   check_OK_Buttons(void);
   while (B_down == pushed) ;
  }
 }

}
////////////////////////


/////////////////////////////////


//---------------  ----------------->
void check_OK_Buttons(void)
{
  if (i == 0)
  {
   displayLCD_12 (void);    // åÔÙåÑ ÔÇÔÉ ßÐÇ
  caseiZero (void);       // ok1 or ok2 2åÎÊÈÑ Çá
  }
  if (i == 1)
  {
   displayLCD_23 (void);    // åÔÙåÑ ÔÇÔÉ ßÐÇ
   caseiOne (void);          // ok1 or ok2 2åÎÊÈÑ Çá
  }
  if (i == 2)
  {
   displayLCD_34 (void); // åÔÙåÑ ÔÇÔÉ ßÐÇ
   caseiTwo (void);       // ok1 or ok2 2åÎÊÈÑ Çá
  }
}

void caseiZero (void)
{
 if(B_ok1 == pushed )
   {
    moveMotorL (void); //ÇáãÇÊæÑ íáÝ ÔãÇá
    displayLCD_ML(void) ;  // íÚÑÖ ÇáÔÇÔå
    while (B_ok1 == pushed) ;
   }
   else if(B_ok2 == pushed )
   {
    moveMotorR (void);  // ÇáãÇÊæÑ íáÝ íãíä
    displayLCD_MR(void); // íÚÑÖ ÇáÔÇÔå
    while (B_ok2 == pushed) ;
   }
}

void caseiOne (void)
{
 if(B_ok1 == pushed )
   {
    moveMotorR (void);       // ÇáãÇÊæÑ íáÝ íãíä
    displayLCD_MR(void);      // íÚÑÖ ÇáÔÇÔå
    while (B_ok1 == pushed) ;
   }
   else if(B_ok2 == pushed )
   {
    stopMotor (void);   // ÇáãÇÊæÑ íÞÝ
    displayLCD_MS(void) ; //íÚÑÖ ÇáÔÇÔå
    while (B_ok2 == pushed) ;
   }
}

void caseiTwo (void)
{
 if(B_ok1 == pushed )
   {
    stopMotor (void);  // ÇáãÇÊæÑ íÞÝ
    displayLCD_MS(void) ;    //íÚÑÖ ÇáÔÇÔå
    while (B_ok1 == pushed) ;
   }
   else if(B_ok2 == pushed )
   {
    displayLCD_MT(void);
    readTemperature (void) ; //íÚÑÖ ÏÑÌÉ ÇáÍÑÇÑÉ
    displayTemperature (void) ;
    while (B_ok2 == pushed) ;
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
//--------------------------------------------------------- Temperature sensor  Functions  ------>
//---------------  ----------------->
void readTemperature (void)
{
 level = ADC_Get_Sample(0);
 volt = level * level_volt ;
 volt = volt /1000 ;
 Lcd_Cmd(_LCD_CLEAR);
}
void displayTemperature (void)
{
 FloatToStr(volt, txt);
 res = Ltrim(txt);
 Lcd_Out(2, 1 , res );
 delay_ms(400);
}

//---------------------------------------
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
 Lcd_Out(2, 1, "4- Temperature");
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
 Lcd_Out(1, 1, "Motor Temperature");
 //
}