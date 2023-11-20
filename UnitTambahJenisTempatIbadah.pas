unit UnitTambahJenisTempatIbadah;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TFormTambahJenisTempatIbadah = class(TForm)
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
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure User;
  end;

var
  FormTambahJenisTempatIbadah: TFormTambahJenisTempatIbadah;
  Username, Password: String;

implementation

{$R *.dfm}

uses UnitDataModule, UnitLogin;

procedure TFormTambahJenisTempatIbadah.User;
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

procedure TFormTambahJenisTempatIbadah.Button1Click(Sender: TObject);
var
  InsertedData : string;
begin
if (edit1.Text <> '') then
      begin
      try
        DataModule1.ZQueryTambahJenisTempatIbadah.SQL.Text := 'INSERT INTO jenis_tempat_ibadah (jenis_tempat_ibadah)' + 'VALUES (:jenis_tempat_ibadah)';
        DataModule1.ZQueryTambahJenisTempatIbadah.Params.ParamByName('jenis_tempat_ibadah').Value := Edit1.Text;
        DataModule1.ZQueryTambahJenisTempatIbadah.ExecSQL;

        DataModule1.ZQueryTambahJenisTempatIbadah.Close;
        DataModule1.ZQueryTambahJenisTempatIbadah.SQL.Text := 'SELECT * FROM jenis_tempat_ibadah';
        DataModule1.ZQueryTambahJenisTempatIbadah.Open;

        Label4.Caption := IntToStr(DataModule1.ZQueryTambahJenisTempatIbadah.RecordCount);

        User;
        InsertedData := DataModule1.ZQueryTambahJenisTempatIbadah.FieldByName('jenis_tempat_ibadah').AsString;
        LogActivity('Menambah data jenis tempat ibadah ' + InsertedData, username);

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
      Showmessage('Jenis Tempat Ibadah masih kosong');
      edit1.SetFocus;
    end
end;

procedure TFormTambahJenisTempatIbadah.Button2Click(Sender: TObject);
var
  OldData , UpdatedData: string;
begin
if (edit1.Text <> '') then
      begin
        OldData := DataModule1.ZQueryTambahJenisTempatIbadah.FieldByName('jenis_tempat_ibadah').AsString;
      try
        var IDJenisTempatIbadah: Integer := DataModule1.ZQueryTambahJenisTempatIbadah.FieldByName('id_jenis_tempat_ibadah').AsInteger;

        DataModule1.ZQueryTambahJenisTempatIbadah.SQL.Text := 'UPDATE jenis_tempat_ibadah SET jenis_tempat_ibadah = :jenis_tempat_ibadah WHERE id_jenis_tempat_ibadah = :id_jenis_tempat_ibadah ';
        DataModule1.ZQueryTambahJenisTempatIbadah.Params.ParamByName('jenis_tempat_ibadah').Value := Edit1.Text;
        DataModule1.ZQueryTambahJenisTempatIbadah.Params.ParamByName('id_jenis_tempat_ibadah').Value := IDJenisTempatIbadah;
        DataModule1.ZQueryTambahJenisTempatIbadah.ExecSQL;

        DataModule1.ZQueryTambahJenisTempatIbadah.Close;
        DataModule1.ZQueryTambahJenisTempatIbadah.SQL.Text := 'SELECT * FROM jenis_tempat_ibadah';
        DataModule1.ZQueryTambahJenisTempatIbadah.Open;

        User;
        UpdatedData := DataModule1.ZQueryTambahJenisTempatIbadah.FieldByName('jenis_tempat_ibadah').AsString;
        LogActivity('Mengubah data jenis_tempat_ibadah ' + OldData + ' menjadi '+ UpdatedData , username);

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
      Showmessage('Jenis Tempat Ibadah masih kosong');
      edit1.SetFocus;
    end
end;

procedure TFormTambahJenisTempatIbadah.Button3Click(Sender: TObject);
var
  DeletedData : string;
begin
  try
    DeletedData := DataModule1.ZQueryTambahJenisTempatIbadah.FieldByName('jenis_tempat_ibadah').AsString;
  if messageDlg('Apakah yakin data '+ DataModule1.ZQueryTambahJenisTempatIbadah.FieldByName('jenis_tempat_ibadah').AsString+' akan dihapus?',mtConfirmation,[Mbyes,Mbno],0)=mryes then
  begin
    var IDLokasi: Integer := DataModule1.ZQueryTambahJenisTempatIbadah.FieldByName('id_jenis_tempat_ibadah').AsInteger;

    if not DataModule1.ZQueryTambahJenisTempatIbadah.IsEmpty then
    begin
    DataModule1.ZQueryTambahJenisTempatIbadah.Close;

    DataModule1.ZQueryTambahJenisTempatIbadah.SQL.Text := 'DELETE FROM jenis_tempat_ibadah WHERE id_jenis_tempat_ibadah = :id_jenis_tempat_ibadah';
    DataModule1.ZQueryTambahJenisTempatIbadah.Params.ParamByName('id_jenis_tempat_ibadah').Value := IDLokasi;
    DataModule1.ZQueryTambahJenisTempatIbadah.ExecSQL;

    DataModule1.ZQueryTambahJenisTempatIbadah.SQL.Text := 'ALTER TABLE jenis_tempat_ibadah AUTO_INCREMENT = 1';
    DataModule1.ZQueryTambahJenisTempatIbadah.ExecSQL;

    DataModule1.ZQueryTambahJenisTempatIbadah.Close;
    DataModule1.ZQueryTambahJenisTempatIbadah.SQL.Text := 'SELECT * FROM jenis_tempat_ibadah';
    DataModule1.ZQueryTambahJenisTempatIbadah.Open;

    Label4.Caption := IntToStr(DataModule1.ZQueryTambahJenisTempatIbadah.RecordCount);

    User;
    LogActivity('Menghapus data jenis_tempat_ibadah ' + DeletedData, username);

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

procedure TFormTambahJenisTempatIbadah.Button4Click(Sender: TObject);
begin
  Edit1.Clear;
end;

procedure TFormTambahJenisTempatIbadah.Button5Click(Sender: TObject);
begin
  FormTambahJenisTempatIbadah.Close;
end;

procedure TFormTambahJenisTempatIbadah.DBGrid1CellClick(Column: TColumn);
begin
  Edit1.Text := DataModule1.ZQueryTambahJenisTempatIbadah.FieldByName('jenis_tempat_ibadah').AsString;
end;

procedure TFormTambahJenisTempatIbadah.Edit2Change(Sender: TObject);
begin
  DataModule1.ZQueryTambahJenisTempatIbadah.Close;
  DataModule1.ZQueryTambahJenisTempatIbadah.SQL.Text := 'SELECT * FROM jenis_tempat_ibadah WHERE jenis_tempat_ibadah LIKE :Search';
  DataModule1.ZQueryTambahJenisTempatIbadah.ParamByName('Search').AsString := '%' + Edit2.Text + '%';
  DataModule1.ZQueryTambahJenisTempatIbadah.Open;

  Label4.Caption := IntToStr(DataModule1.ZQueryTambahJenisTempatIbadah.RecordCount);
end;

procedure TFormTambahJenisTempatIbadah.FormShow(Sender: TObject);
begin
  DataModule1.ZConnection1.Connected := True;
  DataModule1.ZQueryTambahJenisTempatIbadah.Active := True;

  Label4.Caption := IntToStr(DataModule1.ZQueryTambahJenisTempatIbadah.RecordCount);
end;

end.
