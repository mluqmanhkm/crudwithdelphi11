object FormTambahKecamatan: TFormTambahKecamatan
  Left = 0
  Top = 0
  Caption = 'FormTambahKecamatan'
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
    Width = 1377
    Height = 705
    TabOrder = 0
    object Label1: TLabel
      Left = 136
      Top = 56
      Width = 59
      Height = 15
      Caption = 'Kecamatan'
    end
    object Label2: TLabel
      Left = 136
      Top = 208
      Width = 83
      Height = 15
      Caption = 'Cari Kecamatan'
    end
    object Label3: TLabel
      Left = 388
      Top = 213
      Width = 68
      Height = 15
      Caption = 'Jumlah Data:'
    end
    object Label4: TLabel
      Left = 462
      Top = 213
      Width = 6
      Height = 15
      Caption = '0'
    end
    object DBGrid1: TDBGrid
      Left = 136
      Top = 248
      Width = 320
      Height = 120
      DataSource = DataModule1.DataSourceTambahKecamatan
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
    end
    object Button1: TButton
      Left = 136
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Tambah'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 217
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Ubah'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 298
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 379
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Edit1: TEdit
      Left = 217
      Top = 53
      Width = 121
      Height = 23
      TabOrder = 5
    end
    object Edit2: TEdit
      Left = 225
      Top = 205
      Width = 121
      Height = 23
      TabOrder = 6
      OnChange = Edit2Change
    end
  end
end
