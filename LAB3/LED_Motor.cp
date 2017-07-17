#line 1 "C:/Users/Muslim/Desktop/lap3/LED_Motor.c"


sbit but1 at portB.b7;
sbit but1_dir at trisB.b7;

sbit led1 at portB.b0;
sbit led1_dir at trisB.b0;










void ioConfi(void);
void initialValues(void);
void offLed1(void);
void onLed1(void) ;
void checkButton(void);

char n=0;

void main()
{
 ioConfi();
 initialValues();
 while(1)
 {
 checkButton();
 }

}

void initialValues(void)
{
 offLed1(void) ;
}

void ioConfi(void)
{
 but1_dir =  1 ;
 led1_dir =  0 ;
}

void offLed1(void)
{
 led1 =  0 ;
}

void onLed1(void)
{
 led1 =  1 ;
}

void checkButton(void)
{
 while(1)
 {
 if (but1 ==  1  && n==0)
 {
 n++;
 onLed1() ;

 }
 else if(but1 ==  1  && n==1)
 {
 n--;
 offLed1() ;
 }
 }
}
