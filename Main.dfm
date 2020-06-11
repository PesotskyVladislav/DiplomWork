object frmDiplom: TfrmDiplom
  Left = 0
  Top = 0
  Caption = 'frmDiplom'
  ClientHeight = 487
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object iGraph: TImage
    Left = 0
    Top = 41
    Width = 1000
    Height = 446
    Align = alClient
    ExplicitLeft = 40
    ExplicitTop = 144
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object pnlGraph: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnGraph: TButton
      Left = 152
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1075#1088#1072#1092
      TabOrder = 0
      OnClick = btnGraphClick
      ExplicitLeft = 8
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object cbPlan: TDBComboBox
      AlignWithMargins = True
      Left = 4
      Top = 10
      Width = 145
      Height = 21
      Margins.Top = 9
      Align = alLeft
      DataSource = DataSource1
      TabOrder = 1
      ExplicitLeft = 192
      ExplicitTop = 14
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=diplom_database;Data Source=DEV-PESOTSKY2'
    Provider = 'SQLOLEDB.1'
    Left = 328
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'SELECT id_plan, plan_name'
      'FROM v_plan')
    Left = 408
    Top = 8
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'sp_get_plan;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@id_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end>
    Left = 496
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 400
    Top = 72
  end
end
