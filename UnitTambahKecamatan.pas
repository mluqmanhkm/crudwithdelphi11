unit UnitTambahKecamatan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormTambahKecamatan = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure User;
  end;

var
  FormTambahKecamatan: TFormTambahKecamatan;
  Username, Password: String;

implementation

{$R *.dfm}

uses UnitDataModule, UnitLogin;

procedure TFormTambahKecamatan.User;
begin
  Username := UnitLogin.FormLogin.Edit1.Text;
  Password := UnitLogin.FormLogin.Edit2.Text;

  DataModule1.ZQueryUser.SQL.Text := 'SELECT * FROM akun WHERE username = :username AND password = :password';
  DataModule1.ZQueryUser.Params.ParamByName('username').Value := Username;
  DataModule1.ZQueryUser.Params.ParamByName('password').Value := Password;
  DataModule1.ZQueryUser.Open;
end;

procedure LogActivity(aktivitas, admin: string);
begin
  DataModule1.ZQueryLog.SQL.Text := 'INSERT INTO log (aktivitas, tanggal, admin) VALUES (:aktivitas, :tanggal, :admin)';
  DataModule1.ZQueryLog.ParamByName('aktivitas').AsString := aktivitas;
  DataModule1.ZQueryLog.ParamByName('tanggal').AsDateTime := Now;
  DataModule1.ZQueryLog.ParamByName('admin').AsString := admin;
  DataModule1.ZQueryLog.ExecSQL;

  DataModule1.ZQueryLog.Close;
  DataModule1.ZQueryLog.SQL.Text := 'SELECT * FROM log';
  DataModule1.ZQueryLog.Open;
end;

procedure TFormTambahKecamatan.Button1Click(Sender: TObject);
var
  InsertedData : string;
begin
if (edit1.Text <> '') then
      begin
      try
        DataModule1.ZQueryTambahKecamatan.SQL.Text := 'INSERT INTO kecamatan (kecamatan)' + 'VALUES (:kecamatan)';
        DataModule1.ZQueryTambahKecamatan.Params.ParamByName('kecamatan').Value := Edit1.Text;
        DataModule1.ZQueryTambahKecamatan.ExecSQL;

        DataModule1.ZQueryTambahKecamatan.Close;
        DataModule1.ZQueryTambahKecamatan.SQL.Text := 'SELECT * FROM kecamatan';
        DataModule1.ZQueryTambahKecamatan.Open;

        Label4.Caption := IntToStr(DBGrid1.DataSource.DataSet.RecordCount);

        User;
        InsertedData := DataModule1.ZQueryTambahKecamatan.FieldByName('kecamatan').AsString;
        LogActivity('Menambah data kecamatan ' + InsertedData, username);

        ShowMessage('Data berhasil disimpan');
        Edit1.Clear;
        except
          on E: Exception do
          begin
            ShowMessage('Error: ' + E.Message);
          end;
        end;
      end
    else
    if edit1.Text = '' then
    begin
      Showmessage('Kecamatan masih kosong');
      edit1.SetFocus;
    end
end;

procedure TFormTambahKecamatan.Button2Click(Sender: TObject);
var
  OldData, UpdatedData : string;
begin
if (edit1.Text <> '') then
      begin
        OldData := DataModule1.ZQueryTambahKecamatan.FieldByName('kecamatan').AsString;
      try
        var IDKecamatan: Integer := DataModule1.ZQueryTambahKecamatan.FieldByName('id_kecamatan').AsInteger;

        DataModule1.ZQueryTambahKecamatan.SQL.Text := 'UPDATE kecamatan SET kecamatan = :kecamatan WHERE id_kecamatan = :id_kecamatan ';
        DataModule1.ZQueryTambahKecamatan.Params.ParamByName('kecamatan').Value := Edit1.Text;
        DataModule1.ZQueryTambahKecamatan.Params.ParamByName('id_kecamatan').Value := IDKecamatan;
        DataModule1.ZQueryTambahKecamatan.ExecSQL;

        DataModule1.ZQueryTambahKecamatan.Close;
        DataModule1.ZQueryTambahKecamatan.SQL.Text := 'SELECT * FROM kecamatan';
        DataModule1.ZQueryTambahKecamatan.Open;

        User;
        UpdatedData := DataModule1.ZQueryTambahKecamatan.FieldByName('kecamatan').AsString;
        LogActivity('Mengubah data kecamatan ' + OldData + ' menjadi '+ UpdatedData , username);

        ShowMessage('Data berhasil diubah');
        Edit1.Clear;
        except
          on E: Exception do
          begin
            ShowMessage('Error: ' + E.Message);
          end;
        end;
      end
    else
    if edit1.Text = '' then
    begin
      Showmessage('Kecamatan masih kosong');
      edit1.SetFocus;
    end
end;

procedure TFormTambahKecamatan.Button3Click(Sender: TObject);
var
  DeletedData: String;
begin
try
  DeletedData := DataModule1.ZQueryTambahkecamatan.FieldByName('kecamatan').AsString;

  if messageDlg('Apakah yakin data '+ DataModule1.ZQueryTambahkecamatan.FieldByName('kecamatan').AsString+' akan dihapus?',mtConfirmation,[Mbyes,Mbno],0)=mryes then
  begin
    var IDKecamatan: Integer := DataModule1.ZQueryTambahkecamatan.FieldByName('id_kecamatan').AsInteger;

    if not DataModule1.ZQueryTambahkecamatan.IsEmpty then
    begin
    DataModule1.ZQueryTambahkecamatan.Close;

    DataModule1.ZQueryTambahkecamatan.SQL.Text := 'DELETE FROM kecamatan WHERE id_kecamatan = :id_kecamatan';
    DataModule1.ZQueryTambahkecamatan.Params.ParamByName('id_kecamatan').Value := IDKecamatan;
    DataModule1.ZQueryTambahkecamatan.ExecSQL;

    DataModule1.ZQueryTambahkecamatan.SQL.Text := 'ALTER TABLE kecamatan AUTO_INCREMENT = 1';
    DataModule1.ZQueryTambahkecamatan.ExecSQL;

    DataModule1.ZQueryTambahkecamatan.Close;
    DataModule1.ZQueryTambahkecamatan.SQL.Text := 'SELECT * FROM kecamatan';
    DataModule1.ZQueryTambahkecamatan.Open;

    Label4.Caption := IntToStr(DataModule1.ZQueryTambahkecamatan.RecordCount);

    User;
    LogActivity('Menghapus data kecamatan ' + DeletedData, username);

    ShowMessage('Data berhasil dihapus');
    Edit1.Clear;
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

procedure TFormTambahKecamatan.Button4Click(Sender: TObject);
begin
  Edit1.Clear;
end;

procedure TFormTambahKecamatan.DBGrid1CellClick(Column: TColumn);
begin
  Edit1.Text := DataModule1.ZQueryTambahKecamatan.FieldByName('kecamatan').AsString;
end;

procedure TFormTambahKecamatan.Edit2Change(Sender: TObject);
begin
    DataModule1.ZQueryTambahKecamatan.Close;
    DataModule1.ZQueryTambahKecamatan.SQL.Text := 'SELECT * FROM kecamatan WHERE kecamatan LIKE :Search';
    DataModule1.ZQueryTambahKecamatan.ParamByName('Search').AsString := '%' + Edit2.Text + '%';
    DataModule1.ZQueryTambahKecamatan.Open;

    Label4.Caption := IntToStr(DBGrid1.DataSource.DataSet.RecordCount);
end;

procedure TFormTambahKecamatan.FormShow(Sender: TObject);
begin
  DataModule1.ZConnection1.Connected := True;
  DataModule1.ZQueryTambahKecamatan.Active := True;

  Label4.Caption := IntToStr(DBGrid1.DataSource.DataSet.RecordCount);
end;

end.
