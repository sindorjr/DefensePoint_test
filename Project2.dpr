program Project2;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {RobotForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TRobotForm, RobotForm);
  Application.Run;
end.
