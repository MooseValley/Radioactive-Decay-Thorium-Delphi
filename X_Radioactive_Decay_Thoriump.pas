unit X_Radioactive_Decay_Thoriump;
{
Structured Fortran 77 for Engineers and Scientists, D, M. Etter
(C) 1983
ISBN:      0-8053-2520-4
My old QIT (Uni) textbook from my uni days 1983-1987 - VERY weather beaten and worn now (almost 30 years later).

From page 34:

2.6 Application - Radioactive Decay
The rate of decomposition of a radioactive substance is dependent on the amount of radioactive material present.
:::
Example 2-2 Radioactive Decay of Thorium

The radioactive decay of thorium is given by:

    N = No * e ^ (-0.693 * t / 1.650E16)

where No is the initial amount of thorium and t represents the time elapsed (in seconds).
When t = 0, N = No and no decay has occured.
As t increases, the amount of thorium is decreased.

-------------------------------------

Ahhh, I just loved doing problems like these (and I still do).
So much fun, so much to learn and explore, so interesting.

Mike "Moose" O'Malley
Mon, 2-Nov-2015
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Math;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
Const
     E                = 2.7182818284590452353603; // E to 25 decimal places.
     Seconds_Per_Year = 1.0 * 60 * 60 * 24 * 365; // 1 year.
     Year_Increment   = 100000; // Had to keep increasing this until I saw some reasonably fast decay !!!
Var
   Time_Sec,
   Exponent,
   Thor_Start,
   Thor_Resid   : Extended;
   Years        : LongWord;
begin
     // Years:        Proportion of Thorium remaining
     // 523,400,000 - 0.499948802501335

     Memo1.Lines.Clear;

     Thor_Start := 1.0;  // Kg.
     Thor_Resid := Thor_Start;
     Years      := 0;

     While (Thor_Resid > 0.5) AND (CheckBox1.Checked = False) do
     begin
          Years := Years + Year_Increment;

          Time_Sec := 1.0 * Years * Seconds_Per_Year;

          Exponent := -0.693 * Time_Sec / 1.650E16;

          Thor_Resid := Thor_Start * Math.POWER (E, Exponent);

          //If Time_Sec MOD Seconds_For_Each_Report_Line = 0 then

          Memo1.Lines.Add (FloatToStrF (Years, ffNumber, 10, 0) + ' - ' + FloatToStr (Thor_Resid));

          Application.ProcessMessages;
     end;
end;

end.
