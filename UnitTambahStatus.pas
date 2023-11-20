unit UnitTambahStatus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormTambahStatus = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure User;
  end;

var
  FormTambahStatus: TFormTambahStatus;
  Username, Password: String;

implementation

{$R *.dfm}

uses UnitDataModule, UnitLogin;

procedure TFormTambahStatus.User;
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


procedure TFormTambahStatus.Button1Click(Sender: TObject);
var
  InsertedData : string;
begin
if (edit1.Text <> '') then
      begin
      try
        DataModule1.ZQueryTambahStatus.SQL.Text := 'INSERT INTO status (status)' + 'VALUES (:status)';
        DataModule1.ZQueryTambahStatus.Params.ParamByName('status').Value := Edit1.Text;
        DataModule1.ZQueryTambahStatus.ExecSQL;

        DataModule1.ZQueryTambahStatus.Close;
        DataModule1.ZQueryTambahStatus.SQL.Text := 'SELECT * FROM status';
        DataModule1.ZQueryTambahStatus.Open;

        Label4.Caption := IntToStr(DBGrid1.DataSource.DataSet.RecordCount);

        User;
        InsertedData := DataModule1.ZQueryTambahStatus.FieldByName('status').AsString;
        LogActivity('Menambah data status ' + InsertedData, username);

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
      Showmessage('Status masih kosong');
      edit1.SetFocus;
    end
end;

procedure TFormTambahStatus.Button2Click(Sender: TObject);
var
  OldData, UpdatedData : string;
begin
  OldData := DataModule1.ZQueryTambahStatus.FieldByName('status').AsString;
if (edit1.Text <> '') then
      begin
      try
        var IDStatus: Integer := DataModule1.ZQueryTambahStatus.FieldByName('id_status').AsInteger;

        DataModule1.ZQueryTambahStatus.SQL.Text := 'UPDATE status SET status = :status WHERE id_status = :id_status ';
        DataModule1.ZQueryTambahStatus.Params.ParamByName('status').Value := Edit1.Text;
        DataModule1.ZQueryTambahStatus.Params.ParamByName('id_status').Value := IDStatus;
        DataModule1.ZQueryTambahStatus.ExecSQL;

        DataModule1.ZQueryTambahStatus.Close;
        DataModule1.ZQueryTambahStatus.SQL.Text := 'SELECT * FROM status';
        DataModule1.ZQueryTambahStatus.Open;

        User;
        UpdatedData := DataModule1.ZQueryTambahStatus.FieldByName('status').AsString;
        LogActivity('Mengubah data desa ' + OldData + ' menjadi '+ UpdatedData , username);

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
      Showmessage('Status masih kosong');
      edit1.SetFocus;
    end
end;

procedure TFormTambahStatus.Button3Click(Sender: TObject);
var
  DeletedData: String;
begin
try
  DeletedData := DataModule1.ZQueryTambahStatus.FieldByName('status').AsString;
  if messageDlg('Apakah yakin data '+ DataModule1.ZQueryTambahStatus.FieldByName('status').AsString+' akan dihapus?',mtConfirmation,[Mbyes,Mbno],0)=mryes then
  begin
    var IDStatus: Integer := DataModule1.ZQueryTambahStatus.FieldByName('id_status').AsInteger;

    if not DataModule1.ZQueryTambahStatus.IsEmpty then
    begin
    DataModule1.ZQueryTambahStatus.Close;

    DataModule1.ZQueryTambahStatus.SQL.Text := 'DELETE FROM status WHERE id_status = :id_status';
    DataModule1.ZQueryTambahStatus.Params.ParamByName('id_status').Value := IDStatus;
    DataModule1.ZQueryTambahStatus.ExecSQL;

    DataModule1.ZQueryTambahStatus.SQL.Text := 'ALTER TABLE status AUTO_INCREMENT = 1';
    DataModule1.ZQueryTambahStatus.ExecSQL;

    DataModule1.ZQueryTambahStatus.Close;
    DataModule1.ZQueryTambahStatus.SQL.Text := 'SELECT * FROM status';
    DataModule1.ZQueryTambahStatus.Open;
    Label4.Caption := IntToStr(DataModule1.ZQueryTambahStatus.RecordCount);

    User;
    LogActivity('Menghapus data status ' + DeletedData, username);

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

procedure TFormTambahStatus.Button4Click(Sender: TObject);
begin
Edit1.Clear;
end;

procedure TFormTambahStatus.DBGrid1CellClick(Column: TColumn);
begin
Edit1.Text := DataModule1.ZQueryTambahStatus.FieldByName('status').AsString;
end;

procedure TFormTambahStatus.Edit2Change(Sender: TObject);
begin
    DataModule1.ZQueryTambahStatus.Close;
    DataModule1.ZQueryTambahStatus.SQL.Text := 'SELECT * FROM status WHERE status LIKE :Search';
    DataModule1.ZQueryTambahStatus.ParamByName('Search').AsString := '%' + Edit2.Text + '%';
    DataModule1.ZQueryTambahStatus.Open;

    Label4.Caption := IntToStr(DBGrid1.DataSource.DataSet.RecordCount);
end;

procedure TFormTambahStatus.FormShow(Sender: TObject);
begin
  DataModule1.ZConnection1.Connected := True;
  DataModule1.ZQueryTambahStatus.Active := True;

end;

end.
