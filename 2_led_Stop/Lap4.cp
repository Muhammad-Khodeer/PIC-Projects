#line 1 "C:/Users/Muslim/Desktop/Lap4/c/Lap4.c"


sbit but1 at portB.b7;
sbit but2 at portB.b6;
sbit but3 at portB.b5;

sbit but1_dir at trisB.b7;
sbit but2_dir at trisB.b6;
sbit but3_dir at trisB.b5;

sbit led1 at portB.b0;
sbit led2 at portB.b1;
sbit led1_dir at trisB.b0;
sbit led2_dir at trisB.b1;










void ioConfi(void);
void initialValues(void);
void offLed1(void);
void onLed1(void) ;
void offLed2(void);
void onLed2(void) ;
void checkButton(void);
void stopButton(void);

char n=0;

void main()
{
 ioConfi();
 initialValues();
 while(1)
 {
 checkButton();
 stopButton();
 }

}

void initialValues(void)
{
 offLed1(void) ;
 offLed2(void) ;
}

void ioConfi(void)
{
 but1_dir =  1 ;
 but2_dir =  1 ;
 but3_dir =  1 ;
 led1_dir =  0 ;
 led2_dir =  0 ;
}

void offLed1(void)
{
 led1 =  0 ;
}

void onLed1(void)
{
 led1 =  1 ;
}
void offLed2(void)
{
 led2 =  0 ;
}

void onLed2(void)
{
 led2 =  1 ;
}

void checkButton(void)
{
 if (but1 ==  1  )
 {

 offLed2() ;
 onLed1() ;
 while (but1 ==  1 ) ;
 }
 else if(but2 ==  1  )
 {

 offLed1() ;
 onLed2() ;
 while (but2 ==  1 ) ;
 }
}

void stopButton(void)
{
 if (but3 == 1 )
 {
 offLed1();
 offLed2();
 while (but3 ==  1 ) ;
 }
}
