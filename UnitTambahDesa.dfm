object FormTambahDesa: TFormTambahDesa
  Left = 0
  Top = 0
  Caption = 'FormTambahDesa'
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
    TabStop = True
    ExplicitWidth = 620
    ExplicitHeight = 439
    object Label1: TLabel
      Left = 80
      Top = 80
      Width = 24
      Height = 15
      Caption = 'desa'
    end
    object Label2: TLabel
      Left = 80
      Top = 227
      Width = 49
      Height = 15
      Caption = 'Cari Desa'
    end
    object Label3: TLabel
      Left = 350
      Top = 267
      Width = 71
      Height = 15
      Caption = 'Jumlah Data: '
    end
    object Label4: TLabel
      Left = 427
      Top = 267
      Width = 6
      Height = 15
      Caption = '0'
    end
    object DBGrid1: TDBGrid
      Left = 80
      Top = 253
      Width = 219
      Height = 174
      DataSource = DataModule1.DataSourceTambahDesa
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'id_desa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'desa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'created_at'
          ReadOnly = False
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'updated_at'
          ReadOnly = False
          Visible = False
        end>
    end
    object Edit1: TEdit
      Left = 115
      Top = 77
      Width = 121
      Height = 23
      TabOrder = 1
      OnKeyUp = Edit1KeyUp
    end
    object Button1: TButton
      Left = 80
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Tambah'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 161
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Ubah'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 242
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 323
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 5
      OnClick = Button4Click
    end
    object Edit2: TEdit
      Left = 135
      Top = 224
      Width = 121
      Height = 23
      TabOrder = 6
      OnChange = Edit2Change
    end
  end
end
