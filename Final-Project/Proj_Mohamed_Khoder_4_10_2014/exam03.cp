#line 1 "C:/Users/Muslim/Desktop/Exam1/Exam_Mohamed_Khoder_4_10_2014/c/exam03.c"







sbit B_up at portB.b7;
sbit B_down at portB.b6;
sbit B_ok1 at portB.b5;
sbit B_ok2 at portB.b4;
sbit B_back at portB.b3;

sbit B_up_dir at trisB.b7;
sbit B_down_dir at trisB.b6;
sbit B_ok1_dir at trisB.b5;
sbit B_ok2_dir at trisB.b4;
sbit B_back_dir at trisB.b3;


sbit MoveL at portB.b0;
sbit MoveR at portB.b1;

sbit MoveL_dir at trisB.b0;
sbit MoveR_dir at trisB.b1;


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









void ioConfiguration(void) ;
void initialValues(void) ;
void goBack (void);
void mainCode (void);
void getUpdown(void);
void checkOk_buttons (void);
void changeMenu(void) ;
void moveMotorL (void) ;
void moveMotorR (void) ;
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


void main()
{
 Lcd_Init();
 ADC_Init();
 ioConfiguration();
 initialValues();
 mainCode();
}


void ioConfiguration(void)
{
 B_up_dir =  1  ;
 B_down_dir =  1  ;
 B_ok1_dir =  1  ;
 B_ok2_dir =  1  ;
 B_back_dir =  1  ;

 MoveL_dir =  0 ;
 MoveR_dir =  0 ;

  trisA  = 0xff;
}

void initialValues(void)
{
 stopMotor (void) ;
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 i=0;
 displayLCD_12 (void);
}

void mainCode (void)
{
 while (1)
 {
 getUpdown(void);
 checkOk_buttons (void);
 goBack (void);
 closeError (void);
 }
}

void getUpdown(void)
{
 if (B_up ==  1  && (i != 0))
 {
 i-- ;
 changeMenu(void);
 while (B_up ==  1 ) ;
 }
 else if(B_down ==  1  && (i != 2) )
 {
 i++ ;
 changeMenu(void);
 while (B_down ==  1 ) ;
 }
}

void changeMenu(void)
{
 if (i == 0)
 {
 displayLCD_12 (void);
 }
 if (i == 1)
 {
 displayLCD_23 (void);
 }
 if (i == 2)
 {
 displayLCD_34 (void);
 }
}

void checkOk_buttons (void)
{
 if ((i==0) && (B_ok1 ==  1 ) )
 {
 moveMotorL (void);
 displayLCD_ML(void);
 while (B_ok1 ==  1 );
 i = 5;
 }
 if ((i==0) && (B_ok2 ==  1 ) )
 {
 moveMotorR (void);
 displayLCD_MR(void);
 while (B_ok2 ==  1 );
 i = 5;
 }
 if ((i==1) && (B_ok1 ==  1 ) )
 {
 moveMotorR (void);
 displayLCD_MR(void);
 while (B_ok1 ==  1 );
 i = 5;
 }
 if ((i==1) && (B_ok2 ==  1 ) )
 {
 stopMotor (void);
 displayLCD_MS(void);
 while (B_ok2 ==  1 );
 i = 5;
 }
 if ((i==2) && (B_ok1 ==  1 ) )
 {
 stopMotor (void);
 displayLCD_MS(void);
 while (B_ok1 ==  1 );
 i = 5;
 }
 if ((i==2) && (B_ok2 ==  1 ) )
 {
 stopMotor (void);
 getTemperature (void);
 displayTemperature (void);
 while (B_ok1 ==  1 );
 i = 5;
 }
}

void goBack (void)
{
 if (B_back ==  1  )
 {
 Lcd_Cmd(_LCD_CLEAR);
 i=0;
 displayLCD_12 (void);
 while (B_back ==  1  );
 }
}



void moveMotorL (void)
{
 MoveR =  0  ;
 MoveL =  1  ;
}

void moveMotorR (void)
{
 MoveL =  0  ;
 MoveR =  1  ;
}

void stopMotor (void)
{
 MoveL =  0  ;
 MoveR =  0  ;
}


void displayLCD_12 (void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "1- Motor left.");
 Lcd_Out(2, 1, "2- Motor right.");
}

void displayLCD_23(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "2- Motor right.");
 Lcd_Out(2, 1, "3- Motor stop.");
}

void displayLCD_34(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "3- Motor stop.");
 Lcd_Out(2, 1, "4- temperature");
}

void displayLCD_ML(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Motor rotates Left");
}

void displayLCD_MR(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Motor rotates Right");
}

void displayLCD_MS(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Motor Stop");
}

void displayLCD_MT(void)
{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Motor Tempe");
}


void getTemperature (void)
{
 level = ADC_Get_Sample(0);
 volte = (level * 4.883)/10;
 y = volte;
 m = ((volte - y )*10);
 IntToStr(y, x3);
 l = Ltrim(x3);
 IntToStr(m, x4);
 k = Ltrim(x4);
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
 trisB =  0  ;
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1, 1, "ERROR");
 }

}
