object FormTambahLokasi: TFormTambahLokasi
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormTambahLokasi'
  ClientHeight = 690
  ClientWidth = 1370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1370
    Height = 690
    TabOrder = 0
    object Label1: TLabel
      Left = 136
      Top = 72
      Width = 74
      Height = 15
      Caption = 'Nama Tempat'
    end
    object Label2: TLabel
      Left = 136
      Top = 120
      Width = 52
      Height = 15
      Caption = 'Koordinat'
    end
    object Label3: TLabel
      Left = 137
      Top = 166
      Width = 38
      Height = 15
      Caption = 'Alamat'
    end
    object Label4: TLabel
      Left = 409
      Top = 72
      Width = 25
      Height = 15
      Caption = 'Desa'
    end
    object Label5: TLabel
      Left = 409
      Top = 120
      Width = 59
      Height = 15
      Caption = 'Kecamatan'
    end
    object Label6: TLabel
      Left = 137
      Top = 309
      Width = 101
      Height = 15
      Caption = 'Cari Nama Tempat:'
    end
    object Label7: TLabel
      Left = 633
      Top = 315
      Width = 68
      Height = 15
      Caption = 'Jumlah Data:'
    end
    object Label8: TLabel
      Left = 707
      Top = 315
      Width = 6
      Height = 15
      Caption = '0'
    end
    object Label9: TLabel
      Left = 409
      Top = 166
      Width = 106
      Height = 15
      Caption = 'Jenis Tempat Ibadah'
    end
    object DBGrid1: TDBGrid
      Left = 137
      Top = 336
      Width = 976
      Height = 337
      DataSource = DataModule1.DataSourceTambahLokasi
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
    end
    object Edit1: TEdit
      Left = 232
      Top = 69
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 232
      Top = 117
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 232
      Top = 163
      Width = 121
      Height = 23
      TabOrder = 3
    end
    object Button1: TButton
      Left = 137
      Top = 257
      Width = 75
      Height = 25
      Caption = 'Tambah'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 218
      Top = 257
      Width = 75
      Height = 25
      Caption = 'Ubah'
      TabOrder = 5
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 302
      Top = 257
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 6
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 383
      Top = 257
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 7
      OnClick = Button4Click
    end
    object ComboBox1: TComboBox
      Left = 480
      Top = 69
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 8
      OnDropDown = ComboBox1DropDown
    end
    object ComboBox2: TComboBox
      Left = 474
      Top = 117
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 9
      OnDropDown = ComboBox2DropDown
    end
    object Edit4: TEdit
      Left = 244
      Top = 307
      Width = 121
      Height = 23
      TabOrder = 10
      OnChange = Edit4Change
    end
    object ComboBox3: TComboBox
      Left = 528
      Top = 163
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 11
      OnDropDown = ComboBox3DropDown
    end
  end
end
