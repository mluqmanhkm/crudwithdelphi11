unit UnitUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, ZAbstractConnection, ZConnection, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFormUser = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button6: TButton;
    Button4: TButton;
    Username: TLabel;
    Edit1: TEdit;
    Password: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    procedure User;
  end;

var
  FormUser: TFormUser;
  Username, Password: String;
  InsertedData : string;

implementation

{$R *.dfm}

uses UnitDataModule, UnitLogin;

//procedure TFormUser.User;
//begin
//  Username := UnitLogin.FormLogin.Edit1.Text;
//  Password := UnitLogin.FormLogin.Edit2.Text;
//
//  DataModule1.ZQueryUser.SQL.Text := 'SELECT * FROM akun WHERE username = :username AND password = :password';
//  DataModule1.ZQueryUser.Params.ParamByName('username').Value := Username;
//  DataModule1.ZQueryUser.Params.ParamByName('password').Value := Password;
//  DataModule1.ZQueryUser.Open;
//end;

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

procedure TFormUser.Button2Click(Sender: TObject);
begin
    if (edit3.Text <> '') and (edit1.Text <> '') and (edit2.Text <> '') and (edit4.Text <> '') and (ComboBox1.ItemIndex >= 0) and (edit5.Text <> '') then
      begin
      try
        DataModule1.ZQueryUser.SQL.Text := 'INSERT INTO akun (nama, username, password, email, hak_akses, no_hp)' + 'VALUES (:nama, :username, :password, :email, :hak_akses, :no_hp)';
        DataModule1.ZQueryUser.Params.ParamByName('nama').Value := Edit3.Text;
        DataModule1.ZQueryUser.Params.ParamByName('username').Value := Edit1.Text;
        DataModule1.ZQueryUser.Params.ParamByName('password').Value := Edit2.Text;
        DataModule1.ZQueryUser.Params.ParamByName('email').Value := Edit4.Text;
        DataModule1.ZQueryUser.Params.ParamByName('hak_akses').Value := ComboBox1.Text;
        DataModule1.ZQueryUser.Params.ParamByName('no_hp').Value := Edit5.Text;
        DataModule1.ZQueryUser.ExecSQL;

        DataModule1.ZQueryUser.Close;
        DataModule1.ZQueryUser.SQL.Text := 'SELECT * FROM akun';
        DataModule1.ZQueryUser.Open;

        Label7.Caption := IntToStr(DataModule1.ZQueryUser.RecordCount);

//        User;
//        InsertedData := DataModule1.ZQueryUser.FieldByName('username').AsString;
//        LogActivity('Menambah data user ' + InsertedData, username);

        ShowMessage('Data berhasil disimpan');
        Edit3.Clear;
        Edit1.Clear;
        Edit2.Clear;
        Edit4.Clear;
        ComboBox1.ItemIndex := -1;
        Edit5.Clear;
        except
          on E: Exception do
          begin
            ShowMessage('Error: ' + E.Message);
          end;
        end;
      end else

if edit3.Text = '' then
  begin
    Showmessage('Nama masih kosong');
    edit3.SetFocus;
  end else
if edit1.Text = '' then
  begin
    Showmessage('Username masih kosong');
    edit1.SetFocus;
  end else
  if edit2.Text = '' then
  begin
    Showmessage('Password masih kosong');
    edit2.SetFocus;
  end else
  if edit4.Text = '' then
  begin
    Showmessage('Email masih kosong');
    edit4.SetFocus;
  end else
  if ComboBox1.Text = '' then
  begin
    Showmessage('Hak Akses masih kosong');
    ComboBox1.SetFocus;
  end else
  if edit5.Text = '' then
  begin
    Showmessage('No Hp masih kosong');
    edit5.SetFocus;
  end else


//  begin
//    if (edit3.Text <> '') and (edit1.Text <> '') and (edit2.Text <> '') and (edit4.Text <> '') and (ComboBox1.ItemIndex >= 0) and (edit5.Text <> '') then
//      begin
//      try
//        DataModule1.ZQueryUser.SQL.Text := 'INSERT INTO akun (nama, username, password, email, hak_akses, no_hp)' + 'VALUES (:nama, :username, :password, :email, :hak_akses, :no_hp)';
//        DataModule1.ZQueryUser.Params.ParamByName('nama').Value := Edit3.Text;
//        DataModule1.ZQueryUser.Params.ParamByName('username').Value := Edit1.Text;
//        DataModule1.ZQueryUser.Params.ParamByName('password').Value := Edit2.Text;
//        DataModule1.ZQueryUser.Params.ParamByName('email').Value := Edit4.Text;
//        DataModule1.ZQueryUser.Params.ParamByName('hak_akses').Value := ComboBox1.Text;
//        DataModule1.ZQueryUser.Params.ParamByName('no_hp').Value := Edit5.Text;
//        DataModule1.ZQueryUser.ExecSQL;
//
//        DataModule1.ZQueryUser.Close;
//        DataModule1.ZQueryUser.SQL.Text := 'SELECT * FROM akun';
//        DataModule1.ZQueryUser.Open;
//
//        Label7.Caption := IntToStr(DataModule1.ZQueryUser.RecordCount);
//
////        User;
////        InsertedData := DataModule1.ZQueryUser.FieldByName('username').AsString;
////        LogActivity('Menambah data user ' + InsertedData, username);
//
//        ShowMessage('Data berhasil disimpan');
//        Edit3.Clear;
//        Edit1.Clear;
//        Edit2.Clear;
//        Edit4.Clear;
//        ComboBox1.ItemIndex := -1;
//        Edit5.Clear;
//        except
//          on E: Exception do
//          begin
//            ShowMessage('Error: ' + E.Message);
//          end;
//        end;
//      end
//  end;

//    with DataModule1.ZQueryUser do
//    begin
//      Append;
//      FieldByname('nama').AsString := Edit3.Text;
//      FieldByname('username').AsString := Edit1.Text;
//      FieldByName('password').AsString := Edit2.Text;
//      FieldByname('email').AsString := Edit4.Text;
//      FieldByname('hak_akses').AsString := ComboBox1.Text;
//      FieldByname('no_hp').AsString := Edit5.Text;
//      Post;
//      Label7.Caption := IntToStr(DataModule1.ZQueryUser.RecordCount);
//      Showmessage('Data berhasil ditambahkan');
//
//      Edit3.Clear;
//      Edit1.Clear;
//      Edit2.Clear;
//      Edit4.Clear;
//      ComboBox1.ItemIndex := -1;
//      Edit5.Clear;
//    end;
//end;
end;

procedure TFormUser.Button3Click(Sender: TObject);
begin
if edit3.Text = '' then
  begin
    Showmessage('Nama masih kosong');
    edit3.SetFocus;
  end else
if edit1.Text = '' then
  begin
    Showmessage('Username masih kosong');
    edit1.SetFocus;
  end else
  if edit2.Text = '' then
  begin
    Showmessage('Password masih kosong');
    edit2.SetFocus;
  end else
  if edit4.Text = '' then
  begin
    Showmessage('Email masih kosong');
    edit4.SetFocus;
  end else
  if ComboBox1.Text = '' then
  begin
    Showmessage('Hak Akses masih kosong');
    ComboBox1.SetFocus;
  end else
  if edit5.Text = '' then
  begin
    Showmessage('No Hp masih kosong');
    edit5.SetFocus;
  end else
  begin
    if (edit3.Text <> '') and (edit1.Text <> '') and (edit2.Text <> '') and (edit4.Text <> '') and (ComboBox1.ItemIndex >= 0) and (edit5.Text <> '') then
      begin
      try
        var IDUser: Integer := DataModule1.ZQueryUser.FieldByName('id_account').AsInteger;

        DataModule1.ZQueryUser.SQL.Text := 'UPDATE akun SET nama = :nama, username = :username, password = :password, email = :email, hak_akses = :hak_akses, no_hp = :no_hp WHERE id_account = :id_account';
        DataModule1.ZQueryUser.Params.ParamByName('nama').Value := Edit3.Text;
        DataModule1.ZQueryUser.Params.ParamByName('username').Value := Edit1.Text;
        DataModule1.ZQueryUser.Params.ParamByName('password').Value := Edit2.Text;
        DataModule1.ZQueryUser.Params.ParamByName('email').Value := Edit4.Text;
        DataModule1.ZQueryUser.Params.ParamByName('hak_akses').Value := ComboBox1.Text;
        DataModule1.ZQueryUser.Params.ParamByName('no_hp').Value := Edit5.Text;
        DataModule1.ZQueryUser.Params.ParamByName('id_account').Value := IDUser;
        DataModule1.ZQueryUser.ExecSQL;

        DataModule1.ZQueryUser.Close;
        DataModule1.ZQueryUser.SQL.Text := 'SELECT * FROM akun';
        DataModule1.ZQueryUser.Open;

        Label7.Caption := IntToStr(DataModule1.ZQueryUser.RecordCount);
        ShowMessage('Data berhasil diubah');
        Edit3.Clear;
        Edit1.Clear;
        Edit2.Clear;
        Edit4.Clear;
        ComboBox1.ItemIndex := -1;
        Edit5.Clear;
        except
          on E: Exception do
          begin
            ShowMessage('Error: ' + E.Message);
          end;
        end;
      end
  end;
//  begin
//    with DataModule1.ZQueryUser do
//    begin
//      Edit;
//      FieldByname('nama').AsString := Edit3.Text;
//      FieldByname('username').AsString := Edit1.Text;
//      FieldByName('password').AsString := Edit2.Text;
//      FieldByname('email').AsString := Edit4.Text;
//      FieldByname('hak_akses').AsString := ComboBox1.Text;
//      FieldByname('no_hp').AsString := Edit5.Text;
//      Post;
//      Showmessage('Data berhasil diubah');
//
//      Edit3.Clear;
//      Edit1.Clear;
//      Edit2.Clear;
//      Edit4.Clear;
//      ComboBox1.ItemIndex := -1;
//      Edit5.Clear;
//    end;
//  end;
end;

procedure TFormUser.Button4Click(Sender: TObject);
begin
//if messageDlg('Apakah yakin data '+ DataModule1.ZQueryUser.FieldByName('username').AsString+' akan dihapus?',mtConfirmation,[Mbyes,Mbno],0)=mryes then
//  begin
//    DataModule1.ZQueryUser.Delete;
//
//    DataModule1.ZQueryUser.SQL.Text := 'ALTER TABLE akun AUTO_INCREMENT = 1';
//    DataModule1.ZQueryUser.ExecSQL;
//
//    DataModule1.ZQueryUser.Close;
//    DataModule1.ZQueryUser.SQL.Text := 'SELECT * FROM akun';
//    DataModule1.ZQueryUser .Open;
//
//    Label7.Caption := IntToStr(DataModule1.ZQueryUser.RecordCount);
//    ShowMessage('Data berhasil dihapus');
//
//    Edit3.Clear;
//    Edit1.Clear;
//    Edit2.Clear;
//    Edit4.Clear;
//    ComboBox1.ItemIndex := -1;
//    Edit5.Clear;
//  end;

try
  if messageDlg('Apakah yakin data '+ DataModule1.ZQueryUser.FieldByName('username').AsString+' akan dihapus?',mtConfirmation,[Mbyes,Mbno],0)=mryes then
  begin
    var IDUser: Integer := DataModule1.ZQueryUser.FieldByName('id_account').AsInteger;

    if not DataModule1.ZQueryUser.IsEmpty then
    begin
    DataModule1.ZQueryUser.Close;

    DataModule1.ZQueryUser.SQL.Text := 'DELETE FROM akun WHERE id_account = :id_account';
    DataModule1.ZQueryUser.Params.ParamByName('id_account').Value := IDUser;
    DataModule1.ZQueryUser.ExecSQL;

    DataModule1.ZQueryUser.SQL.Text := 'ALTER TABLE akun AUTO_INCREMENT = 1';
    DataModule1.ZQueryUser.ExecSQL;

    DataModule1.ZQueryUser.Close;
    DataModule1.ZQueryUser.SQL.Text := 'SELECT * FROM akun';
    DataModule1.ZQueryUser.Open;

    Label7.Caption := IntToStr(DataModule1.ZQueryUser.RecordCount);
    ShowMessage('Data berhasil dihapus');
    Edit3.Clear;
    Edit1.Clear;
    Edit2.Clear;
    Edit4.Clear;
    ComboBox1.ItemIndex := -1;
    Edit5.Clear;
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

procedure TFormUser.Button6Click(Sender: TObject);
begin
  Edit3.Clear;
  Edit1.Clear;
  Edit2.Clear;
  Edit4.Clear;
  ComboBox1.ItemIndex := -1;
  Edit5.Clear;

end;

procedure TFormUser.DBGrid1CellClick(Column: TColumn);
var
  SelectedValue : String;
begin
  Edit3.Text:=DataModule1.ZQueryUser.FieldByName('nama').AsString;
  Edit1.Text := DataModule1.ZQueryUser.FieldByName('username').AsString;
  Edit2.Text:=DataModule1.ZQueryUser.FieldByName('password').AsString;
  Edit4.Text:=DataModule1.ZQueryUser.FieldByName('email').AsString;
  if not DataModule1.ZQueryUser.IsEmpty then
    begin
      SelectedValue := DataModule1.ZQueryUser.FieldByName('hak_akses').AsString;

      ComboBox1.Clear;

      ComboBox1.Items.Add('1');
      ComboBox1.Items.Add('2');

      ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(SelectedValue);
    end;
  Edit5.Text:=DataModule1.ZQueryUser.FieldByName('no_hp').AsString;
end;

procedure TFormUser.Edit6Change(Sender: TObject);
begin
    DataModule1.ZQueryUser.Close;
    DataModule1.ZQueryUser.SQL.Text := 'SELECT * FROM akun WHERE nama LIKE :Search';
    DataModule1.ZQueryUser.ParamByName('Search').AsString := '%' + Edit6.Text + '%';
    DataModule1.ZQueryUser.Open;

    Label7.Caption := IntToStr(DataModule1.ZQueryUser.RecordCount);
end;

procedure TFormUser.FormShow(Sender: TObject);
begin
  DataModule1.ZQueryUser.Active := True;
  Label7.Caption := IntToStr(DataModule1.ZQueryUser.RecordCount);
end;

end.
