object FormPerangkat: TFormPerangkat
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'FormPerangkat'
  ClientHeight = 690
  ClientWidth = 1370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1370
    Height = 690
    Align = alClient
    Caption = 'DataModule1.DataSourcePerangkat'
    TabOrder = 0
    object Label1: TLabel
      Left = 137
      Top = 104
      Width = 56
      Height = 15
      Caption = 'Perangkat:'
    end
    object DBGrid1: TDBGrid
      Left = 137
      Top = 320
      Width = 1105
      Height = 225
      DataSource = DataModule1.DataSourcePerangkat
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object ComboBox1: TComboBox
      Left = 216
      Top = 101
      Width = 145
      Height = 23
      TabOrder = 1
      OnDropDown = ComboBox1DropDown
    end
    object Button1: TButton
      Left = 137
      Top = 216
      Width = 75
      Height = 25
      Caption = 'Tambah'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 218
      Top = 216
      Width = 75
      Height = 25
      Caption = 'Ubah'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 299
      Top = 216
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 380
      Top = 216
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 5
      OnClick = Button4Click
    end
  end
end
