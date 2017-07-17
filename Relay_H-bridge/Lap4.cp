#line 1 "C:/Users/Muslim/Desktop/PIC_Tasks/Hbridege/Lap4_C/Lap4.c"






sbit ButtonL at portB.b7;
sbit ButtonR at portB.b6;
sbit ButtonS at portB.b5;
sbit ButtonL_dir at trisB.b7;
sbit ButtonR_dir at trisB.b6;
sbit ButtonS_dir at trisB.b5;

sbit MoveL at portB.b0;
sbit MoveR at portB.b1;
sbit MoveL_dir at trisB.b0;
sbit MoveR_dir at trisB.b1;







void ioConfiguration(void);
void initialValues(void);
void offMoveL(void);
void onMoveL(void) ;
void offMoveR(void);
void onMoveR(void) ;
void checkButtons(void);
void stopButton(void);



void main()
{
 ioConfiguration();
 initialValues();
 while(1)
 {
 checkButtons();
 stopButton();
 }
}

void initialValues(void)
{
 offMoveL(void) ;
 offMoveR(void) ;
}
void ioConfiguration(void)
{
 ButtonL_dir =  1 ;
 ButtonR_dir =  1 ;
 ButtonS_dir =  1 ;
 MoveL_dir =  0 ;
 MoveR_dir =  0 ;
}
void offMoveL(void)
{
 MoveL =  0 ;
}

void onMoveL(void)
{
 MoveL =  1 ;
}
void offMoveR(void)
{
 MoveR =  0 ;
}
void onMoveR(void)
{
 MoveR =  1 ;
}
void checkButtons(void)
{
 if (ButtonL ==  1  )
 {

 offMoveR() ;
 onMoveL() ;
 while (ButtonL ==  1 ) ;
 }
 else if(ButtonR ==  1  )
 {

 offMoveL() ;
 onMoveR() ;
 while (ButtonR ==  1 ) ;
 }
}
void stopButton(void)
{
 if (ButtonS == 1 )
 {
 offMoveL();
 offMoveR();
 while (ButtonS ==  1 ) ;
 }
}
