object FormTambahStatus: TFormTambahStatus
  Left = 0
  Top = 0
  Caption = 'FormTambahStatus'
  ClientHeight = 440
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 440
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 620
    ExplicitHeight = 439
    object Label1: TLabel
      Left = 128
      Top = 104
      Width = 31
      Height = 15
      Caption = 'status'
    end
    object Label2: TLabel
      Left = 128
      Top = 228
      Width = 59
      Height = 15
      Caption = 'Cari Status:'
    end
    object Label3: TLabel
      Left = 352
      Top = 228
      Width = 68
      Height = 15
      Caption = 'Jumlah Data:'
    end
    object Label4: TLabel
      Left = 426
      Top = 228
      Width = 6
      Height = 15
      Caption = '0'
    end
    object Edit1: TEdit
      Left = 184
      Top = 101
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object Button1: TButton
      Left = 128
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Tambah'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 209
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Ubah'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 290
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 371
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 4
      OnClick = Button4Click
    end
    object DBGrid1: TDBGrid
      Left = 128
      Top = 257
      Width = 169
      Height = 161
      DataSource = DataModule1.DataSourceTambahStatus
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
    end
    object Edit2: TEdit
      Left = 193
      Top = 228
      Width = 121
      Height = 23
      TabOrder = 6
      OnChange = Edit2Change
    end
  end
end
