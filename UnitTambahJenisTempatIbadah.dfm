object FormTambahJenisTempatIbadah: TFormTambahJenisTempatIbadah
  Left = 0
  Top = 0
  Caption = 'FormTambahJenisTempatIbadah'
  ClientHeight = 442
  ClientWidth = 628
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
    Top = -1
    Width = 650
    Height = 481
    TabOrder = 0
    object Label1: TLabel
      Left = 129
      Top = 88
      Width = 106
      Height = 15
      Caption = 'Jenis Tempat Ibadah'
    end
    object Label2: TLabel
      Left = 129
      Top = 267
      Width = 130
      Height = 15
      Caption = 'Cari Jenis Tempat Ibadah'
    end
    object Label3: TLabel
      Left = 440
      Top = 267
      Width = 68
      Height = 15
      Caption = 'Jumlah Data:'
    end
    object Label4: TLabel
      Left = 514
      Top = 267
      Width = 6
      Height = 15
      Caption = '0'
    end
    object DBGrid1: TDBGrid
      Left = 129
      Top = 293
      Width = 272
      Height = 129
      DataSource = DataModule1.DataSourceTambahJenisTempatIbadah
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
    end
    object Button1: TButton
      Left = 129
      Top = 197
      Width = 75
      Height = 25
      Caption = 'Tambah'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 210
      Top = 197
      Width = 75
      Height = 25
      Caption = 'Ubah'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 291
      Top = 197
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 372
      Top = 197
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Edit1: TEdit
      Left = 252
      Top = 85
      Width = 121
      Height = 23
      TabOrder = 5
    end
    object Edit2: TEdit
      Left = 265
      Top = 264
      Width = 121
      Height = 23
      TabOrder = 6
      OnChange = Edit2Change
    end
  end
end
