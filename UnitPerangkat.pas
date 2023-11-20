unit UnitPerangkat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormPerangkat = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure ComboBox1DropDown(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPerangkat: TFormPerangkat;

implementation

{$R *.dfm}

uses UnitDataModule;

procedure TFormPerangkat.Button1Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex >= 0 then
  begin
    try
      DataModule1.ZQueryPerangkat.SQL.Text := 'INSERT INTO aktivasi (id_perangkat) VALUES (:id_perangkat)';
      DataModule1.ZQueryPerangkat.Params.ParamByName('id_perangkat').Value := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
      DataModule1.ZQueryPerangkat.ExecSQL;

      DataModule1.ZQueryPerangkat.Close;
      DataModule1.ZQueryPerangkat.SQL.Text :=
      'SELECT aktivasi.id_aktivasi, perangkat.nama_perangkat, perangkat.tanggal, perangkat.jenis, status.status, lokasi.nama_tempat, lokasi.koordinat, lokasi.alamat, desa.desa, kecamatan.kecamatan' +
      ' FROM aktivasi' +
      ' INNER JOIN perangkat ON aktivasi.id_perangkat = perangkat.id_perangkat'+
      ' INNER JOIN status ON perangkat.id_status=status.id_status' +
      ' INNER JOIN lokasi ON perangkat.id_lokasi=lokasi.id_lokasi' +
      ' INNER JOIN desa ON lokasi.id_desa=desa.id_desa' +
      ' INNER JOIN kecamatan ON lokasi.id_kecamatan=kecamatan.id_kecamatan';
      DataModule1.ZQueryPerangkat.Open;
      ShowMessage('Data berhasil disimpan');
      ComboBox1.ItemIndex := -1;
      except
      on E: Exception do
        begin
          ShowMessage('Error: ' + E.Message);
        end;
    end;
  end
    else
    if ComboBox1.Text = '' then
    begin
      Showmessage('perangkat masih kosong');
      ComboBox1.SetFocus;
    end
end;

procedure TFormPerangkat.Button2Click(Sender: TObject);
begin
if ComboBox1.ItemIndex >= 0 then
  begin
    try
      var IDAktivasi: Integer := DataModule1.ZQueryPerangkat.FieldByName('id_aktivasi').AsInteger;
      DataModule1.ZQueryPerangkat.SQL.Text := 'UPDATE aktivasi SET id_perangkat = :id_perangkat WHERE id_aktivasi = :id_aktivasi';
      DataModule1.ZQueryPerangkat.Params.ParamByName('id_perangkat').Value := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
      DataModule1.ZQueryPerangkat.Params.ParamByName('id_aktivasi').Value := IDAktivasi;
      DataModule1.ZQueryPerangkat.ExecSQL;

      DataModule1.ZQueryPerangkat.Close;
      DataModule1.ZQueryPerangkat.SQL.Text :=
      'SELECT aktivasi.id_aktivasi, perangkat.nama_perangkat, perangkat.tanggal, perangkat.jenis, status.status, lokasi.nama_tempat, lokasi.koordinat, lokasi.alamat, desa.desa, kecamatan.kecamatan' +
      ' FROM aktivasi' +
      ' INNER JOIN perangkat ON aktivasi.id_perangkat = perangkat.id_perangkat'+
      ' INNER JOIN status ON perangkat.id_status=status.id_status' +
      ' INNER JOIN lokasi ON perangkat.id_lokasi=lokasi.id_lokasi' +
      ' INNER JOIN desa ON lokasi.id_desa=desa.id_desa' +
      ' INNER JOIN kecamatan ON lokasi.id_kecamatan=kecamatan.id_kecamatan';
      DataModule1.ZQueryPerangkat.Open;
      ShowMessage('Data berhasil diubah');
      ComboBox1.ItemIndex := -1;
      except
      on E: Exception do
        begin
          ShowMessage('Error: ' + E.Message);
        end;
    end;
  end
    else
    if ComboBox1.Text = '' then
    begin
      Showmessage('perangkat masih kosong');
      ComboBox1.SetFocus;
    end
end;

procedure TFormPerangkat.Button3Click(Sender: TObject);
begin
ComboBox1.ItemIndex := -1;
end;

procedure TFormPerangkat.Button4Click(Sender: TObject);
begin
try
  if messageDlg('Apakah yakin data '+ DataModule1.ZQueryPerangkat.FieldByName('nama_perangkat').AsString+' akan dihapus?',mtConfirmation,[Mbyes,Mbno],0)=mryes then
  begin
    var IDAktivasi: Integer := DataModule1.ZQueryPerangkat.FieldByName('id_aktivasi').AsInteger;

    DataModule1.ZQueryPerangkat.Close;
    DataModule1.ZQueryPerangkat.SQL.Text := 'SELECT id_aktivasi FROM aktivasi WHERE id_aktivasi = :id_aktivasi';
    DataModule1.ZQueryPerangkat.Params.ParamByName('id_aktivasi').Value := IDAktivasi;
    DataModule1.ZQueryPerangkat.Open;

    if not DataModule1.ZQueryPerangkat.IsEmpty then
    begin
    DataModule1.ZQueryPerangkat.Close;

    DataModule1.ZQueryPerangkat.SQL.Text := 'DELETE FROM aktivasi WHERE id_aktivasi = :id_aktivasi';
    DataModule1.ZQueryPerangkat.Params.ParamByName('id_aktivasi').Value := IDAktivasi;
    DataModule1.ZQueryPerangkat.ExecSQL;

    DataModule1.ZQueryPerangkat.SQL.Text := 'ALTER TABLE aktivasi AUTO_INCREMENT = 1';
    DataModule1.ZQueryPerangkat.ExecSQL;

    DataModule1.ZQueryPerangkat.Close;
    DataModule1.ZQueryPerangkat.SQL.Text :=
      'SELECT aktivasi.id_aktivasi, perangkat.nama_perangkat, perangkat.tanggal, perangkat.jenis, status.status, lokasi.nama_tempat, lokasi.koordinat, lokasi.alamat, desa.desa, kecamatan.kecamatan' +
      ' FROM aktivasi' +
      ' INNER JOIN perangkat ON aktivasi.id_perangkat = perangkat.id_perangkat'+
      ' INNER JOIN status ON perangkat.id_status=status.id_status' +
      ' INNER JOIN lokasi ON perangkat.id_lokasi=lokasi.id_lokasi' +
      ' INNER JOIN desa ON lokasi.id_desa=desa.id_desa' +
      ' INNER JOIN kecamatan ON lokasi.id_kecamatan=kecamatan.id_kecamatan';
    DataModule1.ZQueryPerangkat.Open;

    ShowMessage('Data berhasil dihapus');
    ComboBox1.ItemIndex := -1;
    end
    else
    begin
      ShowMessage('Data tidak ditemukan');
    end;
  end;
  except
    ShowMessage('Terjadi kesalahan saat menghapus data');
end;
end;

procedure TFormPerangkat.ComboBox1DropDown(Sender: TObject);
begin
  DataModule1.ZQueryTambahPerangkat.Close;
  DataModule1.ZQueryTambahPerangkat.SQL.Text := 'SELECT * FROM perangkat';
  DataModule1.ZQueryTambahPerangkat.Open;

  if not DataModule1.ZQueryTambahPerangkat.IsEmpty then
  begin
    ComboBox1.Items.Clear;
    while not DataModule1.ZQueryTambahPerangkat.Eof do
    begin
      ComboBox1.Items.AddObject(DataModule1.ZQueryTambahPerangkat.FieldByName('nama_perangkat').AsString, TObject(DataModule1.ZQueryTambahPerangkat.FieldByName('id_nama_perangkat').AsInteger));
      DataModule1.ZQueryTambahPerangkat.Next;
    end;
  end;
  DataModule1.ZQueryTambahPerangkat.Close;
end;

procedure TFormPerangkat.FormShow(Sender: TObject);
begin
  DataModule1.ZQueryPerangkat.Active := True;
end;

end.
