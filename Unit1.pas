unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, StrUtils;

type
  TRobotForm = class(TForm)
    RobotGrid: TStringGrid;
    BtnPosition: TButton;
    LabelInput: TLabel;
    BtnForward: TButton;
    BtnWait: TButton;
    BtnTurnaround: TButton;
    BtnRight: TButton;
    BtnLeft: TButton;
    LabelCommands: TLabel;
    LabelFace: TLabel;
    BtnNorth: TButton;
    BtnSouth: TButton;
    BtnWest: TButton;
    BtnEast: TButton;
    MemoCommands: TMemo;
    Go: TButton;
    LabelWait: TLabel;
    EditTime: TEdit;
    LabelOutput: TLabel;
    LabelResult: TLabel;
    procedure BtnCommandClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RobotGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GoClick(Sender: TObject);
  private
    { Private declarations }
    PosColumn, PosRow: Integer;
    Face: string;
    procedure ChangeFace(Command: string);
  public
    { Public declarations }
  end;

var
  RobotForm: TRobotForm;
const
   NoSelection: TGridRect = (Left:-1; Top:-1; Right:-1; Bottom:-1 );

implementation

{$R *.dfm}

procedure TRobotForm.BtnCommandClick(Sender: TObject);
begin
  MemoCommands.Lines.Text := MemoCommands.Lines.Text + TButton(Sender).Caption;
  MemoCommands.SetFocus;
  MemoCommands.SelStart := Length(MemoCommands.Lines.Text)
end;

procedure TRobotForm.GoClick(Sender: TObject);
var
  CommandList: TStringList;
  FirstWord: string;
  i, Steps: Integer;
begin
  CommandList := TStringList.Create;
  CommandList.Delimiter := ',';
  CommandList.StrictDelimiter := True;
  CommandList.DelimitedText := MemoCommands.Lines.Text;

  for i := 0 to CommandList.Count - 1 do
  begin
    RobotGrid.Cells[PosColumn, PosRow] := '';
    CommandList.Strings[i] := Trim(CommandList.Strings[i]);
    if EmptyStr <> CommandList.Strings[i] then
    begin
      if Pos(' ', CommandList.Strings[i]) > 0 then
        FirstWord := Trim(Copy(CommandList.Strings[i], 0, Pos(' ', CommandList.Strings[i]) - 1))
      else
        FirstWord := CommandList.Strings[i];
      case AnsiIndexStr(UpperCase(FirstWord), ['POSITION', 'FORWARD', 'WAIT', 'LEFT', 'RIGHT', 'TURNAROUND']) of
      0 : //POSITION
        begin
          PosColumn := StrToIntDef(Copy(CommandList.Strings[i], Length(CommandList.Strings[i]) - 2, 1), 0) - 1;
          PosRow := StrToIntDef(Copy(CommandList.Strings[i], Length(CommandList.Strings[i]), 1), 0) - 1;
        end;
      1 : //FORWARD
        begin
          Steps := StrToIntDef(Copy(CommandList.Strings[i], Pos(' ', CommandList.Strings[i]) + 1, Length(CommandList.Strings[i])), 0);
          while Steps > 0 do
          begin
            if Face = 'NORTH' then
            begin
              if PosRow = 1 then
                PosRow := 7
              else
                Dec(PosRow);
            end else
            if Face = 'SOUTH' then
            begin
              if PosRow = 7 then
                PosRow := 1
              else
                Inc(PosRow);
            end else
            if Face = 'WEST' then
            begin
              if PosColumn = 1 then
                PosColumn := 7
              else
                Dec(PosColumn);
            end else
            if Face = 'EAST' then
            begin
              if PosColumn = 7 then
                PosColumn := 1
              else
                Inc(PosColumn);
            end;
            Dec(Steps);
          end;
        end;
      3, 4, 5 : //LEFT, RIGHT, TURNAROUND
        begin
          ChangeFace(FirstWord);
        end;
      end;
      RobotGrid.Cells[PosColumn, PosRow] := Face;
      RobotGrid.Repaint;
      Sleep(StrToIntDef(EditTime.Text, 1000));
    end;
  end;
  LabelResult.Caption := Face + '(' + IntToStr(PosColumn + 1) + ', ' + IntToStr(PosRow + 1) + ')';
end;

procedure TRobotForm.ChangeFace(Command: string);
begin
  if Face = 'NORTH' then
  begin
    if Command = 'LEFT' then
      Face := 'WEST'
    else
    if Command = 'RIGHT' then
      Face := 'EAST'
    else
    if Command = 'TURNAROUND' then
      Face := 'SOUTH';
  end else
  if Face = 'SOUTH' then
  begin
    if Command = 'LEFT' then
      Face := 'EAST'
    else
    if Command = 'RIGHT' then
      Face := 'WEST'
    else
    if Command = 'TURNAROUND' then
      Face := 'NORTH';
  end else
  if Face = 'WEST' then
  begin
    if Command = 'LEFT' then
      Face := 'SOUTH'
    else
    if Command = 'RIGHT' then
      Face := 'NORTH'
    else
    if Command = 'TURNAROUND' then
      Face := 'EAST';
  end else
  if Face = 'EAST' then
  begin
    if Command = 'LEFT' then
      Face := 'NORTH'
    else
    if Command = 'RIGHT' then
      Face := 'SOUTH'
    else
    if Command = 'TURNAROUND' then
      Face := 'WEST';
  end;
end;

procedure TRobotForm.FormCreate(Sender: TObject);
begin
  PosColumn := 0;
  PosRow := 0;
  Face := 'SOUTH';
  RobotGrid.Cells[PosColumn, PosRow] := Face;
  RobotGrid.Selection := NoSelection;
  LabelResult.Caption := Face + '(' + IntToStr(PosColumn + 1) + ', ' + IntToStr(PosRow + 1) + ')';
end;

procedure TRobotForm.RobotGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ACol = PosColumn) and (ARow = PosRow) then
  begin
    RobotGrid.Canvas.Brush.Color := clGreen;
    RobotGrid.Canvas.FillRect(Rect);
    RobotGrid.Canvas.TextOut(Rect.Left+2, Rect.Top+2, RobotGrid.Cells[ACol, ARow]);
  end;
end;

end.
