//

sbit but1 at portB.b7;
sbit but2 at portB.b6;
sbit but1_dir at trisB.b7;
sbit but2_dir at trisB.b6;

sbit led1 at portB.b0;
sbit led2 at portB.b1;
sbit led1_dir at trisB.b0;
sbit led2_dir at trisB.b1;

//
#define in 1
#define out 0
#define pushed 1
#define off 0
#define on 1

//FunctionPrototypes

void ioConfi(void);
void initialValues(void);
void offLed1(void);
void offLed2(void);
void onLed1(void) ;
void onLed2(void) ;
void checkButton(void);

//
void main() 
{
 ioConfi();
 initialValues();
 while(1)
 {
  checkButton();
 }
}
//
void initialValues(void)
{
 offLed1(void) ;
 offLed2(void) ;
}

//
void ioConfi(void)
{
 but1_dir = in;
 but2_dir = in;
 led1_dir = out;
 led2_dir = out;
}
void offLed1(void)
{
 led1 = off;
}
void offLed2(void)
{
 led2 = off;
}
void onLed1(void)
{
 led1 = on;
}
void onLed2(void)
{
 led2 = on;
}

void checkButton(void)
{
  while(1)
  {
     if(but1 = pushed)
     {
       onLed1();
       offLed2();
     }
     else if (but2 = pushed)
     {
       onLed2();
       offLed1();
     }
  }
}