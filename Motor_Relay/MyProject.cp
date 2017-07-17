#line 1 "C:/Users/Muslim/Desktop/Lap4_2/c/MyProject.c"



sbit but2 at portB.b6;



sbit but2_dir at trisB.b6;


sbit led1 at portB.b0;

sbit led1_dir at trisB.b0;
#line 25 "C:/Users/Muslim/Desktop/Lap4_2/c/MyProject.c"
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

 }

}

void initialValues(void)
{
 offLed1(void) ;
 offLed2(void) ;
}

void ioConfi(void)
{

 but2_dir =  1 ;

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
void offLed2(void)
{

}

void onLed2(void)
{

}

void checkButton(void)
{
 if (but2 ==  1  && n==0)
 {
 n++;
 offLed2() ;
 onLed1() ;
 while (but2 ==  1 ) ;
 }
 else if(but2 ==  1  && n==1)
 {
 n--;
 offLed1() ;
 onLed2() ;
 while (but2 ==  1 ) ;
 }
}
