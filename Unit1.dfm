object RobotForm: TRobotForm
  Left = 0
  Top = 0
  Caption = 'RobotForm'
  ClientHeight = 527
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelInput: TLabel
    Left = 8
    Top = 329
    Width = 406
    Height = 13
    Caption = 
      'Input your command by typing or using the buttons above then cli' +
      'ck GO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelCommands: TLabel
    Left = 8
    Top = 215
    Width = 63
    Height = 13
    Caption = 'Commands'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelFace: TLabel
    Left = 8
    Top = 265
    Width = 26
    Height = 13
    Caption = 'Face'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelWait: TLabel
    Left = 8
    Top = 448
    Width = 281
    Height = 13
    Caption = 'Waiting time between commands (in miliseconds)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOutput: TLabel
    Left = 8
    Top = 488
    Width = 42
    Height = 13
    Caption = 'Output:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelResult: TLabel
    Left = 56
    Top = 488
    Width = 66
    Height = 13
    Caption = 'LabelResult'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RobotGrid: TStringGrid
    Left = 8
    Top = 8
    Width = 521
    Height = 201
    TabStop = False
    ColCount = 8
    Ctl3D = True
    DefaultColAlignment = taCenter
    Enabled = False
    FixedColor = clNone
    FixedCols = 0
    RowCount = 8
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goFixedRowDefAlign]
    ParentCtl3D = False
    ScrollBars = ssNone
    TabOrder = 0
    OnDrawCell = RobotGridDrawCell
  end
  object BtnPosition: TButton
    Left = 8
    Top = 234
    Width = 80
    Height = 25
    Caption = 'POSITION'
    TabOrder = 1
    OnClick = BtnCommandClick
  end
  object BtnForward: TButton
    Left = 94
    Top = 234
    Width = 80
    Height = 25
    Caption = 'FORWARD'
    TabOrder = 2
    OnClick = BtnCommandClick
  end
  object BtnWait: TButton
    Left = 180
    Top = 234
    Width = 80
    Height = 25
    Caption = 'WAIT'
    TabOrder = 3
    OnClick = BtnCommandClick
  end
  object BtnTurnaround: TButton
    Left = 266
    Top = 234
    Width = 80
    Height = 25
    Caption = 'TURNAROUND'
    TabOrder = 4
    OnClick = BtnCommandClick
  end
  object BtnRight: TButton
    Left = 438
    Top = 234
    Width = 80
    Height = 25
    Caption = 'RIGHT'
    TabOrder = 5
    OnClick = BtnCommandClick
  end
  object BtnLeft: TButton
    Left = 352
    Top = 234
    Width = 80
    Height = 25
    Caption = 'LEFT'
    TabOrder = 6
    OnClick = BtnCommandClick
  end
  object BtnNorth: TButton
    Left = 8
    Top = 284
    Width = 80
    Height = 25
    Caption = 'NORTH'
    TabOrder = 7
    OnClick = BtnCommandClick
  end
  object BtnSouth: TButton
    Left = 94
    Top = 284
    Width = 80
    Height = 25
    Caption = 'SOUTH'
    TabOrder = 8
    OnClick = BtnCommandClick
  end
  object BtnWest: TButton
    Left = 180
    Top = 284
    Width = 80
    Height = 25
    Caption = 'WEST'
    TabOrder = 9
    OnClick = BtnCommandClick
  end
  object BtnEast: TButton
    Left = 266
    Top = 284
    Width = 80
    Height = 25
    Caption = 'EAST'
    TabOrder = 10
    OnClick = BtnCommandClick
  end
  object MemoCommands: TMemo
    Left = 8
    Top = 348
    Width = 521
    Height = 89
    TabOrder = 11
  end
  object Go: TButton
    Left = 454
    Top = 443
    Width = 75
    Height = 25
    Caption = 'GO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 12
    OnClick = GoClick
  end
  object EditTime: TEdit
    Left = 295
    Top = 445
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 13
    Text = '1000'
  end
end
