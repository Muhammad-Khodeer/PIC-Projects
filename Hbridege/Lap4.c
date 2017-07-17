//H_bridge_motor.
//Muhammad_Khodeer.
//9_2014.

//Driver
//Inputs
sbit ButtonL at portB.b7;
sbit ButtonR at portB.b6;
sbit ButtonS at portB.b5;
sbit ButtonL_dir at trisB.b7;
sbit ButtonR_dir at trisB.b6;
sbit ButtonS_dir at trisB.b5;
//Outputs .
sbit MoveL at portB.b0;
sbit MoveR at portB.b1;
sbit MoveL_dir at trisB.b0;
sbit MoveR_dir at trisB.b1;
//The_Dictionary.
#define in 1
#define out 0
#define pushed 1
#define off 0
#define on 1
//function_Prototypes.
void ioConfiguration(void);
void initialValues(void);
void offMoveL(void);
void onMoveL(void) ;
void offMoveR(void);
void onMoveR(void) ;
void checkButtons(void);
void stopButton(void);
//Variables.
//char n=0;
//Application_Main.
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
//Firmware_(Functions).
void initialValues(void)
{
 offMoveL(void) ;
 offMoveR(void) ;
}
void ioConfiguration(void)
{
 ButtonL_dir = in;
 ButtonR_dir = in;
 ButtonS_dir = in;
 MoveL_dir = out;
 MoveR_dir = out;
}
void offMoveL(void)
{
 MoveL = off;
}

void onMoveL(void)
{
 MoveL = on;
}
void offMoveR(void)
{
 MoveR = off;
}
void onMoveR(void)
{
 MoveR = on;
}
void checkButtons(void)
{
   if (ButtonL == pushed )//&& n==0)
   {
  // n++;
   offMoveR() ;
   onMoveL() ;
   while (ButtonL == pushed) ;
   }
   else if(ButtonR == pushed )//&& n==1)
   {
   // n--;
    offMoveL() ;
    onMoveR() ;
    while (ButtonR == pushed) ;
   }
}
void stopButton(void)
{
  if (ButtonS ==pushed)
     {
     offMoveL();
     offMoveR();
     while (ButtonS == pushed) ;
     }
}